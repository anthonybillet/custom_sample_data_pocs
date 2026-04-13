view: unified_focus_cost {
  # We use a SQL derived table to create the unified Semantic Layer
  derived_table: {

    sql:
    -- AWS MAPPING
    SELECT
    'AWS' AS ProviderName,
    CAST (line_item_usage_start_date AS TIMESTAMP) AS ChargePeriodStart,
    line_item_usage_account_id AS SubAccountId,
    product_product_name AS ServiceName,
    product_product_family AS ServiceCategory,
    line_item_availability_zone AS RegionId,
    line_item_unblended_cost AS BilledCost,
    line_item_usage_amount AS ConsumedQuantity,
    pricing_unit AS ConsumedUnit
    FROM ${aws_billing_export.SQL_TABLE_NAME}

    UNION ALL

    -- GCP MAPPING
    SELECT
    'GCP' AS ProviderName,
    CAST(usage_start_time AS TIMESTAMP) AS ChargePeriodStart,
    project.id AS SubAccountId,
    service.description AS ServiceName,
    cost_type AS ServiceCategory, -- Simplification for demo
    location.region AS RegionId,
    cost AS BilledCost,
    usage.amount AS ConsumedQuantity,
    usage.unit AS ConsumedUnit
    FROM ${gcp_billing_export.SQL_TABLE_NAME}

    UNION ALL

    -- OCI MAPPING
    SELECT
    'OCI' AS ProviderName,
    CAST(ChargePeriodStart AS TIMESTAMP) AS ChargePeriodStart,
    SubAccountId AS SubAccountId,
    ServiceName AS ServiceName,
    ServiceCategory AS ServiceCategory,
    Region AS RegionId,
    BilledCost AS BilledCost,
    UsageQuantity AS ConsumedQuantity,
    UsageUnit AS ConsumedUnit
    FROM ${oci_billing_export.SQL_TABLE_NAME}
    ;;
    datagroup_trigger: midnight_et_refresh
  }
  #   sql:
  #     SELECT
  #       'AWS' AS provider_name,
  #       CAST(bill_billing_period_start_date AS DATE) AS charge_period_start_date,
  #       CAST(bill_billing_period_end_date AS DATE) AS charge_period_end_date,
  #       CAST(line_item_usage_account_id AS STRING) AS sub_account_id,
  #       CAST(product_category AS STRING) AS service_category,
  #       CAST(product_servicename AS STRING) AS service_name,
  #       CAST(product_region AS STRING) AS region_id,
  #       CAST(line_item_unblended_cost AS FLOAT64) AS billed_cost
  #     FROM ${aws_billing_export.SQL_TABLE_NAME}

  #     UNION ALL

  #     SELECT
  #       'GCP' AS provider_name,
  #       CAST(usage_start_time AS DATE) AS charge_period_start_date,
  #       CAST(usage_end_time AS DATE) AS charge_period_end_date,
  #       CAST(project.id AS STRING) AS sub_account_id,
  #       CAST(service.description AS STRING) AS service_category,
  #       CAST(sku.description AS STRING) AS service_name,
  #       CAST(location.region AS STRING) AS region_id,
  #       CAST(cost AS FLOAT64) AS billed_cost
  #     FROM ${gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b.SQL_TABLE_NAME}

  #     UNION ALL

  #     SELECT
  #       'OCI' AS provider_name,
  #       CAST(BillingPeriodStart AS DATE) AS charge_period_start_date,
  #       CAST(BillingPeriodEnd AS DATE) AS charge_period_end_date,
  #       CAST(SubAccountId AS STRING) AS sub_account_id,
  #       CAST(ChargeCategory AS STRING) AS service_category,
  #       CAST(ServiceName AS STRING) AS service_name,
  #       CAST(Region AS STRING) AS region_id,
  #       CAST(BilledCost AS FLOAT64) AS billed_cost
  #     FROM ${oci_billing_export.SQL_TABLE_NAME}
  #     ;;
  # }

  dimension: provider_name {
    label: "Cloud Provider Name"
    type: string
    description: "The name of the cloud service provider (GCP, AWS, OCI)."
    sql: ${TABLE}.ProviderName ;;
    drill_fields: [sub_account_id, service_category, service_name, region_id]
  }

  dimension_group: charge_period_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    description: "The start date of the usage or charge."
    sql: ${TABLE}.ChargePeriodStart ;;
  }

  dimension: sub_account_id {
    type: string
    description: "AWS Linked Account, GCP Project ID, or OCI Compartment/SubAccount."
    sql: ${TABLE}.SubAccountId ;;
    drill_fields: [service_category, service_name, region_id]
  }

  dimension: service_name {
    type: string
    description: "The normalized name of the cloud service (e.g., Amazon EC2, Compute Engine)."
    sql: ${TABLE}.ServiceName ;;
    drill_fields: [sub_account_id, region_id]
  }

  dimension: service_category {
    type: string
    description: "High-level category (e.g., Compute, Storage, Networking)."
    sql: ${TABLE}.ServiceCategory ;;
    drill_fields: [sub_account_id, service_name, region_id]
  }

  dimension: region_id {
    type: string
    description: "The geographic region where the resource was deployed."
    sql: ${TABLE}.RegionId ;;
    drill_fields: [sub_account_id, service_category, service_name]
  }

  # --- Measures ---

  measure: total_billed_cost {
    type: sum
    value_format_name: usd
    description: "The unblended, actual cash cost charged for the period."
    sql: ${TABLE}.BilledCost ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.0,\"K\";$0"
    drill_fields: [provider_name, sub_account_id, service_name, total_billed_cost]
  }

  measure: total_consumed_quantity {
    type: sum
    description: "The raw usage amount (hours, GBs, etc)."
    value_format: "[>=1000000000]0.00,,,\"B\";[>=1000000]0.0,,\"K\";0.0,"
    sql: ${TABLE}.ConsumedQuantity ;;
  }
}
