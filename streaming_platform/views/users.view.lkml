view: users {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.users_2` ;;
  drill_fields: [user_id, country, device_type]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: is_follower {
    type: yesno
    sql: ${TABLE}.is_follower ;;
  }

  dimension_group: account_created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.account_created_at ;;
  }

  measure: count_users {
    type: count
  }
}
