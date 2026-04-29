view: sessions {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.sessions` ;;
  drill_fields: [session_id]

  dimension: session_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.session_id ;;
  }
  dimension: broadcast_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.broadcast_id ;;
  }
  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
  }
  dimension: entry_hashtag {
    type: string
    sql: ${TABLE}.entry_hashtag ;;
  }
  dimension: interacted_in_chat {
    type: yesno
    sql: ${TABLE}.interacted_in_chat ;;
  }
  dimension_group: session_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_end_time ;;
  }
  dimension_group: session_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session_start_time ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [session_id, users.user_id, broadcasts.broadcast_id, broadcasts.broadcaster_username, tips.count]
  }
}
