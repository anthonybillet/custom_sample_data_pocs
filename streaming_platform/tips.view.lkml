view: tips {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.tips` ;;
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
  }

  measure: total_tokens {
    type: sum
    sql: ${tokens} ;;
  }

  measure: median_price {
    type: median
    sql: ${tokens} ;;
  }

  # Completes the funnel
  measure: funnel_4_tipped {
    label: "4. Tipped"
    type: count_distinct
    sql: ${user_id} ;;
  }
}
