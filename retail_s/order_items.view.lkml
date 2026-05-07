view: order_items {
  sql_table_name: `ant-billet-looker-core-argolis.retail_s.order_items` ;;
  drill_fields: [order_item_id]

  dimension: order_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_item_id ;;
  }
  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  # --- NEW: Margin Dimensions ---
  dimension: gross_margin {
    type: number
    description: "Difference between sale price and product cost"
    sql: ${sale_price} - ${products.cost} ;;
    value_format_name: usd
  }

  dimension: is_profitable {
    type: yesno
    description: "Did this item sell for more than its cost?"
    sql: ${gross_margin} > 0 ;;
  }

  # --- NEW: Key Financial Measures ---
  measure: count {
    type: count
    drill_fields: [order_item_id, products.product_id, products.product_name, orders.order_id]
  }

  measure: total_revenue {
    type: sum
    description: "Total Revenue from items sold"
    sql: ${sale_price} ;;
    value_format_name: usd
    drill_fields: [products.category, products.brand, total_revenue]
  }

  measure: total_gross_margin {
    type: sum
    description: "Total Gross Margin (Revenue - Cost)"
    sql: ${gross_margin} ;;
    value_format_name: usd
  }

  measure: gross_margin_percentage {
    type: number
    description: "Total Gross Margin / Total Revenue"
    sql: 1.0 * ${total_gross_margin} / NULLIF(${total_revenue}, 0) ;;
    value_format_name: percent_2
  }
}
