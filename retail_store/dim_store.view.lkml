view: dim_store {
  sql_table_name: `ant-billet-looker-core-argolis.retail_store.dim_store` ;;

  dimension_group: _etl_loaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._etl_loaded_at ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: open {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.open_date ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: source_system {
    type: string
    sql: ${TABLE}.source_system ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }
  dimension: store_type {
    type: string
    sql: ${TABLE}.store_type ;;
  }
  dimension: total_square_footage {
    type: number
    sql: ${TABLE}.total_square_footage ;;
  }
  measure: count {
    type: count
    drill_fields: [store_name]
  }
}
