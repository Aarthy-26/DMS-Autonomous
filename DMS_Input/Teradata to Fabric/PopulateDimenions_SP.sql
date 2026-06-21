/**************************************************************************
    File Name      : POPULATE_DIMENSIONS_TD.sql
    Procedure Name : POPULATE_DIMENSIONS
    Database       : Teradata DW
    Purpose        : Load and maintain Dimension tables from staging layer
    Author         : <Your Name / Team>
    Created Date   : <YYYY-MM-DD>
    Last Modified  : <YYYY-MM-DD>
    Version        : 1.3
***************************************************************************
    Description:
    - Populates DIM_ORGANISATION, DIM_CORPORATION, and DIM_PRODUCT
      using data from STG_DIMENSION_DATA.
    - Uses MERGE statements (UPSERT) to ensure idempotent loads.
    - Applies data quality filters and excludes test/legacy data.
**************************************************************************/

REPLACE PROCEDURE POPULATE_DIMENSIONS()
BEGIN
    ----------------------------------------------------------------------
    -- Variable Declarations
    ----------------------------------------------------------------------
    DECLARE v_row_count INTEGER DEFAULT 0;

    ----------------------------------------------------------------------
    -- Audit Start
    ----------------------------------------------------------------------
    CALL DBC.SysExecSQL(
        'INSERT INTO AUDIT_LOG (procedure_name, start_time, status)
         VALUES (''POPULATE_DIMENSIONS'', CURRENT_TIMESTAMP, ''STARTED'')'
    );

    ----------------------------------------------------------------------
    -- 1. Populate DIM_ORGANISATION
    ----------------------------------------------------------------------
    CALL DBC.SysExecSQL('DELETE FROM WORK_ORGANISATION_TEMP;');

    INSERT INTO WORK_ORGANISATION_TEMP
    SELECT DISTINCT
        organisation_id,
        organisation,
        organisation_name
    FROM STG_DIMENSION_DATA
    WHERE organisation_id IS NOT NULL
      AND CHAR_LENGTH(TRIM(organisation_id)) > 3;

    MERGE INTO DIM_ORGANISATION AS TGT
    USING WORK_ORGANISATION_TEMP AS SRC
    ON TGT.organisation_id = SRC.organisation_id
    WHEN NOT MATCHED THEN
        INSERT (
            organisation_id,
            organisation,
            organisation_name
        )
        VALUES (
            SRC.organisation_id,
            SRC.organisation,
            SRC.organisation_name
        );

    GET DIAGNOSTICS v_row_count = ROW_COUNT;

    CALL DBC.SysExecSQL(
        'INSERT INTO AUDIT_LOG
         (procedure_name, table_name, record_count, status, log_time)
         VALUES
         (''POPULATE_DIMENSIONS'', ''DIM_ORGANISATION'', '
         || v_row_count ||
         ', ''LOADED'', CURRENT_TIMESTAMP)'
    );

    ----------------------------------------------------------------------
    -- 2. Populate DIM_CORPORATION
    ----------------------------------------------------------------------
    CALL DBC.SysExecSQL('DELETE FROM WORK_CORPORATION_TEMP;');

    INSERT INTO WORK_CORPORATION_TEMP
    SELECT DISTINCT
        corporation_id,
        corp_id,
        corporation,
        corporation_name,
        sub_corporation,
        sub_corporation_id,
        sub_corporation_name,
        master_corporation_dim_key,
        association,
        bin,
        company,
        company_id,
        company_name
    FROM STG_DIMENSION_DATA
    WHERE UPPER(TRIM(corporation_name)) NOT LIKE 'TEST%';

    MERGE INTO DIM_CORPORATION AS TGT
    USING WORK_CORPORATION_TEMP AS SRC
    ON TGT.corporation_id = SRC.corporation_id
    WHEN NOT MATCHED THEN
        INSERT (
            corporation_id, corp_id, corporation, corporation_name,
            sub_corporation, sub_corporation_id, sub_corporation_name,
            master_corporation_dim_key, association, bin, company,
            company_id, company_name
        )
        VALUES (
            SRC.corporation_id, SRC.corp_id, SRC.corporation,
            SRC.corporation_name, SRC.sub_corporation,
            SRC.sub_corporation_id, SRC.sub_corporation_name,
            SRC.master_corporation_dim_key, SRC.association,
            SRC.bin, SRC.company, SRC.company_id, SRC.company_name
        );

    GET DIAGNOSTICS v_row_count = ROW_COUNT;

    CALL DBC.SysExecSQL(
        'INSERT INTO AUDIT_LOG
         (procedure_name, table_name, record_count, status, log_time)
         VALUES
         (''POPULATE_DIMENSIONS'', ''DIM_CORPORATION'', '
         || v_row_count ||
         ', ''LOADED'', CURRENT_TIMESTAMP)'
    );

    ----------------------------------------------------------------------
    -- 3. Populate DIM_PRODUCT
    ----------------------------------------------------------------------
    CALL DBC.SysExecSQL('DELETE FROM WORK_PRODUCT_TEMP;');

    INSERT INTO WORK_PRODUCT_TEMP
    SELECT DISTINCT
        product_id,
        product,
        product_description,
        sub_product,
        processing_code,
        processing_code_description,
        processing_group
    FROM STG_DIMENSION_DATA
    WHERE processing_group NOT IN ('DEPRECATED', 'LEGACY');

    MERGE INTO DIM_PRODUCT AS TGT
    USING WORK_PRODUCT_TEMP AS SRC
    ON TGT.product_id = SRC.product_id
    WHEN NOT MATCHED THEN
        INSERT (
            product_id, product, product_description, sub_product,
            processing_code, processing_code_description, processing_group
        )
        VALUES (
            SRC.product_id, SRC.product, SRC.product_description,
            SRC.sub_product, SRC.processing_code,
            SRC.processing_code_description, SRC.processing_group
        );

    GET DIAGNOSTICS v_row_count = ROW_COUNT;

    CALL DBC.SysExecSQL(
        'INSERT INTO AUDIT_LOG
         (procedure_name, table_name, record_count, status, log_time)
         VALUES
         (''POPULATE_DIMENSIONS'', ''DIM_PRODUCT'', '
         || v_row_count ||
         ', ''LOADED'', CURRENT_TIMESTAMP)'
    );

    ----------------------------------------------------------------------
    -- Audit Completion
    ----------------------------------------------------------------------
    CALL DBC.SysExecSQL(
        'INSERT INTO AUDIT_LOG (procedure_name, end_time, status)
         VALUES (''POPULATE_DIMENSIONS'', CURRENT_TIMESTAMP, ''COMPLETED'')'
    );

END;
