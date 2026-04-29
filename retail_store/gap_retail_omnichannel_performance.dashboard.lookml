- dashboard: gap_retail_omnichannel_performance
  title: GAP Omni-Channel Performance Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Comprehensive overview of Omni-Channel Retail Performance, answering key questions around e-commerce vs. brick & mortar, product performance, and customer purchasing behavior."

  # --- DASHBOARD FILTERS ---
  filters:
  - name: Transaction Date
    title: Transaction Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
  - name: Sales Channel
    title: Sales Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: retail_store
    explore: fact_sales
    field: fact_sales.sales_channel
  - name: Department
    title: Department
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: retail_store
    explore: fact_sales
    field: dim_product.department
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: retail_store
    explore: fact_sales
    field: dim_store.region

  elements:

  # ==========================================
  # SECTION 1: EXECUTIVE SUMMARY
  # ==========================================
  - name: header_executive
    type: text
    title_text: "📈 1. Executive Summary"
    subtitle_text: "Top-level health metrics across all sales channels"
    body_text: "Use the filters at the top to slice these KPIs by Date, Channel, Department, or Region."
    row: 0
    col: 0
    width: 24
    height: 3

  - name: kpi_net_sales
    title: Total Net Sales
    model: retail_store
    explore: fact_sales
    type: single_value
    fields: [fact_sales.total_net_sales]
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 3
    col: 0
    width: 6
    height: 4

  - name: kpi_margin
    title: Total Gross Margin
    model: retail_store
    explore: fact_sales
    type: single_value
    fields: [fact_sales.total_gross_margin]
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 3
    col: 6
    width: 6
    height: 4

  - name: kpi_aov
    title: Average Order Value (AOV)
    model: retail_store
    explore: fact_sales
    type: single_value
    fields: [fact_sales.average_order_value]
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 3
    col: 12
    width: 6
    height: 4

  - name: kpi_return_rate
    title: Return Rate %
    model: retail_store
    explore: fact_sales
    type: single_value
    fields: [fact_sales.return_rate]
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 3
    col: 18
    width: 6
    height: 4

  # ==========================================
  # SECTION 2: CHANNEL PERFORMANCE
  # ==========================================
  - name: header_channel
    type: text
    title_text: "🌐 2. Channel Performance (E-Commerce vs. Retail)"
    subtitle_text: "How do our digital channels compare to brick-and-mortar?"
    row: 7
    col: 0
    width: 24
    height: 2

  - name: chart_sales_by_channel
    title: Net Sales by Channel
    model: retail_store
    explore: fact_sales
    type: looker_pie
    fields: [fact_sales.sales_channel, fact_sales.total_net_sales]
    sorts: [fact_sales.total_net_sales desc]
    value_labels: legend
    label_type: labPer
    listen:
      Transaction Date: fact_sales.transaction_date
      Department: dim_product.department
      Region: dim_store.region
    row: 9
    col: 0
    width: 8
    height: 7

  - name: chart_sales_trend
    title: Omni-Channel Sales Trend
    model: retail_store
    explore: fact_sales
    type: looker_line
    fields: [fact_sales.transaction_week, fact_sales.sales_channel, fact_sales.total_net_sales]
    pivots: [fact_sales.sales_channel]
    sorts: [fact_sales.transaction_week desc]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_values: false
    listen:
      Transaction Date: fact_sales.transaction_date
      Department: dim_product.department
      Region: dim_store.region
    row: 9
    col: 8
    width: 16
    height: 7

  - name: chart_aov_by_channel
    title: Average Order Value by Channel
    model: retail_store
    explore: fact_sales
    type: looker_column
    fields: [fact_sales.sales_channel, fact_sales.average_order_value]
    sorts: [fact_sales.average_order_value desc]
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Department: dim_product.department
      Region: dim_store.region
    row: 16
    col: 0
    width: 12
    height: 6

  - name: chart_return_rate_channel
    title: Return Rate by Channel
    model: retail_store
    explore: fact_sales
    type: looker_bar
    fields: [fact_sales.sales_channel, fact_sales.return_rate]
    sorts: [fact_sales.return_rate desc]
    show_values: true
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
    listen:
      Transaction Date: fact_sales.transaction_date
      Department: dim_product.department
      Region: dim_store.region
    row: 16
    col: 12
    width: 12
    height: 6

  # ==========================================
  # SECTION 3: PRODUCT & ASSORTMENT
  # ==========================================
  - name: header_product
    type: text
    title_text: "👕 3. Product & Assortment Insights"
    subtitle_text: "What are our customers buying, and what is most profitable?"
    row: 22
    col: 0
    width: 24
    height: 2

  - name: chart_top_categories
    title: Top Categories by Net Sales
    model: retail_store
    explore: fact_sales
    type: looker_bar
    fields: [dim_product.category, fact_sales.total_net_sales]
    sorts: [fact_sales.total_net_sales desc]
    limit: 10
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 24
    col: 0
    width: 8
    height: 8

  - name: chart_margin_by_dept
    title: Gross Margin by Department
    model: retail_store
    explore: fact_sales
    type: looker_column
    fields: [dim_product.department, fact_sales.total_gross_margin]
    sorts: [fact_sales.total_gross_margin desc]
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 24
    col: 8
    width: 8
    height: 8

  - name: chart_units_by_size
    title: Units Sold by Size Group
    model: retail_store
    explore: fact_sales
    type: looker_column
    fields: [dim_product.size_group, fact_sales.total_units_sold]
    sorts: [fact_sales.total_units_sold desc]
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 24
    col: 16
    width: 8
    height: 8

  - name: table_best_sellers
    title: Top 10 Best Selling Products
    model: retail_store
    explore: fact_sales
    type: looker_grid
    fields: [dim_product.product_id, dim_product.product_name, dim_product.category, fact_sales.total_net_sales, fact_sales.total_units_sold]
    sorts: [fact_sales.total_net_sales desc]
    limit: 10
    show_view_names: false
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 32
    col: 0
    width: 12
    height: 6

  - name: table_high_returns
    title: High Risk) Top 10 Products by Return Rate
    model: retail_store
    explore: fact_sales
    type: looker_grid
    fields: [dim_product.product_id, dim_product.product_name, dim_product.department, fact_sales.return_rate, fact_sales.total_units_sold]
    filters:
      fact_sales.total_units_sold: ">=50" # Ensure statistical significance
    sorts: [fact_sales.return_rate desc]
    limit: 10
    show_view_names: false
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 32
    col: 12
    width: 12
    height: 6

  # ==========================================
  # SECTION 4: BRICK & MORTAR / GEOGRAPHY
  # ==========================================
  - name: header_stores
    type: text
    title_text: "📍 4. Store Footprint & Geography"
    subtitle_text: "Analyzing physical store performance and regional sales density"
    row: 38
    col: 0
    width: 24
    height: 2

  - name: map_sales_by_state
    title: Sales by State Map
    model: retail_store
    explore: fact_sales
    type: looker_map
    fields: [dim_store.state, fact_sales.total_net_sales]
    map: usa
    map_projection: ''
    show_view_names: false
    quantize_colors: false
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 40
    col: 0
    width: 10
    height: 9

  - name: chart_top_stores
    title: Top 10 Physical Stores by Net Sales
    model: retail_store
    explore: fact_sales
    type: looker_bar
    fields: [dim_store.store_name, dim_store.city, fact_sales.total_net_sales]
    filters:
      dim_store.store_name: "-NULL" # Exclude e-commerce if store is null
    sorts: [fact_sales.total_net_sales desc]
    limit: 10
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Department: dim_product.department
      Region: dim_store.region
    row: 40
    col: 10
    width: 14
    height: 5

  - name: chart_store_type
    title: Performance by Store Type
    model: retail_store
    explore: fact_sales
    type: looker_column
    fields: [dim_store.store_type, fact_sales.total_net_sales]
    filters:
      dim_store.store_type: "-NULL"
    sorts: [fact_sales.total_net_sales desc]
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Department: dim_product.department
      Region: dim_store.region
    row: 45
    col: 10
    width: 7
    height: 4

  - name: chart_store_size_aov
    title: AOV by Store Size Tier
    model: retail_store
    explore: fact_sales
    type: looker_column
    fields: [dim_store.store_size_tier, fact_sales.average_order_value]
    filters:
      dim_store.store_size_tier: "-NULL"
    sorts: [fact_sales.average_order_value desc]
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Department: dim_product.department
      Region: dim_store.region
    row: 45
    col: 17
    width: 7
    height: 4

  # ==========================================
  # SECTION 5: TRANSACTION ANALYSIS
  # ==========================================
  - name: header_transactions
    type: text
    title_text: "🛒 5. Transaction Analysis & Discounting"
    subtitle_text: "Basket analysis, promotional impacts, and shopping habits"
    row: 49
    col: 0
    width: 24
    height: 2

  - name: chart_gross_vs_net
    title: Gross vs. Net Sales (Discount Impact)
    model: retail_store
    explore: fact_sales
    type: looker_area
    fields: [fact_sales.transaction_month, fact_sales.total_gross_sales, fact_sales.total_net_sales]
    sorts: [fact_sales.transaction_month desc]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_values: false
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 51
    col: 0
    width: 12
    height: 7

  - name: chart_upt_trend
    title: Units Per Transaction (UPT) Trend
    model: retail_store
    explore: fact_sales
    type: looker_line
    fields: [fact_sales.transaction_month, fact_sales.units_per_transaction]
    sorts: [fact_sales.transaction_month desc]
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 51
    col: 12
    width: 12
    height: 7

  - name: chart_sales_day_of_week
    title: Shopping Habit) Sales by Day of Week
    model: retail_store
    explore: fact_sales
    type: looker_column
    fields: [fact_sales.transaction_day_of_week, fact_sales.total_net_sales]
    sorts: [fact_sales.transaction_day_of_week]
    show_values: true
    listen:
      Transaction Date: fact_sales.transaction_date
      Sales Channel: fact_sales.sales_channel
      Department: dim_product.department
      Region: dim_store.region
    row: 58
    col: 0
    width: 24
    height: 6
