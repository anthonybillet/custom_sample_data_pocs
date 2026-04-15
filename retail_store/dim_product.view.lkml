view: dim_product {
  sql_table_name: `ant-billet-looker-core-argolis.retail_store.dim_product` ;;

  dimension_group: _etl_loaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._etl_loaded_at ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
  }
  dimension: current_retail_price {
    type: number
    sql: ${TABLE}.current_retail_price ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: source_system {
    type: string
    sql: ${TABLE}.source_system ;;
  }
  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }
  dimension: unit_cost {
    type: number
    sql: ${TABLE}.unit_cost ;;
  }
  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
