---
- dashboard: cloud_cost_usage_reporting
  title: Cloud Cost Usage Reporting
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: Unified view of GCP, AWS, and OCI spend mapped to the FOCUS specification.
  preferred_slug: 7F46G1pXGcDyYbflb8deuc
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - name: Executive Overview
    type: text
    title_text: Executive Overview
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 1
    tab_name: ''
  - title: Total Billed Cost
    name: Total Billed Cost
    model: ccm
    explore: unified_focus_cost
    type: single_value
    fields: [unified_focus_cost.total_billed_cost]
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 1
    col: 0
    width: 6
    height: 2
    tab_name: ''
  - title: Spend by Cloud Provider
    name: Spend by Cloud Provider
    model: ccm
    explore: unified_focus_cost
    type: looker_pie
    fields: [unified_focus_cost.provider_name, unified_focus_cost.total_billed_cost]
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 3
    col: 0
    width: 6
    height: 6
    tab_name: ''
  - name: Cost Trends & Categorization
    type: text
    title_text: Cost Trends & Categorization
    subtitle_text: ''
    body_text: ''
    row: 9
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Daily Spend by Provider
    name: Daily Spend by Provider
    model: ccm
    explore: unified_focus_cost
    type: looker_column
    fields: [unified_focus_cost.charge_period_start_date, unified_focus_cost.provider_name,
      unified_focus_cost.total_billed_cost]
    pivots: [unified_focus_cost.provider_name]
    fill_fields: [unified_focus_cost.charge_period_start_date]
    stacking: normal
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    legend_position: center
    show_value_labels: false
    show_totals_labels: true
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 1
    col: 6
    width: 18
    height: 8
    tab_name: ''
  - title: Month-over-Month Trend
    name: Month-over-Month Trend
    model: ccm
    explore: unified_focus_cost
    type: looker_line
    fields: [unified_focus_cost.charge_period_start_month, unified_focus_cost.provider_name,
      unified_focus_cost.total_billed_cost]
    pivots: [unified_focus_cost.provider_name]
    fill_fields: [unified_focus_cost.charge_period_start_month]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_x_axis_label: false
    point_style: circle
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 11
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Spend by Service Category
    name: Spend by Service Category
    model: ccm
    explore: unified_focus_cost
    type: looker_bar
    fields: [unified_focus_cost.service_category, unified_focus_cost.total_billed_cost]
    sorts: [unified_focus_cost.total_billed_cost desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_x_axis_label: false
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 11
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - name: Granular Cost Breakdown
    type: text
    title_text: Granular Cost Breakdown
    subtitle_text: ''
    body_text: ''
    row: 19
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Top 10 Highest Cost Services
    name: Top 10 Highest Cost Services
    model: ccm
    explore: unified_focus_cost
    type: looker_grid
    fields: [unified_focus_cost.service_name, unified_focus_cost.provider_name, unified_focus_cost.total_billed_cost]
    sorts: [unified_focus_cost.total_billed_cost desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 21
    col: 0
    width: 8
    height: 8
    tab_name: ''
  - title: Top 10 Accounts / Projects by Spend
    name: Top 10 Accounts / Projects by Spend
    model: ccm
    explore: unified_focus_cost
    type: looker_grid
    fields: [unified_focus_cost.sub_account_id, unified_focus_cost.provider_name,
      unified_focus_cost.total_billed_cost]
    sorts: [unified_focus_cost.total_billed_cost desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 21
    col: 8
    width: 8
    height: 8
    tab_name: ''
  - title: Spend by Geography (Region)
    name: Spend by Geography (Region)
    model: ccm
    explore: unified_focus_cost
    type: looker_bar
    fields: [unified_focus_cost.region_id, unified_focus_cost.total_billed_cost]
    sorts: [unified_focus_cost.total_billed_cost desc]
    limit: 15
    show_view_names: false
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 21
    col: 16
    width: 8
    height: 8
    tab_name: ''
  - title: Cross-Cloud Spend Heatmap
    name: Cross-Cloud Spend Heatmap
    model: ccm
    explore: unified_focus_cost
    type: looker_grid
    fields: [unified_focus_cost.service_category, unified_focus_cost.total_billed_cost,
      unified_focus_cost.provider_name]
    pivots: [unified_focus_cost.provider_name]
    filters:
      unified_focus_cost.provider_name: ''
      unified_focus_cost.charge_period_start_date: ''
    sorts: [unified_focus_cost.provider_name, unified_focus_cost.total_billed_cost
        desc 0]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      unified_focus_cost.total_billed_cost:
        is_active: false
    table_show_footer: false
    table_enable_pagination: false
    table_page_size_options: 20, 50, 100
    table_column_hover_highlight_enable: false
    table_show_headers: true
    header_font_bold: false
    header_font_italic: false
    cell_font_size: '12'
    cell_font_weight: ''
    cell_font_style: ''
    cell_text_alignment: ''
    table_custom_border_enable: false
    table_custom_border_width:
    table_custom_border_color: "#dde2eb"
    table_custom_border_style: solid
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    cell_visualization: false
    defaults_version: 1
    listen:
      Provider Name: unified_focus_cost.provider_name
      Service Category: unified_focus_cost.service_category
      Date: unified_focus_cost.charge_period_start_date
    row: 29
    col: 0
    width: 24
    height: 8
    tab_name: ''
  filters:
  - name: Provider Name
    title: Provider Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: ccm
    explore: unified_focus_cost
    listens_to_filters: []
    field: unified_focus_cost.provider_name
  - name: Service Category
    title: Service Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ccm
    explore: unified_focus_cost
    listens_to_filters: []
    field: unified_focus_cost.service_category
  - name: Date
    title: Date
    type: field_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ccm
    explore: unified_focus_cost
    listens_to_filters: []
    field: unified_focus_cost.charge_period_start_date
