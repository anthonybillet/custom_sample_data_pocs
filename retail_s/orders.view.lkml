view: orders {
  sql_table_name: `ant-billet-looker-core-argolis.retail_s.orders` ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # --- NEW: Logistics Dimensions ---
  dimension: is_returned {
    type: yesno
    description: "Was this order returned?"
    sql: ${status} = 'Returned' OR ${TABLE}.returned_at IS NOT NULL ;;
  }

  dimension: days_to_ship {
    type: number
    description: "Days between order creation and shipping"
    sql: DATE_DIFF(${TABLE}.shipped_at, ${TABLE}.created_at, DAY) ;;
  }

  dimension: days_to_deliver {
    type: number
    description: "Days between shipping and delivery"
    sql: DATE_DIFF(${TABLE}.delivered_at, ${TABLE}.shipped_at, DAY) ;;
  }

  # --- NEW: Operational Measures ---

  measure: returned_count {
    type: count
    description: "Count of returned orders"
    filters: [is_returned: "yes"]
  }

  measure: return_rate {
    type: number
    description: "Percentage of orders that were returned"
    sql: 1.0 * ${returned_count} / NULLIF(${count}, 0) ;;
    value_format_name: percent_2
  }

  measure: average_days_to_ship {
    type: average
    sql: ${days_to_ship} ;;
    value_format_name: decimal_1
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [order_id, stores.store_id, stores.store_name, users.user_id, users.last_name, users.first_name, order_items.count]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  order_id,
  stores.store_id,
  stores.manager_name,
  stores.store_name,
  users.user_id,
  users.last_name,
  users.first_name,
  order_items.count
  ]
  }

}
