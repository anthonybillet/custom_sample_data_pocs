view: hashtag_affinity {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.hashtag_affinity` ;;

  dimension: exploring_hashtag {
    primary_key: yes
    type: string
    sql: ${TABLE}.EXPLORING_HASHTAG ;;
  }

  dimension: affinity_index {
    type: number
    sql: ${TABLE}.affinity_index ;;
  }

  dimension: population_users {
    type: number
    description: "Total platform users who engage with this tag"
    sql: ${TABLE}.population_users ;;
  }

  dimension: usage_status {
    type: string
    sql: ${TABLE}.usage_status ;;
  }

  measure: average_affinity {
    type: average
    sql: ${affinity_index} ;;
    value_format_name: decimal_2
  }

  measure: total_population_reach {
    type: sum
    sql: ${population_users} ;;
  }

  dimension: audience_users {
    type: number
    sql: ${TABLE}.audience_users ;;
  }

  measure: total_audience_reach {
    type: sum
    sql: ${audience_users} ;;
  }


}
