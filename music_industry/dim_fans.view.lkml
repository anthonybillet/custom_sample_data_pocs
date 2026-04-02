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
    label: "Acquisition Source"
    description: "The primary platform where the fan was acquired (e.g., TikTok, Spotify, Direct Search)."
    synonyms: ["traffic source", "origin", "channel", "platform source"]
  }

  dimension: age_tier {
    type: string
    sql: ${TABLE}.age_tier ;;
    label: "Age Tier"
    description: "The age group category of the fan."
    synonyms: ["age group", "generation", "demographic"]
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    label: "City"
    description: "The city where the fan is located."
    synonyms: ["metro", "town", "municipality"]
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    label: "Country"
    description: "The country where the fan is located."
    synonyms: ["nation", "state", "region"]
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
    label: "Fan Count"
    description: "Total distinct fans engaged with the label's artists or merch."
    synonyms: ["number of fans", "total users", "audience size", "listener count"]
  }
}
