view: dim_artists {
  sql_table_name: `ant-billet-looker-core-argolis.music_industry.DIM_ARTISTS` ;;

  dimension: artist_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.artist_id ;;
  }

  dimension: artist_name {
    type: string
    sql: ${TABLE}.artist_name ;;
    label: "Artist Name"
    description: "The official stage name of the roster artist."
    synonyms: ["musician", "band", "performer", "singer"]
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
    label: "Genre"
    description: "The musical category or style of the artist."
    synonyms: ["musical style", "category", "music type"]
  }

  dimension: roster_tier {
    type: string
    sql: ${TABLE}.roster_tier ;;
    label: "Roster Tier"
    description: "Categorization of the artist's career stage (e.g., Developing, Mainstream, Legacy)."
    synonyms: ["career stage", "artist level", "status", "tier"]
  }

  dimension_group: signing {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.signing_date ;;
    label: "Signing Date"
    description: "The date the artist was officially signed to the roster."
    synonyms: ["contract date", "joined date", "date signed"]
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

  measure: count_artists {
    type: count
    drill_fields: [artist_name, genre, roster_tier, dim_tracks.count_tracks]
    label: "Artist Count"
    description: "Total count of individual artists on the roster."
    synonyms: ["number of artists", "total musicians", "roster size"]
  }
}
