view: broadcasts {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.broadcasts` ;;
  drill_fields: [broadcast_id]

  dimension: broadcast_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.broadcast_id ;;
  }
  dimension_group: broadcast_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.broadcast_end_time ;;
  }
  dimension_group: broadcast_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.broadcast_start_time ;;
  }
  dimension: broadcaster_username {
    type: string
    sql: ${TABLE}.broadcaster_username ;;
  }
  measure: count {
    type: count
    drill_fields: [broadcast_id, broadcaster_username, tips.count, sessions.count]
  }
}
