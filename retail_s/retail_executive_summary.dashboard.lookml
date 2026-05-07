- dashboard: retail_executive_summary
  title: "Retail Performance Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Executive summary of retail sales, merchandising, and operational metrics."

  # --- Dashboard Filters ---
  filters:
  - name: Order Date
    title: Order Date
    type: field_filter
    default_value: "Last 90 Days"
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: retail_s # <-- Update to your actual model name if different
    explore: order_items
    listens_to_filters: []
    field: orders.created_date

  - name: Category
    title: Category
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: retail_s
    explore: order_items
    listens_to_filters: []
    field: products.category

  elements:
  # ==========================================
  # ROW 1: HEADER & NAVIGATION (TEXT TILE)
  # ==========================================
  - name: "Header and Menu"
    type: text
    title_text: ""
    subtitle_text: ""
    body_text: |-
      <div style="border-bottom: solid 2px #4285F4; padding-bottom: 10px; margin-bottom: 10px;">
        <h1 style="font-size: 28px; color: #333333; margin: 0;">Retail Executive Summary</h1>
        <p style="font-size: 14px; color: #666666; margin-top: 5px;">Comprehensive overview of revenue, margins, and operational health.</p>
        <nav style="font-size: 14px; margin-top: 15px;">
          <a href="#kpis" style="text-decoration: none; color: #4285F4; font-weight: bold; margin-right: 15px;">📊 Executive KPIs</a> |
          <a href="#sales" style="text-decoration: none; color: #4285F4; font-weight: bold; margin-right: 15px; margin-left: 15px;">🛍️ Sales & Merchandising</a> |
          <a href="#ops" style="text-decoration: none; color: #4285F4; font-weight: bold; margin-left: 15px;">📦 Fulfillment & Operations</a>
        </nav>
      </div>
    row: 0
    col: 0
    width: 24
    height: 3

  # ==========================================
  # SECTION 1: EXECUTIVE KPIs
  # ==========================================
  - name: "Section 1: KPIs"
    type: text
    title_text: ""
    body_text: "<h2 id='kpis' style='color: #202124; margin: 0;'>Executive KPIs</h2>"
    row: 3
    col: 0
    width: 24
    height: 2

  - name: "Total Revenue"
    title: Total Revenue
    type: single_value
    model: retail_s
    explore: order_items
    measures: [order_items.total_revenue]
    filters:
      orders.status: "-Cancelled"
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 5
    col: 0
    width: 6
    height: 3

  - name: "Gross Margin %"
    title: Gross Margin %
    type: single_value
    model: retail_s
    explore: order_items
    measures: [order_items.gross_margin_percentage]
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 5
    col: 6
    width: 6
    height: 3

  - name: "Total Orders"
    title: Total Orders
    type: single_value
    model: retail_s
    explore: order_items
    measures: [orders.count]
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 5
    col: 12
    width: 6
    height: 3

  - name: "Return Rate"
    title: Return Rate
    type: single_value
    model: retail_s
    explore: order_items
    measures: [orders.return_rate]
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 5
    col: 18
    width: 6
    height: 3

  # ==========================================
  # SECTION 2: SALES & MERCHANDISING
  # ==========================================
  - name: "Section 2: Sales"
    type: text
    title_text: ""
    body_text: "<br><hr style='border: 0; height: 1px; background: #e0e0e0; margin-bottom: 15px;'><h2 id='sales' style='color: #202124; margin: 0;'>Sales & Merchandising</h2><p style='color: #5f6368; font-size: 13px;'>Trend analysis and product performance.</p>"
    row: 8
    col: 0
    width: 24
    height: 3

  - name: "Revenue vs Margin Trend"
    title: Revenue vs Margin Trend (Monthly)
    type: looker_line
    model: retail_s
    explore: order_items
    dimensions: [orders.created_month]
    measures: [order_items.total_revenue, order_items.total_gross_margin]
    sorts: [orders.created_month asc]
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    legend_position: bottom
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 11
    col: 0
    width: 12
    height: 8

  - name: "Revenue by Category"
    title: Revenue by Category
    type: looker_pie
    model: retail_s
    explore: order_items
    dimensions: [products.category]
    measures: [order_items.total_revenue]
    sorts: [order_items.total_revenue desc]
    value_labels: legend
    label_type: labPer
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 11
    col: 12
    width: 12
    height: 8

  - name: "Top 10 Brands by Margin"
    title: Top 10 Brands by Margin
    type: looker_grid
    model: retail_s
    explore: order_items
    dimensions: [products.brand]
    measures: [order_items.total_revenue, order_items.gross_margin_percentage]
    sorts: [order_items.total_revenue desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    conditional_formatting: [{"type":"data_bar","value_format":null,"background_color":null,"color":"#4285F4","color_application":{"collection_id":"b43731d5-dc87-4a8e-b807-635bef3948e9","palette_id":"1e4d66b9-f066-4c33-b0b7-cc10cb00f8df","options":{"steps":5}},"rule_field":"order_items.total_revenue","id":"1"}]
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 19
    col: 0
    width: 12
    height: 7

  - name: "User Acquisition Source"
    title: User Acquisition Source
    type: looker_column
    model: retail_s
    explore: order_items
    dimensions: [users.traffic_source]
    measures: [users.count]
    sorts: [users.count desc]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_value_labels: true
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 19
    col: 12
    width: 12
    height: 7

  # ==========================================
  # SECTION 3: OPERATIONS
  # ==========================================
  - name: "Section 3: Operations"
    type: text
    title_text: ""
    body_text: "<br><hr style='border: 0; height: 1px; background: #e0e0e0; margin-bottom: 15px;'><h2 id='ops' style='color: #202124; margin: 0;'>Fulfillment & Operations</h2><p style='color: #5f6368; font-size: 13px;'>Shipping efficiency and store-level return metrics.</p>"
    row: 26
    col: 0
    width: 24
    height: 3

  - name: "Store Logistics Performance"
    title: Store Logistics Performance
    type: looker_grid
    model: retail_s
    explore: order_items
    dimensions: [stores.store_name, stores.state]
    measures: [orders.count, orders.average_days_to_ship, orders.return_rate]
    sorts: [orders.count desc]
    show_view_names: false
    show_row_numbers: true
    conditional_formatting: [{"type":"low to high","value_format":null,"background_color":null,"color":null,"color_application":{"collection_id":"b43731d5-dc87-4a8e-b807-635bef3948e9","palette_id":"85de97da-2ded-4dec-9ceb-36d14c8ca93c","options":{"steps":5}},"rule_field":"orders.average_days_to_ship","id":"2"},{"type":"low to high","value_format":null,"background_color":null,"color":null,"color_application":{"collection_id":"b43731d5-dc87-4a8e-b807-635bef3948e9","palette_id":"85de97da-2ded-4dec-9ceb-36d14c8ca93c","options":{"steps":5}},"rule_field":"orders.return_rate","id":"3"}]
    listen:
      Order Date: orders.created_date
      Category: products.category
    row: 29
    col: 0
    width: 24
    height: 8
