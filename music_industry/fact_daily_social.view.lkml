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
    label: "Social Date"
    description: "The specific date of the social media activity."
    synonyms: ["activity date", "engagement date", "day"]
  }

  dimension: platform_name {
    type: string
    sql: ${TABLE}.platform_name ;;
    label: "Social Platform Name"
    description: "Social media platform (e.g., TikTok, Instagram Reels, YouTube Shorts)."
    synonyms: ["app", "social network", "media channel"]
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
    label: "Total Video Views"
    description: "Total impressions/views of videos featuring the track audio."
    synonyms: ["impressions", "plays", "video watches", "tiktok views"]
    drill_fields: [social_drill_details*]
  }

  measure: total_ugc_creations {
    type: sum
    sql: ${TABLE}.ugc_creations ;;
    value_format_name: decimal_0
    label: "Total UGC Creations"
    description: "Count of User Generated Content videos created using the track audio (highly correlated to virality)."
    synonyms: ["user videos", "creations", "posts", "tiktok creations"]
    drill_fields: [social_drill_details*]
  }

  measure: total_shares {
    type: sum
    sql: ${TABLE}.shares ;;
    value_format_name: decimal_0
    label: "Total Shares"
    description: "The number of times content featuring the track was shared by users."
    synonyms: ["forwards", "retweets", "sends"]
    drill_fields: [social_drill_details*]
  }

  measure: viral_engagement_rate {
    type: number
    sql: 1.0 * (${total_shares} + ${total_ugc_creations}) / NULLIF(${total_video_views}, 0) ;;
    value_format_name: percent_2
    label: "Viral Engagement Rate"
    description: "Measures virality depth: (Shares + UGC Creations) divided by Total Views. Standard viral metric."
    synonyms: ["virality score", "engagement percentage", "share rate"]
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
