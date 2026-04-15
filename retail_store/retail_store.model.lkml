connection: "argolis"

include: "/retail_store/*.view.lkml"

explore: fact_sales {
  label: "Retail Sales Analysis"
  description: "Comprehensive explore for analyzing retail sales performance across omni-channel, products, and brick-and-mortar stores."

  # Join the Product Dimension
  join: dim_product {
    type: left_outer
    sql_on: ${fact_sales.product_id} = ${dim_product.product_id} ;;
    relationship: many_to_one
  }

  # Join the Store Dimension
  join: dim_store {
    type: left_outer
    sql_on: ${fact_sales.store_id} = ${dim_store.store_id} ;;
    relationship: many_to_one
  }
}
