view: followers {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.followers_2` ;;

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: creator_id {
    type: number
    sql: ${TABLE}.creator_id ;;
  }

  dimension_group: followed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.followed_at ;;
  }

  measure: count_new_followers {
    label: "Followers Gained"
    description: "The number of users who followed the creator during the filtered timeframe."
    type: count
    drill_fields: [user_id, followed_date]
  }
}
