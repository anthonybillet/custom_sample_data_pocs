view: products {
  sql_table_name: `ant-billet-looker-core-argolis.retail_s.products` ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, product_name, order_items.count]
  }

# --- NEW: Pricing Dimensions ---
  dimension: markup_amount {
    type: number
    description: "Difference between Retail Price and Cost"
    sql: ${TABLE}.retail_price - ${TABLE}.cost ;;
    value_format_name: usd
  }

  dimension: markup_percentage {
    type: number
    description: "Markup as a percentage of Cost"
    sql: 1.0 * (${markup_amount} / NULLIF(${TABLE}.cost, 0)) ;;
    value_format_name: percent_2
  }

  dimension: price_tier {
    type: tier
    tiers: [10, 25, 50, 100, 200]
    style: integer
    sql: ${TABLE}.retail_price ;;
    value_format_name: usd_0
  }

  # --- NEW: Catalog Measures --

  measure: average_cost {
    type: average
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }

  measure: average_retail_price {
    type: average
    sql: ${TABLE}.retail_price ;;
    value_format_name: usd
  }
}
