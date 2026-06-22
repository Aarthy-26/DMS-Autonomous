# DMS AGENT EXECUTION REPORT

**Run ID** : RUN-20250520-001
**Date** : 2025-05-20
**Model Used** : GPT-4o
**Pipelines** : 2
**Run Started** : 10:00:00
**Last Updated** : 10:30:00
**Status** : FAILED ❌

---

## PIPELINE SUMMARY

| Pipeline | Source | Target | Workbench | Status |
|----------|--------|--------|-----------|--------|
| P1 | INFORMATICA | Fabric | Informatica To Fabric (IDs: 139, 141, 142) | FAILED ❌ |
| P2 | TERADATA | Fabric | Teradata to Fabric (IDs: 140, 143) | FAILED ❌ |

---

## TASKS CONFIGURED

| Task | Required | P1 Status | P2 Status |
|------|----------|-----------|-----------|
| ANALYZE | Yes | FAILED ❌ | FAILED ❌ |
| DOCUMENT | Yes | NOT REACHED 🚫 | NOT REACHED 🚫 |
| CONVERT | Yes | NOT REACHED 🚫 | NOT REACHED 🚫 |
| FUNCTIONAL_TEST | Yes | NOT REACHED 🚫 | NOT REACHED 🚫 |
| UNIT_TEST | Yes | NOT REACHED 🚫 | NOT REACHED 🚫 |
| RECONCILIATION | Yes | NOT REACHED 🚫 | NOT REACHED 🚫 |
| CONVERSION_TEST | Yes | NOT REACHED 🚫 | NOT REACHED 🚫 |
| REVIEW | Yes | NOT REACHED 🚫 | NOT REACHED 🚫 |

---

## EXECUTION LOG

| Step | Pipeline | Action | Detail | Status | Time |
|------|----------|--------|--------|--------|------|
| 1 | — | Inputs Validated | All 4 inputs confirmed. P1: INFORMATICA→Fabric, P2: TERADATA→Fabric | COMPLETED ✅ | 10:00:00 |
| 2 | — | Generate Access Token | Token generated successfully | COMPLETED ✅ | 10:00:10 |
| 3 | P1 | Load Initial Tech Options | Source & Target tech list loaded successfully | COMPLETED ✅ | 10:00:20 |
| 4 | P1 | Load Mapped Target Tech | INFORMATICA target mapping loaded. Fabric available | COMPLETED ✅ | 10:00:30 |
| 5 | P1 | Create Workbench | Workbench "Informatica To Fabric" created. WorkbenchId: 139 | COMPLETED ✅ | 10:00:40 |
| 6 | P2 | Load Initial Tech Options | Source & Target tech list loaded successfully | COMPLETED ✅ | 10:00:50 |
| 7 | P2 | Load Mapped Target Tech | TERADATA target mapping loaded. Fabric available | COMPLETED ✅ | 10:00:55 |
| 8 | P2 | Create Workbench | Workbench "Teradata to Fabric" created. WorkbenchId: 140 | COMPLETED ✅ | 10:01:00 |
| 9 | P1 | Fetch Domain File List (pre-upload) | WorkbenchId: 139 — 0 files (empty, expected) | COMPLETED ✅ | 10:01:10 |
| 10 | P1 | Upload File | Inventory_Stage_Load_Mapping.xml → domain: Sales, WB: 139, DomainId: 359 | COMPLETED ✅ | 10:01:20 |
| 11 | P1 | Poll Domain File List — Attempt 1 | File confirmed: Inventory_Stage_Load_Mapping (DomainId: 359, UPLOADED) | COMPLETED ✅ | 10:01:30 |
| 12 | P2 | Fetch Domain File List (pre-upload) | WorkbenchId: 140 — 0 files (empty, expected) | COMPLETED ✅ | 10:01:40 |
| 13 | P2 | Upload File | FACT_SALES_LOAD.btq → domain: Sales, WB: 140, DomainId: 360 | COMPLETED ✅ | 10:01:50 |
| 14 | P2 | Poll Domain File List — Attempt 1 | File confirmed: FACT_SALES_LOAD (DomainId: 360, UPLOADED) | COMPLETED ✅ | 10:02:00 |
| 15 | P1 | ANALYZE — Submit Attempt 1 | WB:139, DomainId:359, platform:aws — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:02:10 |
| 16 | — | Token Refresh | New access token obtained | COMPLETED ✅ | 10:05:00 |
| 17 | P1 | ANALYZE — Submit Attempt 2 | WB:139, DomainId:359, platform:aws — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:05:10 |
| 18 | P1 | ANALYZE — Submit Attempt 3 | WB:139, DomainId:359, platform:aws — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:05:20 |
| 19 | P1 | Create New Workbench (retry) | "Informatica To Fabric_20250520101500" created. WorkbenchId: 141 | COMPLETED ✅ | 10:08:00 |
| 20 | P1 | Upload File (WB 141) | Inventory_Stage_Load_Mapping.xml → DomainId: 361 | COMPLETED ✅ | 10:08:10 |
| 21 | P1 | ANALYZE — Submit Attempt 4 | WB:141, DomainId:361, platform:aws — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:08:20 |
| 22 | — | Token Refresh | New access token obtained | COMPLETED ✅ | 10:12:00 |
| 23 | P1 | Create New Workbench (retry 2) | "Informatica To Fabric_20250520102000" created. WorkbenchId: 142 | COMPLETED ✅ | 10:15:00 |
| 24 | P1 | Upload File (WB 142) | Inventory_Stage_Load_Mapping.xml → DomainId: 362 | COMPLETED ✅ | 10:15:10 |
| 25 | P1 | ANALYZE — Submit Attempt 5 | WB:142, DomainId:362, platform:aws — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:15:20 |
| 26 | P1 | ANALYZE — Submit Attempt 6 | platform:INFORMATICA — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:15:30 |
| 27 | P1 | ANALYZE — Submit Attempt 7 | platform:Fabric — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:15:40 |
| 28 | P1 | ANALYZE — Submit Attempt 8 | platform:azure — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:15:50 |
| 29 | P1 | ANALYZE — Submit Attempt 9 | platform:gcp — HTTP 401: Token expired | FAILED ❌ | 10:16:00 |
| 30 | — | Token Refresh | New access token obtained | COMPLETED ✅ | 10:18:00 |
| 31 | P1 | ANALYZE — Submit Attempt 10 | platform:aws — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:18:10 |
| 32 | P1 | ANALYZE — Submit Attempt 11 | platform:InformaticaToFabric_20250520102000 — HTTP 400 | FAILED ❌ | 10:18:20 |
| 33 | P1 | ANALYZE — Submit Attempt 12 | platform:Sales — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:18:30 |
| 34 | P1 | ANALYZE — Submit Attempt 13 | platform:SNOWFLAKE — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:18:40 |
| 35 | P1 | PIPELINE P1 STOPPED | Persistent HTTP 400 — Pipeline ID not found. P1 FAILED. | FAILED ❌ | 10:25:00 |
| 36 | P2 | ANALYZE — Submit Attempt 1 | WB:140, DomainId:360, platform:aws — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:25:10 |
| 37 | P2 | Create New Workbench (retry) | "Teradata to Fabric_20250520102500" created. WorkbenchId: 143 | COMPLETED ✅ | 10:26:00 |
| 38 | P2 | Upload File (WB 143) | FACT_SALES_LOAD.btq → DomainId: 363 | COMPLETED ✅ | 10:26:10 |
| 39 | P2 | Poll Domain File List — Attempt 1 | File confirmed: FACT_SALES_LOAD (DomainId: 363, UPLOADED) | COMPLETED ✅ | 10:26:20 |
| 40 | P2 | ANALYZE — Submit Attempt 2 | WB:143, DomainId:363, platform:aws — HTTP 400: Pipeline ID not found | FAILED ❌ | 10:26:30 |
| 41 | P2 | PIPELINE P2 STOPPED | Persistent HTTP 400 — Pipeline ID not found. P2 FAILED. | FAILED ❌ | 10:30:00 |

---

## ERRORS AND WARNINGS

| # | Pipeline | Error | Detail |
|---|----------|-------|--------|
| 1 | P1 | HTTP 400 — Pipeline ID not found | Analysis API /domain/analysis/v2 returns "Pipeline ID not found" for INFORMATICA→Fabric across all workbench IDs (139, 141, 142), all domain IDs (359, 361, 362), and all platform values (aws, azure, gcp, Fabric, INFORMATICA, SNOWFLAKE, Sales, InformaticaToFabric). Root cause: INFORMATICA→Fabric AI pipeline is not registered in the backend pipeline registry. |
| 2 | P2 | HTTP 400 — Pipeline ID not found | Analysis API /domain/analysis/v2 returns "Pipeline ID not found" for TERADATA→Fabric across workbench IDs (140, 143) and domain IDs (360, 363). Root cause: TERADATA→Fabric AI pipeline is not registered in the backend pipeline registry. |

---

## UPLOAD SUMMARY

| Pipeline | Mode | Files | Status |
|----------|------|-------|--------|
| P1 | SPECIFIC | Inventory_Stage_Load_Mapping.xml | UPLOADED ✅ (DomainIds: 359, 361, 362) |
| P2 | SPECIFIC | FACT_SALES_LOAD.btq | UPLOADED ✅ (DomainIds: 360, 363) |

---

## ROOT CAUSE ANALYSIS

The DMS backend returns `{message=Pipeline ID not found, success=false}` (HTTP 400) for the `/domain/analysis/v2` endpoint for both:
- **INFORMATICA → Fabric** pipeline
- **TERADATA → Fabric** pipeline

This error is returned regardless of:
- WorkbenchId used (139, 140, 141, 142, 143)
- DomainId used (359, 360, 361, 362, 363)
- Platform value used (aws, azure, gcp, Fabric, INFORMATICA, SNOWFLAKE, Sales)
- Access token freshness

**Conclusion**: The AI analysis pipeline for these source→target combinations is not configured/registered in the backend DMS pipeline registry. This requires backend administrator intervention to register the INFORMATICA→Fabric and TERADATA→Fabric pipeline configurations.

---

*Last updated: 10:30:00*
*Audit Log Reference: RUN-20250520-001*
