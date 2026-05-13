view: sessions {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.sessions_2` ;;
  drill_fields: [session_id, users.user_id, duration_seconds, traffic_source]

  dimension: session_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.session_id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: creator_id {
    type: number
    hidden: yes
    sql: ${TABLE}.creator_id ;;
  }

  dimension: broadcast_id {
    type: number
    hidden: yes
    sql: ${TABLE}.broadcast_id ;;
  }

  dimension_group: session_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day, day_of_week]
    sql: ${TABLE}.session_start_time ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
  }

  # Maps directly to the "How Long They Stay" chart
  dimension: duration_bucket {
    type: string
    sql: CASE
          WHEN ${duration_seconds} <= 60 THEN '     ≤1 min'
          WHEN ${duration_seconds} > 60 AND ${duration_seconds} <= 300 THEN '    1–5 min'
          WHEN ${duration_seconds} > 300 AND ${duration_seconds} <= 900 THEN '   5–15 min'
          WHEN ${duration_seconds} > 900 AND ${duration_seconds} <= 1800 THEN '  15–30 min'
          WHEN ${duration_seconds} > 1800 AND ${duration_seconds} <= 3600 THEN ' 30–60 min'
          ELSE '60+ min'
         END ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: entry_hashtag {
    type: string
    sql: ${TABLE}.entry_hashtag ;;
  }

  dimension: interacted_in_chat {
    type: yesno
    sql: ${TABLE}.interacted_in_chat ;;
  }

  # --- Base Measures ---
  measure: count_sessions {
    type: count
  }

  measure: count_unique_viewers {
    type: count_distinct
    sql: ${user_id} ;;
  }

  # --- Funnel Measures ---
  measure: funnel_1_room_entries {
    group_label: "Funnel"
    group_item_label: "1) Room Entries"
    label: "Room Entries"
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: funnel_2_watched_1_min {
    group_label: "Funnel"
    group_item_label: "2) Watched 1+ Min"
    label: "Watched 1+ Min"
    type: count_distinct
    sql: ${user_id} ;;
    filters: [duration_seconds: ">60"]
  }

  measure: funnel_3_interacted {
    group_label: "Funnel"
    group_item_label: "3) Interacted"
    label: "Interacted"
    type: count_distinct
    sql: ${user_id} ;;
    filters: [interacted_in_chat: "yes"]
  }

  # --- Hashtag Performance Measures ---
  measure: count_days_active {
    type: count_distinct
    sql: CAST(${session_start_date} AS STRING) ;;
  }

  measure: average_viewers_per_day {
    type: number
    sql: 1.0 * ${count_unique_viewers} / NULLIF(${count_days_active}, 0) ;;
    value_format_name: decimal_1
  }

  measure: count_left_early {
    type: count_distinct
    sql: ${user_id} ;;
    filters: [duration_seconds: "<=60"]
  }

  measure: count_watched_only {
    type: count_distinct
    sql: ${user_id} ;;
    filters: [duration_seconds: ">60", interacted_in_chat: "no"]
  }

  measure: count_interacted_only {
    type: count_distinct
    sql: ${user_id} ;;
    # Note: In a full setup, you'd filter out users who tipped.
    filters: [interacted_in_chat: "yes"]
  }

  measure: average_session_duration_minutes {
    label: "Avg Session Duration (Minutes)"
    type: average
    value_format: "0.0 \"m\""
    sql: 1.0*${duration_seconds}/60 ;;
  }
}
