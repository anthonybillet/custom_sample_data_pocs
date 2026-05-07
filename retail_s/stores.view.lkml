view: stores {
  sql_table_name: `ant-billet-looker-core-argolis.retail_s.stores` ;;
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.store_id ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: manager_name {
    type: string
    sql: ${TABLE}.manager_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id, manager_name, store_name, orders.count]
  }
}
