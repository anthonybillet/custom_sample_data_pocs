view: orders {
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.orders` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.orders_v2` ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: fill_request_id {
    type: number
    hidden: yes
    sql: ${TABLE}.fill_request_id ;;
  }
  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }
  dimension: order_price {
    hidden: yes
    type: number
    sql: ${TABLE}.order_price ;;
  }
  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }
  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type ;;
  }
  dimension_group: record_created {
    hidden: yes
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.record_created_at ;;
  }
  dimension_group: record_updated {
    hidden: yes
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.record_updated_at ;;
  }
  measure: count {
    label: "# of Orders"
    type: count
  }
  measure: total_order_price {
    type: sum
    value_format_name: usd_0
    sql: ${order_price} ;;
  }

  drill_fields: [order_details*]

  set: order_details {
    fields: [order_id, record_created_time, order_status, order_type, order_price]
  }
}
