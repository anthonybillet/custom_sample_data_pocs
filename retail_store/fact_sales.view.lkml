view: fact_sales {
  sql_table_name: `ant-billet-looker-core-argolis.retail_store.fact_sales` ;;

  dimension_group: _etl_loaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._etl_loaded_at ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }
  dimension: gross_sales_amount {
    type: number
    sql: ${TABLE}.gross_sales_amount ;;
  }
  dimension: is_return {
    type: yesno
    sql: ${TABLE}.is_return ;;
  }
  dimension: net_sales_amount {
    type: number
    sql: ${TABLE}.net_sales_amount ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }
  dimension: promotion_id {
    type: string
    sql: ${TABLE}.promotion_id ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }
  dimension: source_system {
    type: string
    sql: ${TABLE}.source_system ;;
  }
  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }
  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }
  dimension: total_cost_amount {
    type: number
    sql: ${TABLE}.total_cost_amount ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_date ;;
  }
  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }
  dimension: transaction_line_id {
    type: string
    sql: ${TABLE}.transaction_line_id ;;
  }
  dimension_group: transaction_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.transaction_timestamp ;;
  }
  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }
  measure: count {
    type: count
  }
}
