- dashboard: creator_insights
  title: "Creator Insights: Demo_creator"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "A replica of the Creator Insights PDF dashboard built on the granular data model."

  elements:
  # ─── HEADER & OPPORTUNITIES ─────────────────────────────────────────────
  - name: report_header
    type: text
    title_text: "Demo_creator | THE HIDDEN GEM"
    subtitle_text: "Jan 1, 2026 - Mar 31, 2026"
    body_text: |-
      *This analysis was developed exclusively for Demo_creator as part of Chaturbate's Creator Insights program. The data and recommendations that follow are intended as a resource, one perspective on your already-growing broadcast.*
    row: 0
    col: 0
    width: 24
    height: 3

  - name: kpi_1_viewers
    title: "Unique Logged-In Viewers"
    type: single_value
    model: streaming_platform
    explore: sessions
    measures: [sessions.count_unique_viewers]
    row: 3
    col: 0
    width: 6
    height: 4

  - name: kpi_2_tokens
    title: "Total Tokens Earned"
    type: single_value
    model: streaming_platform
    explore: sessions
    measures: [tips.total_tokens]
    row: 3
    col: 6
    width: 6
    height: 4

  - name: kpi_3_followers
    title: "Followers Gained"
    type: single_value
    model: streaming_platform
    explore: sessions
    measures: [users.count_users]
    filters:
      users.is_follower: 'Yes'
    row: 3
    col: 12
    width: 6
    height: 4

  - name: kpi_4_days
    title: "Days Active"
    type: single_value
    model: streaming_platform
    explore: sessions
    measures: [broadcasts.count_broadcast_days]
    row: 3
    col: 18
    width: 6
    height: 4

  - name: opportunities_text
    type: text
    title_text: "### Opportunities"
    body_text: |-
      🟢 **Tags:** If it applies, adding 'flexible' could work well here - your audience loves it.
      🟢 **Audience:** Only 1.2% of your viewers tipped - tip goals may help convert more.
      🟢 **Schedule:** Your tippers are active Mon-Thu but you're not broadcasting then.
      🟡 **Menu:** 'flash smile' gets 44% of all tips - a higher-priced version could earn more.
    row: 7
    col: 0
    width: 24
    height: 5


  # ─── AUDIENCE INSIGHTS ──────────────────────────────────────────────────
  - name: section_audience
    type: text
    title_text: "## Audience Insights"
    subtitle_text: "How viewers find you and how long they stay"
    row: 12
    col: 0
    width: 24
    height: 2

  - name: how_long_they_stay
    title: "How Long They Stay"
    type: looker_column
    model: streaming_platform
    explore: sessions
    dimensions: [sessions.duration_bucket]
    measures: [sessions.count_unique_viewers]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    series_colors:
      sessions.count_unique_viewers: "#F0A830"
    show_value_labels: true
    font_size: 10
    row: 14
    col: 0
    width: 12
    height: 8

  - name: engagement_funnel
    title: "Engagement Funnel"
    type: looker_funnel
    model: streaming_platform
    explore: sessions
    measures: [sessions.funnel_1_room_entries, sessions.funnel_2_watched_1_min, sessions.funnel_3_interacted, tips.funnel_4_tipped]
    leftAxisLabelVisible: false
    rightAxisLabelVisible: false
    barColors: ["#36B5D0", "#7E57C2", "#F0A830", "#6BBF59"]
    smoothedBars: false
    isStepped: false
    labelScale: 1
    row: 14
    col: 12
    width: 12
    height: 8

  - name: how_viewers_find_you
    title: "How Viewers Find You"
    type: looker_bar
    model: streaming_platform
    explore: sessions
    dimensions: [sessions.traffic_source]
    measures: [sessions.count_unique_viewers]
    stacking: normal
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    series_colors:
      Follows: "#6BBF59"
      Recommendations: "#5BC0DE"
      Direct: "#F0A830"
      Other: "#BBBBBB"
    row: 22
    col: 0
    width: 24
    height: 6


  # ─── TAG INSIGHTS ───────────────────────────────────────────────────────
  - name: section_tags
    type: text
    title_text: "## Tag Insights"
    subtitle_text: "Hashtag performance and audience compatibility analysis"
    row: 28
    col: 0
    width: 24
    height: 2

  - name: hashtag_performance
    title: "Your Hashtag Performance"
    type: table
    model: streaming_platform
    explore: sessions
    dimensions: [sessions.entry_hashtag]
    measures: [sessions.count_unique_viewers, sessions.count_days_active, sessions.average_viewers_per_day]
    sorts: [sessions.count_unique_viewers desc]
    limit: 10
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    row: 30
    col: 0
    width: 12
    height: 7

  - name: untapped_opportunities
    title: "Untapped Opportunities (Scatter Proxy)"
    type: looker_scatter
    model: streaming_platform
    explore: sessions
    dimensions: [sessions.entry_hashtag]
    measures: [sessions.count_unique_viewers, sessions.average_viewers_per_day]
    show_view_names: false
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: true
    series_colors:
      sessions.count_unique_viewers: "#00b4d8"
    row: 30
    col: 12
    width: 12
    height: 7


  # ─── TIP MENU INSIGHTS ──────────────────────────────────────────────────
  - name: section_menu
    type: text
    title_text: "## Tip Menu Insights"
    subtitle_text: "Menu performance, pricing insights, and what your audience responds to"
    row: 37
    col: 0
    width: 24
    height: 2

  - name: what_tippers_buy
    title: "What Your Tippers Buy From You"
    type: table
    model: streaming_platform
    explore: sessions
    dimensions: [tips.menu_item]
    measures: [tips.median_price, tips.total_tokens, tips.funnel_4_tipped]
    sorts: [tips.total_tokens desc]
    limit: 10
    show_view_names: false
    show_row_numbers: false
    enable_conditional_formatting: true
    conditional_formatting: [{"type": "data_bar", "value_format": null, "background_color": "#e67e22", "color_application": {"collection_id": "b43731d5-dc87-4a8e-b807-635bef3948e7", "palette_id": "1e4d66b9-f066-4c33-b0b7-cc10b4810688"}, "bold": false, "italic": false, "strikethrough": false, "fields": ["tips.total_tokens"]}]
    row: 39
    col: 0
    width: 12
    height: 8

  - name: what_tippers_buy_elsewhere
    title: "What Your Tippers Buy Elsewhere (Local Proxy)"
    type: table
    model: streaming_platform
    explore: sessions
    dimensions: [tips.menu_item]
    measures: [tips.median_price, tips.funnel_4_tipped]
    sorts: [tips.funnel_4_tipped desc]
    limit: 10
    show_view_names: false
    show_row_numbers: false
    row: 39
    col: 12
    width: 12
    height: 8


  # ─── SCHEDULE INSIGHTS ──────────────────────────────────────────────────
  - name: section_schedule
    type: text
    title_text: "## Schedule Insights"
    subtitle_text: "Broadcast timing, audience activity, and scheduling opportunities"
    row: 47
    col: 0
    width: 24
    height: 2

  - name: when_fans_tip_heatmap
    title: "When Your Fans Tip You (Heatmap)"
    type: table
    model: streaming_platform
    explore: sessions
    dimensions: [tips.tip_day_of_week]
    pivots: [tips.tip_hour_of_day]
    measures: [tips.count_tips]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    enable_conditional_formatting: true
    conditional_formatting: [{"type": "background color", "value_format": null, "background_color": "#1f3e5a", "color_application": {"collection_id": "b43731d5-dc87-4a8e-b807-635bef3948e7", "palette_id": "1e4d66b9-f066-4c33-b0b7-cc10b4810688", "options": {"steps": 5, "reverse": false, "stepped": false}}, "bold": false, "italic": false, "strikethrough": false, "fields": ["tips.count_tips"]}]
    row: 49
    col: 0
    width: 24
    height: 9
