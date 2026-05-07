connection: "argolis"

include: "/retail_s/*.view.lkml"
include: "/retail_s/retail_executive_summary.dashboard.lookml"

explore: order_items {
  label: "Retail Transactions"
  description: "Explore for analyzing granular order items, sales, and linked dimension tables."

  # 1. Join Order Items to Orders
  join: orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
  }

  # 2. Join Order Items to Products
  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.product_id} ;;
  }

  # 3. Join Orders to Users (using the orders table as the bridge)
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users.user_id} ;;
  }

  # 4. Join Orders to Stores (using the orders table as the bridge)
  join: stores {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.store_id} = ${stores.store_id} ;;
  }
}
