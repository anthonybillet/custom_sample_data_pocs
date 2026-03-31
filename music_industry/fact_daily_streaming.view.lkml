view: fact_daily_streaming {
  sql_table_name: `ant-billet-looker-core-argolis.music_industry.fact_daily_streaming` ;;

  dimension: streaming_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.streaming_id ;;
  }

  dimension: artist_id {
    hidden: yes
    type: string
    sql: ${TABLE}.artist_id ;;
  }

  dimension: track_id {
    hidden: yes
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: platform_name {
    type: string
    sql: ${TABLE}.platform_name ;;
    description: "Digital Service Provider (e.g., Spotify, Apple Music, YouTube Music)."
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

  # --- Base Measures ---
  measure: total_streams {
    type: sum
    sql: ${TABLE}.total_streams ;;
    value_format_name: decimal_0
    description: "Raw total stream count across DSPs. Includes skips and passive listening."
    drill_fields: [streaming_drill_details*]
  }

  measure: total_skips {
    hidden: yes # Hidden to force users to use completed streams
    type: sum
    sql: ${TABLE}.skips ;;
  }

  measure: total_saves {
    type: sum
    sql: ${TABLE}.saves ;;
    value_format_name: decimal_0
    description: "Number of times a user explicitly saved the track to their library. High intent signal."
    drill_fields: [streaming_drill_details*]
  }

  measure: total_playlist_adds {
    type: sum
    sql: ${TABLE}.playlist_adds ;;
    value_format_name: decimal_0
    drill_fields: [streaming_drill_details*]
  }

  measure: total_unique_listeners {
    type: sum
    sql: ${TABLE}.unique_listeners ;;
    value_format_name: decimal_0
    drill_fields: [streaming_drill_details*]
  }

  # --- Complex Business Logic for Demo ---
  measure: completed_organic_streams {
    type: number
    sql: ${total_streams} - ${total_skips} ;;
    value_format_name: decimal_0
    description: "Total streams minus skips. Interscope's standard for engaged, lean-forward listening."
    drill_fields: [streaming_drill_details*]
  }

  measure: true_stream_to_save_ratio {
    type: number
    sql: 1.0 * ${total_saves} / NULLIF(${completed_organic_streams}, 0) ;;
    value_format_name: percent_2
    description: "The OFFICIAL Interscope standard conversion metric. Calculates Saves divided by Completed Organic Streams (excludes skips)."
    drill_fields: [streaming_drill_details*]
  }

  # --- Drill Sets ---
  set: streaming_drill_details {
    fields: [
      date_date,
      platform_name,
      dim_artists.artist_name,
      dim_tracks.track_title,
      total_streams,
      completed_organic_streams,
      total_saves,
      true_stream_to_save_ratio
    ]
  }
}
