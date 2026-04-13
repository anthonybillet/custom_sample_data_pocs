# The name of this view in Looker is "Gcp Billing Export Resource V1 01 B354 1 B98 A3 Cb559 B"
view: gcp_billing_export {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ant-billet-looker-core-argolis.CCM.gcp_billing_export` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: CONCAT(${project__id}, '-', CAST(${usage_start_raw} AS STRING), '-', ${service__id}) ;;
    hidden: yes
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _partitiondate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: adjustment_info__description {
    type: string
    sql: ${TABLE}.adjustment_info.description ;;
    group_label: "Adjustment Info"
    group_item_label: "Description"
  }

  dimension: adjustment_info__id {
    type: string
    sql: ${TABLE}.adjustment_info.id ;;
    group_label: "Adjustment Info"
    group_item_label: "ID"
  }

  dimension: adjustment_info__mode {
    type: string
    sql: ${TABLE}.adjustment_info.mode ;;
    group_label: "Adjustment Info"
    group_item_label: "Mode"
  }

  dimension: adjustment_info__type {
    type: string
    sql: ${TABLE}.adjustment_info.type ;;
    group_label: "Adjustment Info"
    group_item_label: "Type"
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: consumption_model__description {
    type: string
    sql: ${TABLE}.consumption_model.description ;;
    group_label: "Consumption Model"
    group_item_label: "Description"
  }

  dimension: consumption_model__id {
    type: string
    sql: ${TABLE}.consumption_model.id ;;
    group_label: "Consumption Model"
    group_item_label: "ID"
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
    hidden: yes
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
    description: "Total Cost for GCP"
  }

  dimension: cost_at_effective_price_default {
    type: number
    sql: ${TABLE}.cost_at_effective_price_default ;;
    hidden: yes
  }

  dimension: cost_at_list {
    type: number
    sql: ${TABLE}.cost_at_list ;;
    hidden: yes
  }

  dimension: cost_at_list_consumption_model {
    type: number
    sql: ${TABLE}.cost_at_list_consumption_model ;;
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }

  dimension: credits {
    hidden: yes
    sql: ${TABLE}.credits ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_conversion_rate {
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }

  dimension_group: export {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.export_time ;;
  }

  dimension: invoice__month {
    type: string
    sql: ${TABLE}.invoice.month ;;
    group_label: "Invoice"
    group_item_label: "Month"
  }

  dimension: invoice__publisher_type {
    type: string
    sql: ${TABLE}.invoice.publisher_type ;;
    group_label: "Invoice"
    group_item_label: "Publisher Type"
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: location__country {
    type: string
    sql: ${TABLE}.location.country ;;
    group_label: "Location"
    group_item_label: "Country"
  }

  dimension: location__location {
    type: string
    sql: ${TABLE}.location.location ;;
    group_label: "Location"
    group_item_label: "Location"
  }

  dimension: location__region {
    type: string
    sql: ${TABLE}.location.region ;;
    group_label: "Location"
    group_item_label: "Region"
  }

  dimension: location__zone {
    type: string
    sql: ${TABLE}.location.zone ;;
    group_label: "Location"
    group_item_label: "Zone"
  }

  dimension: price__effective_price {
    type: number
    sql: ${TABLE}.price.effective_price ;;
    group_label: "Price"
    group_item_label: "Effective Price"
  }

  dimension: price__effective_price_default {
    type: number
    sql: ${TABLE}.price.effective_price_default ;;
    group_label: "Price"
    group_item_label: "Effective Price Default"
  }

  dimension: price__list_price {
    type: number
    sql: ${TABLE}.price.list_price ;;
    group_label: "Price"
    group_item_label: "List Price"
  }

  dimension: price__list_price_consumption_model {
    type: number
    sql: ${TABLE}.price.list_price_consumption_model ;;
    group_label: "Price"
    group_item_label: "List Price Consumption Model"
  }

  dimension: price__pricing_unit_quantity {
    type: number
    sql: ${TABLE}.price.pricing_unit_quantity ;;
    group_label: "Price"
    group_item_label: "Pricing Unit Quantity"
  }

  dimension: price__tier_start_amount {
    type: number
    sql: ${TABLE}.price.tier_start_amount ;;
    group_label: "Price"
    group_item_label: "Tier Start Amount"
  }

  dimension: price__unit {
    type: string
    sql: ${TABLE}.price.unit ;;
    group_label: "Price"
    group_item_label: "Unit"
  }

  dimension: project__ancestors {
    hidden: yes
    sql: ${TABLE}.project.ancestors ;;
    group_label: "Project"
    group_item_label: "Ancestors"
  }

  dimension: project__ancestry_numbers {
    type: string
    sql: ${TABLE}.project.ancestry_numbers ;;
    group_label: "Project"
    group_item_label: "Ancestry Numbers"
  }

  dimension: project__id {
    type: string
    sql: ${TABLE}.project.id ;;
    group_label: "Project"
    group_item_label: "ID"
  }

  dimension: project__labels {
    hidden: yes
    sql: ${TABLE}.project.labels ;;
    group_label: "Project"
    group_item_label: "Labels"
  }

  dimension: project__name {
    type: string
    sql: ${TABLE}.project.name ;;
    group_label: "Project"
    group_item_label: "Name"
  }

  dimension: project__number {
    type: string
    sql: ${TABLE}.project.number ;;
    group_label: "Project"
    group_item_label: "Number"
  }

  dimension: resource__global_name {
    type: string
    sql: ${TABLE}.resource.global_name ;;
    group_label: "Resource"
    group_item_label: "Global Name"
  }

  dimension: resource__name {
    type: string
    sql: ${TABLE}.resource.name ;;
    group_label: "Resource"
    group_item_label: "Name"
  }

  dimension: seller_name {
    type: string
    sql: ${TABLE}.seller_name ;;
  }

  dimension: service__description {
    type: string
    sql: ${TABLE}.service.description ;;
    group_label: "Service"
    group_item_label: "Description"
  }

  dimension: service__id {
    type: string
    sql: ${TABLE}.service.id ;;
    group_label: "Service"
    group_item_label: "ID"
  }

  dimension: sku__description {
    type: string
    sql: ${TABLE}.sku.description ;;
    group_label: "SKU"
    group_item_label: "Description"
  }

  dimension: sku__id {
    type: string
    sql: ${TABLE}.sku.id ;;
    group_label: "SKU"
    group_item_label: "ID"
  }

  dimension: subscription__instance_id {
    type: string
    sql: ${TABLE}.subscription.instance_id ;;
    group_label: "Subscription"
    group_item_label: "Instance ID"
  }

  dimension: system_labels {
    hidden: yes
    sql: ${TABLE}.system_labels ;;
  }

  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: usage__amount {
    type: number
    sql: ${TABLE}.usage.amount ;;
    group_label: "Usage"
    group_item_label: "Amount"
  }

  dimension: usage__amount_in_pricing_units {
    type: number
    sql: ${TABLE}.usage.amount_in_pricing_units ;;
    group_label: "Usage"
    group_item_label: "Amount In Pricing Units"
  }

  dimension: usage__pricing_unit {
    type: string
    sql: ${TABLE}.usage.pricing_unit ;;
    group_label: "Usage"
    group_item_label: "Pricing Unit"
  }

  dimension: usage__unit {
    type: string
    sql: ${TABLE}.usage.unit ;;
    group_label: "Usage"
    group_item_label: "Unit"
  }

  dimension_group: usage_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_end_time ;;
  }

  dimension_group: usage_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_start_time ;;
  }
  measure: count {
    type: count
    drill_fields: [seller_name, project__name, resource__name, resource__global_name]
  }
}

# The name of this view in Looker is "Gcp Billing Export Resource V1 01 B354 1 B98 A3 Cb559 B Tags"
view: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__tags {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__tags {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__tags ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Inherited" in Explore.

  dimension: inherited {
    type: yesno
    sql: inherited ;;
  }

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: namespace {
    type: string
    sql: namespace ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Gcp Billing Export Resource V1 01 B354 1 B98 A3 Cb559 B Labels"
view: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__labels {

  dimension: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__labels {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__labels ;;
  }

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Gcp Billing Export Resource V1 01 B354 1 B98 A3 Cb559 B Credits"
view: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__credits {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: id ;;
  }

  dimension: amount {
    type: number
    sql: amount ;;
  }

  dimension: full_name {
    type: string
    sql: full_name ;;
  }

  dimension: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__credits {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__credits ;;
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: type {
    type: string
    sql: type ;;
  }
}

# The name of this view in Looker is "Gcp Billing Export Resource V1 01 B354 1 B98 A3 Cb559 B System Labels"
view: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__system_labels {

  dimension: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__system_labels {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__system_labels ;;
  }

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Gcp Billing Export Resource V1 01 B354 1 B98 A3 Cb559 B Project Labels"
view: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__project__labels {

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

# The name of this view in Looker is "Gcp Billing Export Resource V1 01 B354 1 B98 A3 Cb559 B Project Ancestors"
view: gcp_billing_export_resource_v1_01_b354_1_b98_a3_cb559_b__project__ancestors {

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}.resource_name ;;
  }
}
