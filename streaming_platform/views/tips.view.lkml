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
    label: "4. Tipped"
    type: count_distinct
    sql: ${user_id} ;;
  }

  dimension: price_tier {
    type: string
    sql: CASE
          WHEN ${tokens} <= 50 THEN '1. Small tips (≤50)'
          WHEN ${tokens} <= 200 THEN '2. Mid-range (51-200)'
          ELSE '3. Big tips (200+)'
         END ;;
  }

}
