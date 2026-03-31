view: dim_tracks {
  sql_table_name: `ant-billet-looker-core-argolis.music_industry.DIM_TRACKS` ;;

  dimension: track_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: artist_id {
    hidden: yes
    type: string
    sql: ${TABLE}.artist_id ;;
  }

  dimension: artist_name {
    type: string
    sql: ${TABLE}.artist_name ;;
  }

  dimension: isrc_code {
    type: string
    sql: ${TABLE}.isrc_code ;;
    description: "International Standard Recording Code - the unique identifier for the specific recording."
  }

  dimension: track_title {
    type: string
    sql: ${TABLE}.track_title ;;
  }

  dimension: marketing_budget {
    hidden: yes # Hidden as a dimension so users are forced to use the measure
    type: number
    sql: ${TABLE}.marketing_budget ;;
  }

  dimension_group: release {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.release_date ;;
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

  # --- Measures ---
  measure: count_tracks {
    type: count
    drill_fields: [track_title, artist_name, release_date]
  }

  measure: total_marketing_budget {
    type: sum
    sql: ${marketing_budget} ;;
    value_format_name: usd_0
    description: "Total allocated marketing spend for the track(s)."
  }
}
