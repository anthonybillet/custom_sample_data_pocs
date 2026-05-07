view: broadcasts {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.broadcasts_2` ;;
  drill_fields: [broadcast_id, broadcast_start_time, broadcast_end_time]

  dimension: broadcast_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.broadcast_id ;;
  }


  dimension: creator_id {
    hidden: yes
    type: number
    sql: ${TABLE}.creator_id ;;
  }


  dimension_group: broadcast_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day, day_of_week]
    sql: ${TABLE}.broadcast_start_time ;;
  }

  dimension_group: broadcast_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.broadcast_end_time ;;
  }

  measure: count_broadcasts {
    type: count
  }

  measure: count_broadcast_days {
    type: count_distinct
    sql: CAST(${broadcast_start_date} AS STRING) ;;
  }
}
