- dashboard: creator_insights
  title: "Creator Insights: Demo_creator"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "A replica of the Creator Insights PDF dashboard built on the granular data model."

  elements:
  # ─── HEADER ─────────────────────────────────────────────────────────────
  - name: report_header
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif; margin:12px 0 4px 0;">
          <div style="display:flex; align-items:center; gap:14px; flex-wrap:wrap;">
              <span style="font-size:32px; font-weight:700; color:#111;">Demo_creator</span>
              <span style="display:inline-block; background:#1abc9c; color:#fff; font-size:11px; font-weight:600; border-radius:4px; padding:5px 12px; letter-spacing:0.4px; white-space:nowrap; text-align:center; line-height:1;">THE HIDDEN GEM</span>
          </div>
          <div style="font-size:14px; color:#888; margin-top:4px;">Jan 1, 2026 – Mar 31, 2026</div>
          <div style="font-size:13px; color:#777; font-style:italic; margin-top:8px; line-height:1.5;">
              This analysis was developed exclusively for Demo_creator as part of Chaturbate's Creator Insights program. The data and recommendations that follow are intended as a resource, one perspective on your already-growing broadcast.
          </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 3

  # ─── KPIS ───────────────────────────────────────────────────────────────
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

  # ─── ARCHETYPE & OPPORTUNITIES ──────────────────────────────────────────
  - name: archetype_card
    type: text
    body_text: |-
      <div style="background:#f9f9f9; border-radius:10px; padding:24px 28px; border-left:4px solid #1abc9c; margin:0; font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif; height: 100%;">
          <div style="font-size:18px; font-weight:700; color:#222; margin-bottom:10px;">
              Viewers who find you stay and spend big.
          </div>
          <div style="font-size:14px; color:#444; line-height:1.6;">
              The audience that finds this room stays longer and spends more than almost any comparable creator. New viewer discovery hasn't caught up to how well this room converts - expanding tags and maintaining a consistent schedule can close that gap.
          </div>
      </div>
    row: 7
    col: 0
    width: 24
    height: 3

  - name: opportunities_text
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="font-size:22px; font-weight:600; color:#111; margin-bottom:12px; border-bottom:1px solid #ccc; padding-bottom:4px;">Opportunities</div>
          <div style="font-size:14px; color:#333; line-height:1.6;">
              <p style="margin:6px 0;"><span style="color:#2ecc71; font-size:16px;">●</span> <strong>Tags:</strong> If it applies, adding 'flexible' could work well here - your audience loves it.</p>
              <p style="margin:6px 0;"><span style="color:#2ecc71; font-size:16px;">●</span> <strong>Audience:</strong> Only 1.2% of your viewers tipped - tip goals may help convert more.</p>
              <p style="margin:6px 0;"><span style="color:#2ecc71; font-size:16px;">●</span> <strong>Schedule:</strong> Your tippers are active Mon-Thu but you're not broadcasting then.</p>
              <p style="margin:6px 0;"><span style="color:#f39c12; font-size:16px;">●</span> <strong>Menu:</strong> 'flash smile' gets 44% of all tips - a higher-priced version could earn more.</p>
          </div>
      </div>
    row: 10
    col: 0
    width: 24
    height: 5

  # ─── AUDIENCE INSIGHTS ──────────────────────────────────────────────────
  - name: section_audience
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="display:flex; align-items:center; gap:8px; font-size:24px; font-weight:600; color:#111; padding:4px 0;">
            Audience Insights
            <span style="flex:1; height:1px; background:#ccc; margin-left:8px;"></span>
          </div>
          <div style="font-size:14px; color:#888; font-style:italic; padding:2px 0 8px;">How viewers find you and how long they stay</div>
      </div>
    row: 15
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
    row: 17
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
    row: 17
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
    row: 25
    col: 0
    width: 24
    height: 6

  # ─── TAG INSIGHTS ───────────────────────────────────────────────────────
  - name: section_tags
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="display:flex; align-items:center; gap:8px; font-size:24px; font-weight:600; color:#111; padding:4px 0;">
            Tag Insights
            <span style="flex:1; height:1px; background:#ccc; margin-left:8px;"></span>
          </div>
          <div style="font-size:14px; color:#888; font-style:italic; padding:2px 0 8px;">Hashtag performance and audience compatibility analysis</div>
      </div>
    row: 31
    col: 0
    width: 24
    height: 2

  - name: hashtag_performance
    title: "Your Hashtag Performance"
    type: looker_grid
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
    row: 33
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
    row: 33
    col: 12
    width: 12
    height: 7

  # ─── TIP MENU INSIGHTS ──────────────────────────────────────────────────
  - name: section_menu
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="display:flex; align-items:center; gap:8px; font-size:24px; font-weight:600; color:#111; padding:4px 0;">
            Tip Menu Insights
            <span style="flex:1; height:1px; background:#ccc; margin-left:8px;"></span>
          </div>
          <div style="font-size:14px; color:#888; font-style:italic; padding:2px 0 8px;">Menu performance, pricing insights, and what your audience responds to</div>
      </div>
    row: 40
    col: 0
    width: 24
    height: 2

  - name: what_tippers_buy
    title: "What Your Tippers Buy From You"
    type: looker_grid
    model: streaming_platform
    explore: sessions
    dimensions: [tips.menu_item]
    measures: [tips.median_price, tips.total_tokens, tips.funnel_4_tipped]
    sorts: [tips.total_tokens desc]
    limit: 10
    show_view_names: false
    show_row_numbers: false
    enable_conditional_formatting: false
    series_cell_visualizations:
      tips.total_tokens:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    row: 42
    col: 0
    width: 12
    height: 8

  - name: what_tippers_buy_elsewhere
    title: "What Your Tippers Buy Elsewhere (Local Proxy)"
    type: looker_grid
    model: streaming_platform
    explore: sessions
    dimensions: [tips.menu_item]
    measures: [tips.median_price, tips.funnel_4_tipped]
    sorts: [tips.funnel_4_tipped desc]
    limit: 10
    show_view_names: false
    show_row_numbers: false
    row: 42
    col: 12
    width: 12
    height: 8

  # ─── SCHEDULE INSIGHTS ──────────────────────────────────────────────────
  - name: section_schedule
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="display:flex; align-items:center; gap:8px; font-size:24px; font-weight:600; color:#111; padding:4px 0;">
            Schedule Insights
            <span style="flex:1; height:1px; background:#ccc; margin-left:8px;"></span>
          </div>
          <div style="font-size:14px; color:#888; font-style:italic; padding:2px 0 8px;">Broadcast timing, audience activity, and scheduling opportunities</div>
      </div>
    row: 50
    col: 0
    width: 24
    height: 2

  - name: when_fans_tip_heatmap
    title: "When Your Fans Tip You (Heatmap)"
    type: looker_grid
    model: streaming_platform
    explore: sessions
    dimensions: [tips.tip_day_of_week]
    pivots: [tips.tip_hour_of_day]
    measures: [tips.count_tips]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    enable_conditional_formatting: true
    conditional_formatting:
      - type: along a scale
        value_format: null
        background_color: "#1f3e5a"
        font_color: null
        color_application:
          collection_id: legacy
          palette_id: legacy_sequential1
        bold: false
        italic: false
        strikethrough: false
        fields: []
    row: 52
    col: 0
    width: 24
    height: 9
