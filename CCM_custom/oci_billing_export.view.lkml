# The name of this view in Looker is "Oci Billing Export"
view: oci_billing_export {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ant-billet-looker-core-argolis.CCM.oci_billing_export` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Availability Zone" in Explore.

  dimension: availability_zone {
    type: string
    sql: ${TABLE}.AvailabilityZone ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: CONCAT(${sub_account_id}, '-', CAST(${charge_period_start_raw} AS STRING), '-', ${service_name}) ;;
    hidden: yes
  }

  dimension: billed_cost {
    type: number
    sql: ${TABLE}.BilledCost ;;
    hidden: yes
  }

  measure: total_billed_cost {
    type: sum
    sql: ${billed_cost} ;;
    value_format_name: usd
    description: "Total Billed Cost for OCI"
  }

  dimension: billing_account_id {
    type: number
    sql: ${TABLE}.BillingAccountId ;;
  }

  dimension: billing_account_name {
    type: string
    sql: ${TABLE}.BillingAccountName ;;
  }

  dimension: billing_currency {
    type: string
    sql: ${TABLE}.BillingCurrency ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: billing_period_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.BillingPeriodEnd ;;
  }

  dimension_group: billing_period_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.BillingPeriodStart ;;
  }

  dimension: charge_category {
    type: string
    sql: ${TABLE}.ChargeCategory ;;
  }

  dimension: charge_description {
    type: string
    sql: ${TABLE}.ChargeDescription ;;
  }

  dimension: charge_frequency {
    type: string
    sql: ${TABLE}.ChargeFrequency ;;
  }

  dimension_group: charge_period_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ChargePeriodEnd ;;
  }

  dimension_group: charge_period_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ChargePeriodStart ;;
  }

  dimension: charge_subcategory {
    type: string
    sql: ${TABLE}.ChargeSubcategory ;;
  }

  dimension: commitment_discount_category {
    type: string
    sql: ${TABLE}.CommitmentDiscountCategory ;;
  }

  dimension: commitment_discount_id {
    type: string
    sql: ${TABLE}.CommitmentDiscountId ;;
  }

  dimension: commitment_discount_name {
    type: string
    sql: ${TABLE}.CommitmentDiscountName ;;
  }

  dimension: commitment_discount_type {
    type: string
    sql: ${TABLE}.CommitmentDiscountType ;;
  }

  dimension: effective_cost {
    type: number
    sql: ${TABLE}.EffectiveCost ;;
  }

  dimension: invoice_issuer {
    type: string
    sql: ${TABLE}.InvoiceIssuer ;;
  }

  dimension: list_cost {
    type: number
    sql: ${TABLE}.ListCost ;;
    hidden: yes
  }

  dimension: list_unit_price {
    type: number
    sql: ${TABLE}.ListUnitPrice ;;
    hidden: yes
  }

  dimension: oci_attributed_cost {
    type: number
    sql: ${TABLE}.oci_AttributedCost ;;
  }

  dimension: oci_attributed_usage {
    type: number
    sql: ${TABLE}.oci_AttributedUsage ;;
  }

  dimension: oci_back_reference_number {
    type: string
    sql: ${TABLE}.oci_BackReferenceNumber ;;
  }

  dimension: oci_billed_quantity_overage {
    type: string
    sql: ${TABLE}.oci_BilledQuantityOverage ;;
  }

  dimension: oci_compartment_id {
    type: string
    sql: ${TABLE}.oci_CompartmentId ;;
  }

  dimension: oci_compartment_name {
    type: string
    sql: ${TABLE}.oci_CompartmentName ;;
  }

  dimension: oci_cost_overage {
    type: string
    sql: ${TABLE}.oci_CostOverage ;;
  }

  dimension: oci_overage_flag {
    type: yesno
    sql: ${TABLE}.oci_OverageFlag ;;
  }

  dimension: oci_reference_number {
    type: string
    sql: ${TABLE}.oci_ReferenceNumber ;;
  }

  dimension: oci_unit_price_overage {
    type: string
    sql: ${TABLE}.oci_UnitPriceOverage ;;
  }

  dimension: pricing_category {
    type: string
    sql: ${TABLE}.PricingCategory ;;
  }

  dimension: pricing_quantity {
    type: number
    sql: ${TABLE}.PricingQuantity ;;
  }

  dimension: pricing_unit {
    type: string
    sql: ${TABLE}.PricingUnit ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.Provider ;;
  }

  dimension: publisher {
    type: string
    sql: ${TABLE}.Publisher ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: resource_id {
    type: string
    sql: ${TABLE}.ResourceId ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}.ResourceName ;;
  }

  dimension: resource_type {
    type: string
    sql: ${TABLE}.ResourceType ;;
  }

  dimension: service_category {
    type: string
    sql: ${TABLE}.ServiceCategory ;;
  }

  dimension: service_name {
    type: string
    sql: ${TABLE}.ServiceName ;;
  }

  dimension: sku_id {
    type: string
    sql: ${TABLE}.SkuId ;;
  }

  dimension: sku_price_id {
    type: string
    sql: ${TABLE}.SkuPriceId ;;
  }

  dimension: sub_account_id {
    type: string
    sql: ${TABLE}.SubAccountId ;;
  }

  dimension: sub_account_name {
    type: string
    sql: ${TABLE}.SubAccountName ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.Tags ;;
  }

  dimension: usage_quantity {
    type: number
    sql: ${TABLE}.UsageQuantity ;;
  }

  dimension: usage_unit {
    type: string
    sql: ${TABLE}.UsageUnit ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      resource_name,
      oci_compartment_name,
      service_name,
      commitment_discount_name,
      sub_account_name,
      billing_account_name
    ]
  }

}
