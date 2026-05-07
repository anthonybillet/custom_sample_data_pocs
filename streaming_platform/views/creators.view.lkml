view: creators {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.creators_2` ;;

  dimension_group: account_created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.account_created_at ;;
  }
  dimension: creator_id {
    type: number
    sql: ${TABLE}.creator_id ;;
  }
  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }
  measure: count {
    type: count
    drill_fields: [username]
  }
}
