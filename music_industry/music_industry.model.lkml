connection: "argolis"

include: "/music_industry/*.view.lkml"
include: "/music_industry/**.dashboard.lookml"

# ==============================================================================
# EXPLORE 1: Streaming & Track Conversions (Core Business)
# ==============================================================================
explore: fact_daily_streaming {
  label: "1 - Streaming & Track Conversions"
  description: "Analyze daily DSP streaming data, saves, and conversion ratios. Grounded by LookML for AI accuracy."

  join: dim_tracks {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_daily_streaming.track_id} = ${dim_tracks.track_id} ;;
  }

  join: dim_artists {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dim_tracks.artist_id} = ${dim_artists.artist_id} ;;
  }
}

# ==============================================================================
# EXPLORE 2: Social Virality & UGC (Marketing Engine)
# ==============================================================================
explore: fact_daily_social {
  label: "2 - Social Virality & UGC"
  description: "Track TikTok, Instagram Reels, and YouTube Shorts virality and user-generated content velocity."

  join: dim_tracks {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_daily_social.track_id} = ${dim_tracks.track_id} ;;
  }

  join: dim_artists {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dim_tracks.artist_id} = ${dim_artists.artist_id} ;;
  }
}

# ==============================================================================
# EXPLORE 3: D2C Merch & Superfan Economics (High Margin Revenue)
# ==============================================================================
explore: fact_merch_orders {
  label: "3 - D2C Merch & Superfan Economics"
  description: "Explore high-margin direct-to-consumer sales, ARPU, and geographic superfan density."

  join: dim_fans {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_merch_orders.fan_id} = ${dim_fans.fan_id} ;;
  }

  join: dim_artists {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_merch_orders.artist_id} = ${dim_artists.artist_id} ;;
  }
}
