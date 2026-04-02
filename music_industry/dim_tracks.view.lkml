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
    label: "Artist Name"
    description: "The name of the artist performing the track."
    synonyms: ["musician", "singer", "performer"]
  }

  dimension: isrc_code {
    type: string
    sql: ${TABLE}.isrc_code ;;
    label: "ISRC Code"
    description: "International Standard Recording Code - the unique identifier for the specific recording."
    synonyms: ["recording id", "track code", "unique identifier"]
  }

  dimension: track_title {
    type: string
    sql: ${TABLE}.track_title ;;
    label: "Track Title"
    description: "The official name of the song or recording."
    synonyms: ["song name", "song title", "track name", "record title"]
  }

  dimension: marketing_budget {
    hidden: yes
    type: number
    sql: ${TABLE}.marketing_budget ;;
  }

  dimension_group: release {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.release_date ;;
    label: "Release"
    description: "The date the track was officially released to the public."
    synonyms: ["launch date", "drop date", "publish date"]
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
    label: "Track Count"
    description: "Total count of unique tracks or songs."
    synonyms: ["number of songs", "total recordings", "catalog size"]
  }

  measure: total_marketing_budget {
    type: sum
    sql: ${marketing_budget} ;;
    value_format_name: usd_0
    label: "Total Marketing Budget"
    description: "Total allocated marketing spend for the track(s)."
    synonyms: ["marketing spend", "ad budget", "promotion cost"]
  }
}
