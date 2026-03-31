view: dim_fans {
  sql_table_name: `ant-billet-looker-core-argolis.music_industry.DIM_FANS` ;;

  dimension: fan_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.fan_id ;;
  }

  dimension: acquisition_source {
    type: string
    sql: ${TABLE}.acquisition_source ;;
    description: "The primary platform where the fan was acquired (e.g., TikTok, Spotify, Direct Search)."
  }

  dimension: age_tier {
    type: string
    sql: ${TABLE}.age_tier ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  # --- Hidden ETL Fields ---
  dimension_group: etl_loaded {
    hidden: yes
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.etl_loaded_at ;;
  }

  dimension: source_system {
    hidden: yes
    type: string
    sql: ${TABLE}.source_system ;;
  }

  measure: count_fans {
    type: count
    drill_fields: [country, city, acquisition_source, count_fans]
    description: "Total distinct fans engaged with Interscope artists or merch."
  }
}
