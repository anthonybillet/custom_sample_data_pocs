view: fact_daily_social {
  sql_table_name: `ant-billet-looker-core-argolis.music_industry.fact_daily_social` ;;

  dimension: social_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.social_id ;;
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
    description: "Social media platform (e.g., TikTok, Instagram Reels, YouTube Shorts)."
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
  measure: total_video_views {
    type: sum
    sql: ${TABLE}.video_views ;;
    value_format_name: decimal_0
    description: "Total impressions/views of videos featuring the track audio."
    drill_fields: [social_drill_details*]
  }

  measure: total_ugc_creations {
    type: sum
    sql: ${TABLE}.ugc_creations ;;
    value_format_name: decimal_0
    description: "Count of User Generated Content videos created using the track audio (highly correlated to virality)."
    drill_fields: [social_drill_details*]
  }

  measure: total_shares {
    type: sum
    sql: ${TABLE}.shares ;;
    value_format_name: decimal_0
    drill_fields: [social_drill_details*]
  }

  measure: viral_engagement_rate {
    type: number
    sql: 1.0 * (${total_shares} + ${total_ugc_creations}) / NULLIF(${total_video_views}, 0) ;;
    value_format_name: percent_2
    description: "Measures virality depth: (Shares + UGC Creations) divided by Total Views. Standard Interscope viral metric."
    drill_fields: [social_drill_details*]
  }

  # --- Drill Sets ---
  set: social_drill_details {
    fields: [
      date_date,
      platform_name,
      dim_artists.artist_name,
      dim_tracks.track_title,
      total_video_views,
      total_ugc_creations,
      viral_engagement_rate
    ]
  }
}
