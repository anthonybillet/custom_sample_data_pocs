
- dashboard: creator_insights
  title: 'Creator Insights: Demo_creator'
  preferred_viewer: dashboards-next
  description: A replica of the Creator Insights PDF dashboard built on the granular
    data model.
  preferred_slug: mIOxQpa70sICrKKthxFZMg
  theme_name: ''
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - name: ''
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
    tab_name: ''
  - title: Unique Logged-In Viewers
    name: Unique Logged-In Viewers
    model: streaming_platform
    explore: sessions
    type: single_value
    fields: [sessions.count_unique_viewers]
    listen: {}
    row: 7
    col: 0
    width: 6
    height: 2
    tab_name: ''
  - title: Total Tokens Earned
    name: Total Tokens Earned
    model: streaming_platform
    explore: sessions
    type: single_value
    fields: [tips.total_tokens]
    listen: {}
    row: 7
    col: 6
    width: 6
    height: 2
    tab_name: ''
  - title: Followers Gained
    name: Followers Gained
    model: streaming_platform
    explore: sessions
    type: single_value
    fields: [users.count_users]
    filters:
      users.is_follower: 'Yes'
    listen: {}
    row: 7
    col: 12
    width: 6
    height: 2
    tab_name: ''
  - title: Days Active
    name: Days Active
    model: streaming_platform
    explore: sessions
    type: single_value
    fields: [broadcasts.count_broadcast_days]
    listen: {}
    row: 7
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (2)"
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
    row: 3
    col: 0
    width: 24
    height: 4
    tab_name: ''
  - name: " (3)"
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
    row: 9
    col: 0
    width: 24
    height: 5
    tab_name: ''
  - name: " (4)"
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="display:flex; align-items:center; gap:8px; font-size:24px; font-weight:600; color:#111; padding:4px 0;">
            Audience Insights
            <span style="flex:1; height:1px; background:#ccc; margin-left:8px;"></span>
          </div>
          <div style="font-size:14px; color:#888; font-style:italic; padding:2px 0 8px;">How viewers find you and how long they stay</div>
      </div>
    row: 14
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: How Long They Stay
    name: How Long They Stay
    model: streaming_platform
    explore: sessions
    type: looker_column
    fields: [sessions.duration_bucket, sessions.count_unique_viewers]
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
    listen: {}
    row: 16
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Engagement Funnel
    name: Engagement Funnel
    model: streaming_platform
    explore: sessions
    type: looker_funnel
    fields: [sessions.funnel_1_room_entries, sessions.funnel_2_watched_1_min, sessions.funnel_3_interacted,
      tips.funnel_4_tipped]
    limit: 5000
    column_limit: 50
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: rows
    labelPosition: left
    percentType: prior
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    barColors: ["#36B5D0", "#7E57C2", "#F0A830", "#6BBF59"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    isStepped: true
    labelScale: '0.5'
    labelOverlap: false
    global_tooltip_options:
      custom_tooltips_enabled: false
      template: |-
        <div style="padding: 5px 0;">
                <div>1. Room Entries</div>
                <div style="font-weight: bold;">{{ sessions.funnel_1_room_entries }}</div>
              </div><div style="padding: 5px 0;">
                <div>2. Watched 1+ Min</div>
                <div style="font-weight: bold;">{{ sessions.funnel_2_watched_1_min }}</div>
              </div><div style="padding: 5px 0;">
                <div>3. Interacted</div>
                <div style="font-weight: bold;">{{ sessions.funnel_3_interacted }}</div>
              </div><div style="padding: 5px 0;">
                <div>4. Tipped</div>
                <div style="font-weight: bold;">{{ tips.funnel_4_tipped }}</div>
              </div>
      style:
        font_size: 12
        font_family: Roboto, 'Noto Sans', 'Noto Sans JP', 'Noto Sans CJK KR', 'Noto
          Sans Arabic UI', 'Noto Sans Devanagari UI', 'Noto Sans Hebrew', 'Noto Sans
          Thai UI', Helvetica, Arial, sans-serif
        font_color: "#FFFFFF"
        background_color: "#262D33"
        border_radius: 4
        border_color: transparent
        box_shadow: none
        align: left
    defaults_version: 1
    listen: {}
    row: 16
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: How Viewers Find You
    name: How Viewers Find You
    model: streaming_platform
    explore: sessions
    type: looker_bar
    fields: [sessions.traffic_source, sessions.count_unique_viewers]
    pivots: [sessions.traffic_source]
    sorts: [sessions.traffic_source]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: Direct - sessions.count_unique_viewers,
            id: Direct - sessions.count_unique_viewers, name: Direct}, {axisId: Follows
              - sessions.count_unique_viewers, id: Follows - sessions.count_unique_viewers,
            name: Follows}, {axisId: Other - sessions.count_unique_viewers, id: Other
              - sessions.count_unique_viewers, name: Other}, {axisId: Recommendations
              - sessions.count_unique_viewers, id: Recommendations - sessions.count_unique_viewers,
            name: Recommendations}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    series_colors:
      Follows: "#6BBF59"
      Recommendations: "#5BC0DE"
      Direct: "#F0A830"
      Other: "#BBBBBB"
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 24
    col: 0
    width: 24
    height: 6
    tab_name: ''
  - name: " (5)"
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="display:flex; align-items:center; gap:8px; font-size:24px; font-weight:600; color:#111; padding:4px 0;">
            Tag Insights
            <span style="flex:1; height:1px; background:#ccc; margin-left:8px;"></span>
          </div>
          <div style="font-size:14px; color:#888; font-style:italic; padding:2px 0 8px;">Hashtag performance and audience compatibility analysis</div>
      </div>
    row: 30
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Your Hashtag Performance
    name: Your Hashtag Performance
    model: streaming_platform
    explore: sessions
    type: looker_grid
    fields: [sessions.entry_hashtag, sessions.count_unique_viewers, sessions.count_days_active,
      sessions.average_viewers_per_day]
    sorts: [sessions.count_unique_viewers desc]
    limit: 10
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    listen: {}
    row: 32
    col: 0
    width: 12
    height: 7
    tab_name: ''
  - name: untapped_opportunities
    title: "Untapped Opportunities"
    type: looker_scatter
    model: streaming_platform
    explore: hashtag_affinity
    dimensions: [hashtag_affinity.exploring_hashtag, hashtag_affinity.usage_status]
    measures: [hashtag_affinity.total_population_reach, hashtag_affinity.average_affinity, hashtag_affinity.total_audience_reach]
    show_view_names: false
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: true
    x_axis_label: "Potential Reach"
    y_axis_label: "Audience Compatibility"
    size_by_field: hashtag_affinity.total_audience_reach
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      custom_color:
        id: 3c6b24cb-626a-493a-a178-5e201b16c87e
        label: Custom Color
        type: continuous
        stops:
        - color: "#e67e22"
          offset: 0
        - color: "#1abc9c"
          offset: 100
    series_colors:
      "Currently used": "#1abc9c"
      "Not yet used": "#e67e22"
    row: 33
    col: 12
    width: 12
    height: 7
  - name: " (6)"
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="display:flex; align-items:center; gap:8px; font-size:24px; font-weight:600; color:#111; padding:4px 0;">
            Tip Menu Insights
            <span style="flex:1; height:1px; background:#ccc; margin-left:8px;"></span>
          </div>
          <div style="font-size:14px; color:#888; font-style:italic; padding:2px 0 8px;">Menu performance, pricing insights, and what your audience responds to</div>
      </div>
    row: 39
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: What Your Tippers Buy From You
    name: What Your Tippers Buy From You
    model: streaming_platform
    explore: sessions
    type: looker_grid
    fields: [tips.menu_item, tips.median_price, tips.total_tokens, tips.funnel_4_tipped]
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
    listen: {}
    row: 41
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - name: what_tippers_buy_elsewhere
    title: "What Your Tippers Buy Elsewhere"
    type: looker_grid
    model: streaming_platform
    explore: global_menu_performance
    dimensions: [global_menu_performance.menu_item]
    measures: [global_menu_performance.global_median_price, global_menu_performance.your_tippers_count]
    sorts: [global_menu_performance.your_tippers_count desc]
    limit: 10
    show_view_names: false
    show_row_numbers: false
    row: 42
    col: 12
    width: 12
    height: 8
  - name: " (7)"
    type: text
    body_text: |-
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
          <div style="display:flex; align-items:center; gap:8px; font-size:24px; font-weight:600; color:#111; padding:4px 0;">
            Schedule Insights
            <span style="flex:1; height:1px; background:#ccc; margin-left:8px;"></span>
          </div>
          <div style="font-size:14px; color:#888; font-style:italic; padding:2px 0 8px;">Broadcast timing, audience activity, and scheduling opportunities</div>
      </div>
    row: 49
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: When Your Fans Tip You (Heatmap)
    name: When Your Fans Tip You (Heatmap)
    model: streaming_platform
    explore: sessions
    type: looker_grid
    fields: [tips.tip_day_of_week, tips.count_tips, tips.tip_hour_of_day]
    pivots: [tips.tip_hour_of_day]
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale, value_format: !!null '', background_color: "#1f3e5a",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential1},
        bold: false, italic: false, strikethrough: false, fields: []}]
    listen: {}
    row: 51
    col: 0
    width: 24
    height: 9
    tab_name: ''
