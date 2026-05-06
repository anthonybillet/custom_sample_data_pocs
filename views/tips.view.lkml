view: tips {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.tips` ;;
  drill_fields: [tip_id]

  dimension: tip_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.tip_id ;;
  }
  dimension: broadcast_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.broadcast_id ;;
  }
  dimension: menu_item {
    type: string
    sql: ${TABLE}.menu_item ;;
  }
  dimension: session_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.session_id ;;
  }
  dimension_group: tip {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.tip_time ;;
  }
  dimension: tokens {
    type: number
    sql: ${TABLE}.tokens ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [tip_id, users.user_id, broadcasts.broadcast_id, broadcasts.broadcaster_username, sessions.session_id]
  }
}
