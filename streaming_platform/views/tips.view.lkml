view: tips {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.tips_2` ;;
  drill_fields: [tip_id, tip_time, menu_item, tokens]

  dimension: tip_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.tip_id ;;
  }

  dimension: session_id {
    type: number
    hidden: yes
    sql: ${TABLE}.session_id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: menu_item {
    type: string
    sql: ${TABLE}.menu_item ;;
  }

  dimension_group: tip {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day, day_of_week]
    sql: ${TABLE}.tip_time ;;
  }

  dimension: tokens {
    type: number
    sql: ${TABLE}.tokens ;;
  }

  # --- Measures ---
  measure: count_tips {
    type: count
    # type: count_distinct
    # sql: ${tip_id} ;;
  }

  measure: total_tokens {
    type: sum
    sql: ${tokens} ;;
  }

  measure: median_price {
    type: median
    sql: ${tokens} ;;
  }

  measure: tips_per_broadcast {
    type: number
    value_format_name: decimal_1
    sql: 1.0*${count_tips}/NULLIF(${broadcasts.count_broadcasts},0) ;;
    drill_fields: [count_tips,broadcasts.count_broadcasts]
  }

  # Completes the funnel
  measure: funnel_4_tipped {
    view_label: "Sessions"
    group_label: "Funnel"
    group_item_label: "4) Tipped"
    label: "Tipped"
    type: count_distinct
    sql: ${user_id} ;;
  }

  dimension: price_tier {
    type: string
    sql: CASE
          WHEN ${tokens} <= 50 THEN ' Small tips (≤50)'
          WHEN ${tokens} <= 200 THEN '  Mid-range (51-200)'
          ELSE '  Big tips (200+)'
         END ;;
  }

  measure: tokens_per_viewer {
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${total_tokens} / NULLIF(${sessions.count_unique_viewers}, 0) ;;
  }

  measure: score_crowd_pleaser {
    view_label: "Z) Creator Score Calcs"
    type: number
    description: "High reach, broad appeal."
    sql:
    -- Viewers component
    (CASE WHEN ${sessions.count_unique_viewers} > 500 THEN 3.0
          WHEN ${sessions.count_unique_viewers} > 200 THEN 2.0
          ELSE 0.5 END) +

    -- Recommendation Index component (Assuming rec_idx is calculated elsewhere)
    --(CASE WHEN ${rec_idx} > 100 THEN 2.0
     --     WHEN ${rec_idx} > 80 THEN 1.0
     --     ELSE 0.0 END) +

    -- Entry funnel component[cite: 4]
    (CASE WHEN ${sessions.funnel_1_room_entries} > 1000 THEN 1.5
          WHEN ${sessions.funnel_1_room_entries} > 400 THEN 1.0
          ELSE 0.0 END) +

    -- Monetization component
    (CASE WHEN ${tokens_per_viewer} < 30 THEN 1.0
          ELSE 0.0 END) ;;
  }

  measure: max_archetype_score {
    view_label: "Z) Creator Score Calcs"
    type: number
    hidden: yes
    sql: GREATEST(${score_hidden_gem}, ${score_crowd_pleaser}, ${score_whale_whisperer}, ...) ;;
  }

  measure: creator_archetype {
    view_label: "Z) Creator Score Calcs"
    type: string
    label: "Creator Archetype"
    sql: CASE
        WHEN ${max_archetype_score} = ${score_hidden_gem} THEN 'The Hidden Gem'
        WHEN ${max_archetype_score} = ${score_crowd_pleaser} THEN 'The Crowd Pleaser'
        WHEN ${max_archetype_score} = ${score_whale_whisperer} THEN 'The Whale Whisperer'
        -- ... add all 10 here
       END ;;
  }

}
