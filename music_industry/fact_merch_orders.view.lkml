view: fact_merch_orders {
  sql_table_name: `ant-billet-looker-core-argolis.music_industry.FACT_MERCH_ORDERS` ;;

  dimension: order_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: artist_id {
    hidden: yes
    type: string
    sql: ${TABLE}.artist_id ;;
  }

  dimension: fan_id {
    hidden: yes
    type: string
    sql: ${TABLE}.fan_id ;;
  }

  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
    label: "Order Date"
    description: "The date the merchandise order was placed by the fan."
    synonyms: ["purchase date", "sale date", "transaction date"]
  }

  dimension: item_category {
    type: string
    sql: ${TABLE}.item_category ;;
    label: "Item Category"
    description: "Category of the D2C item sold (e.g., Vinyl, Tour Apparel, VIP Experience)."
    synonyms: ["merch type", "product category", "goods type"]
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
  measure: total_orders {
    type: count_distinct
    sql: ${order_id} ;;
    label: "Total Orders"
    description: "Count of unique merch orders."
    synonyms: ["order count", "number of purchases", "transactions"]
    drill_fields: [merch_drill_details*]
  }

  measure: total_gross_revenue {
    type: sum
    sql: ${TABLE}.gross_revenue ;;
    value_format_name: usd
    label: "Total Gross Revenue"
    description: "Total top-line revenue from Direct-to-Consumer merch sales."
    synonyms: ["sales", "gross sales", "top line", "merch revenue", "d2c revenue"]
    drill_fields: [merch_drill_details*]
  }

  measure: total_net_margin_dollars {
    type: sum
    sql: ${TABLE}.net_margin ;;
    value_format_name: usd
    label: "Total Net Margin Dollars"
    description: "Total profit after costs (Gross Revenue - COGS)."
    synonyms: ["profit", "net profit", "margin dollars", "bottom line"]
    drill_fields: [merch_drill_details*]
  }

  # --- Complex Business Logic for Demo ---
  measure: gross_margin_percentage {
    type: number
    sql: 1.0 * ${total_net_margin_dollars} / NULLIF(${total_gross_revenue}, 0) ;;
    value_format_name: percent_2
    label: "Gross Margin Percentage"
    description: "Margin percentage on D2C sales. Critical metric for the CFO."
    synonyms: ["profit margin", "margin percent", "profitability"]
    drill_fields: [merch_drill_details*]
  }

  measure: average_revenue_per_fan {
    type: number
    sql: 1.0 * ${total_gross_revenue} / NULLIF(COUNT(DISTINCT ${fan_id}), 0) ;;
    value_format_name: usd
    label: "Average Revenue Per Fan (ARPU)"
    description: "ARPU (Average Revenue Per User) for Superfans buying merch."
    synonyms: ["arpu", "average order value", "customer lifetime value", "revenue per user"]
    drill_fields: [merch_drill_details*]
  }

  # --- Drill Sets ---
  set: merch_drill_details {
    fields: [
      order_date,
      dim_artists.artist_name,
      dim_fans.country,
      item_category,
      total_gross_revenue,
      gross_margin_percentage
    ]
  }
}
