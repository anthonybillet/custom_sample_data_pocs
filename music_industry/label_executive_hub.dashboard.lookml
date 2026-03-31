- dashboard: label_executive_hub
  title: "Label Executive Command Center"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Executive Hub for Label Operations, Marketing, and Finance."

  elements:
  # ==============================================================================
  # HEADER & NAVIGATION MENU
  # ==============================================================================
  - name: main_navigation_menu
    type: text
    title_text: ""
    body_text: |
      <div style="padding: 20px 10px; text-align: center; font-family: Arial, sans-serif;">
        <h1 style="margin-bottom: 5px; color: #202124; font-weight: 600;">Label Command Center</h1>
        <p style="color: #5f6368; font-size: 14px; margin-bottom: 20px;">AI-Grounded Analytics & Performance Metrics</p>
        <div style="border-top: 1px solid #dadce0; border-bottom: 1px solid #dadce0; padding: 15px 0; font-size: 15px; font-weight: 500;">
          <a href="#streaming" style="color: #1a73e8; text-decoration: none; padding: 0 15px;">🎧 1. Streaming & Conversions</a> |
          <a href="#social" style="color: #1a73e8; text-decoration: none; padding: 0 15px;">📱 2. Social Virality</a> |
          <a href="#d2c" style="color: #1a73e8; text-decoration: none; padding: 0 15px;">🛒 3. D2C Merch</a>
        </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 4

  # ==============================================================================
  # SECTION 1: STREAMING & CONVERSIONS
  # ==============================================================================
  - name: section_1_header
    type: text
    title_text: ""
    body_text: |
      <div id="streaming" style="background-color: #f8f9fa; padding: 20px; border-left: 6px solid #4285f4; border-radius: 4px; margin-top: 20px;">
        <h2 style="margin: 0; color: #202124; font-family: Arial;">1. Streaming & Track Conversions</h2>
        <p style="margin: 5px 0 0 0; color: #5f6368; font-family: Arial;">Core DSP performance, organic engagement, and LookML-governed conversion ratios.</p>
      </div>
    row: 4
    col: 0
    width: 24
    height: 3

  - name: sv_organic_streams
    title: Completed Organic Streams
    model: music_industry
    explore: fact_daily_streaming
    type: single_value
    fields: [fact_daily_streaming.completed_organic_streams]
    show_single_value_title: true
    row: 7
    col: 0
    width: 6
    height: 4

  - name: sv_save_ratio
    title: True Stream-to-Save Ratio
    model: music_industry
    explore: fact_daily_streaming
    type: single_value
    fields: [fact_daily_streaming.true_stream_to_save_ratio]
    show_single_value_title: true
    row: 7
    col: 6
    width: 6
    height: 4

  - name: line_streaming_trend
    title: Organic vs Total Streams (30 Days)
    model: music_industry
    explore: fact_daily_streaming
    type: looker_line
    fields: [fact_daily_streaming.date_date, fact_daily_streaming.completed_organic_streams, fact_daily_streaming.total_streams]
    sorts: [fact_daily_streaming.date_date desc]
    limit: 30
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    legend_position: right
    row: 7
    col: 12
    width: 12
    height: 8

  - name: bar_top_artists
    title: Top 10 Artists by Organic Engagement
    model: music_industry
    explore: fact_daily_streaming
    type: looker_bar
    fields: [dim_artists.artist_name, fact_daily_streaming.completed_organic_streams]
    sorts: [fact_daily_streaming.completed_organic_streams desc]
    limit: 10
    show_view_names: false
    show_value_labels: true
    row: 11
    col: 0
    width: 12
    height: 8

  - name: donut_genre_mix
    title: Stream Share by Genre
    model: music_industry
    explore: fact_daily_streaming
    type: looker_pie
    fields: [dim_artists.genre, fact_daily_streaming.total_streams]
    sorts: [fact_daily_streaming.total_streams desc]
    inner_radius: 50
    show_view_names: false
    row: 15
    col: 12
    width: 12
    height: 8

  - name: column_platform_conversion
    title: Saves vs Playlist Adds by Platform
    model: music_industry
    explore: fact_daily_streaming
    type: looker_column
    fields: [fact_daily_streaming.platform_name, fact_daily_streaming.total_saves, fact_daily_streaming.total_playlist_adds]
    sorts: [fact_daily_streaming.total_saves desc]
    show_view_names: false
    show_value_labels: true
    row: 19
    col: 0
    width: 12
    height: 8

  - name: table_track_leaderboard
    title: Active Track Leaderboard
    model: music_industry
    explore: fact_daily_streaming
    type: looker_grid
    fields: [dim_tracks.track_title, dim_artists.artist_name, fact_daily_streaming.completed_organic_streams, fact_daily_streaming.true_stream_to_save_ratio]
    sorts: [fact_daily_streaming.completed_organic_streams desc]
    limit: 15
    show_view_names: false
    row: 23
    col: 12
    width: 12
    height: 8

  # ==============================================================================
  # SECTION 2: SOCIAL VIRALITY
  # ==============================================================================
  - name: section_2_header
    type: text
    title_text: ""
    body_text: |
      <div id="social" style="background-color: #f8f9fa; padding: 20px; border-left: 6px solid #e94235; border-radius: 4px; margin-top: 40px;">
        <h2 style="margin: 0; color: #202124; font-family: Arial;">2. Social Virality & Marketing Engine</h2>
        <p style="margin: 5px 0 0 0; color: #5f6368; font-family: Arial;">UGC creation velocity, cross-platform virality, and short-form video engagement.</p>
      </div>
    row: 27
    col: 0
    width: 24
    height: 3

  - name: sv_ugc_creations
    title: Total UGC Creations
    model: music_industry
    explore: fact_daily_social
    type: single_value
    fields: [fact_daily_social.total_ugc_creations]
    show_single_value_title: true
    row: 30
    col: 0
    width: 6
    height: 4

  - name: sv_viral_rate
    title: Viral Engagement Rate
    model: music_industry
    explore: fact_daily_social
    type: single_value
    fields: [fact_daily_social.viral_engagement_rate]
    show_single_value_title: true
    row: 30
    col: 6
    width: 6
    height: 4

  - name: line_ugc_trend
    title: UGC Creations & Shares vs Time
    model: music_industry
    explore: fact_daily_social
    type: looker_line
    fields: [fact_daily_social.date_date, fact_daily_social.total_ugc_creations, fact_daily_social.total_shares]
    sorts: [fact_daily_social.date_date desc]
    limit: 30
    show_view_names: false
    row: 30
    col: 12
    width: 12
    height: 8

  - name: bar_virality_platform
    title: Views vs UGC by Platform
    model: music_industry
    explore: fact_daily_social
    type: looker_bar
    fields: [fact_daily_social.platform_name, fact_daily_social.total_video_views, fact_daily_social.total_ugc_creations]
    sorts: [fact_daily_social.total_video_views desc]
    show_view_names: false
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: fact_daily_social.total_video_views
        name: Total Video Views
        axisId: fact_daily_social.total_video_views
    - label: ''
      orientation: top
      series:
      - id: fact_daily_social.total_ugc_creations
        name: Total UGC Creations
        axisId: fact_daily_social.total_ugc_creations
    row: 34
    col: 0
    width: 12
    height: 8

  - name: scatter_views_vs_engagement
    title: Video Views vs Viral Rate by Artist
    model: music_industry
    explore: fact_daily_social
    type: looker_scatter
    fields: [dim_artists.artist_name, fact_daily_social.total_video_views, fact_daily_social.viral_engagement_rate]
    sorts: [fact_daily_social.total_video_views desc]
    show_view_names: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: fact_daily_social.total_video_views
        name: Total Video Views
        axisId: fact_daily_social.total_video_views
    - label: ''
      orientation: right
      series:
      - id: fact_daily_social.viral_engagement_rate
        name: Viral Engagement Rate
        axisId: fact_daily_social.viral_engagement_rate
    row: 38
    col: 12
    width: 12
    height: 8

  - name: column_shares_by_tier
    title: Content Shares by Roster Tier
    model: music_industry
    explore: fact_daily_social
    type: looker_column
    fields: [dim_artists.roster_tier, fact_daily_social.total_shares]
    sorts: [fact_daily_social.total_shares desc]
    show_view_names: false
    show_value_labels: true
    row: 42
    col: 0
    width: 12
    height: 8

  - name: table_social_trends
    title: Trending Tracks on Social
    model: music_industry
    explore: fact_daily_social
    type: looker_grid
    fields: [dim_tracks.track_title, fact_daily_social.total_video_views, fact_daily_social.viral_engagement_rate]
    sorts: [fact_daily_social.total_video_views desc]
    limit: 10
    show_view_names: false
    row: 46
    col: 12
    width: 12
    height: 8

  # ==============================================================================
  # SECTION 3: D2C MERCH
  # ==============================================================================
  - name: section_3_header
    type: text
    title_text: ""
    body_text: |
      <div id="d2c" style="background-color: #f8f9fa; padding: 20px; border-left: 6px solid #fbbc04; border-radius: 4px; margin-top: 40px;">
        <h2 style="margin: 0; color: #202124; font-family: Arial;">3. D2C Merch & Superfan Economics</h2>
        <p style="margin: 5px 0 0 0; color: #5f6368; font-family: Arial;">High-margin revenue mapping, ARPU insights, and fan acquisition performance.</p>
      </div>
    row: 50
    col: 0
    width: 24
    height: 3

  - name: sv_gross_revenue
    title: Total D2C Gross Revenue
    model: music_industry
    explore: fact_merch_orders
    type: single_value
    fields: [fact_merch_orders.total_gross_revenue]
    show_single_value_title: true
    row: 53
    col: 0
    width: 8
    height: 4

  - name: sv_arpu
    title: Average Revenue Per Fan (ARPU)
    model: music_industry
    explore: fact_merch_orders
    type: single_value
    fields: [fact_merch_orders.average_revenue_per_fan]
    show_single_value_title: true
    row: 53
    col: 8
    width: 8
    height: 4

  - name: sv_margin
    title: Gross Margin %
    model: music_industry
    explore: fact_merch_orders
    type: single_value
    fields: [fact_merch_orders.gross_margin_percentage]
    show_single_value_title: true
    row: 53
    col: 16
    width: 8
    height: 4

  - name: map_revenue_country
    title: Global Superfan Revenue Heatmap
    model: music_industry
    explore: fact_merch_orders
    type: looker_map
    fields: [dim_fans.country, fact_merch_orders.total_gross_revenue]
    map_projection: ''
    quantize_colors: false
    show_view_names: false
    row: 57
    col: 0
    width: 12
    height: 10

  - name: pie_revenue_category
    title: Revenue by Merch Category
    model: music_industry
    explore: fact_merch_orders
    type: looker_pie
    fields: [fact_merch_orders.item_category, fact_merch_orders.total_gross_revenue]
    sorts: [fact_merch_orders.total_gross_revenue desc]
    show_view_names: false
    row: 57
    col: 12
    width: 12
    height: 10

  - name: bar_arpu_age
    title: ARPU by Age Tier
    model: music_industry
    explore: fact_merch_orders
    type: looker_column
    fields: [dim_fans.age_tier, fact_merch_orders.average_revenue_per_fan]
    sorts: [dim_fans.age_tier]
    show_view_names: false
    show_value_labels: true
    row: 67
    col: 0
    width: 12
    height: 8

  - name: table_artist_profitability
    title: Artist Merch Profitability
    model: music_industry
    explore: fact_merch_orders
    type: looker_grid
    fields: [dim_artists.artist_name, fact_merch_orders.total_orders, fact_merch_orders.total_gross_revenue, fact_merch_orders.total_net_margin_dollars]
    sorts: [fact_merch_orders.total_gross_revenue desc]
    limit: 10
    show_view_names: false
    row: 67
    col: 12
    width: 12
    height: 8
