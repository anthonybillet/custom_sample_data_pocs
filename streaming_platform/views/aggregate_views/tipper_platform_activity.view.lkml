view: tipper_platform_activity {
  derived_table: {
    sql:
      WITH creator_tippers AS (
        SELECT DISTINCT tips.user_id
        FROM ${tips.SQL_TABLE_NAME} AS tips
        LEFT JOIN ${creators.SQL_TABLE_NAME}  AS creators
          ON tips.creator_id = creators.creator_id
        WHERE
          {% condition creators.username %} creators.username {% endcondition %}
          AND CAST(creators.creator_id AS STRING) IN UNNEST(
            SPLIT(REPLACE('{{ _user_attributes['creator_id'] }}', ' ', ''), ',')
          )
      )
      SELECT
        EXTRACT(DAYOFWEEK FROM t.tip_time) AS day_of_week_index,
        FORMAT_TIMESTAMP('%A', t.tip_time) AS day_of_week,
        EXTRACT(HOUR FROM t.tip_time) AS hour_of_day,
        COUNT(t.tip_id) AS platform_tip_count
      FROM creator_tippers ct
      JOIN ${tips.SQL_TABLE_NAME} t
        ON ct.user_id = t.user_id
      GROUP BY 1,2,3
    ;;
  }

  # dimension: pk {
  #   primary_key: yes
  #   hidden: yes
  #   type: date_time
  #   sql: ${tip_time_raw} ;;
  # }

  # dimension_group: tip_time {
  #   type: time
  #   sql: ${TABLE}.tip_time ;;
  # }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT( CAST( ${day_of_week_index} AS string), '_', CAST (${hour_of_day} AS String)) ;;
  }

  dimension: day_of_week_index {
    type: number
    hidden: yes
    sql: ${TABLE}.day_of_week_index ;;
  }

  dimension: day_of_week_sort {
    type: number
    hidden: yes
    sql: CASE WHEN ${TABLE}.day_of_week_index = 1 THEN 8 ELSE ${TABLE}.day_of_week_index END;;
  }

  dimension: day_of_week {
    type: string
    sql: ${TABLE}.day_of_week ;;
    order_by_field: day_of_week_sort
  }

  dimension: hour_of_day {
    type: number
    sql: ${TABLE}.hour_of_day ;;
  }

  measure: platform_tip_count {
    label: "User Tips on Platform"
    description: "for users who also tipped you, this is the total tips they gave to all creators"
    type: sum
    sql: ${TABLE}.platform_tip_count ;;
  }
}
