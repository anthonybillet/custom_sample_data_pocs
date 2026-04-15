view: fact_sales {
  sql_table_name: `ant-billet-looker-core-argolis.retail_store.fact_sales` ;;

  dimension_group: _etl_loaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._etl_loaded_at ;;
    hidden: yes
  }

  dimension: transaction_line_id {
    primary_key: yes
    type: string
    label: "Transaction Line ID"
    description: "The unique identifier for the individual line item in a transaction."
    synonyms: ["line item id", "receipt line", "order row"]
    sql: ${TABLE}.transaction_line_id ;;
  }

  dimension: transaction_id {
    type: string
    label: "Transaction ID"
    description: "The unique identifier for the overarching order or store receipt."
    synonyms: ["order id", "receipt number", "basket id", "invoice id"]
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: customer_id {
    type: string
    label: "Customer ID"
    description: "The unique identifier for the purchasing customer."
    synonyms: ["shopper id", "client id", "buyer id", "member id"]
    sql: ${TABLE}.customer_id ;;
  }

  dimension: product_id {
    type: string
    label: "Product ID"
    description: "The identifier for the product sold on this line."
    sql: ${TABLE}.product_id ;;
  }

  dimension: store_id {
    type: string
    label: "Store ID"
    description: "The identifier for the store where the transaction occurred."
    synonyms: ["location id", "shop id"]
    sql: ${TABLE}.store_id ;;
  }

  dimension: promotion_id {
    type: string
    label: "Promotion ID"
    description: "The identifier of the marketing promotion applied to this line item."
    synonyms: ["promo code", "discount code", "campaign id"]
    sql: ${TABLE}.promotion_id ;;
  }

  dimension_group: transaction {
    type: time
    label: "Transaction"
    description: "The date and time when the sale took place."
    synonyms: ["purchase date", "sale date", "order date", "receipt date"]
    timeframes: [raw, time, date, week, month, quarter, year, day_of_week]
    sql: ${TABLE}.transaction_timestamp ;;
  }

  dimension: sales_channel {
    type: string
    label: "Sales Channel"
    description: "The channel through which the sale was made (e.g., Ecommerce, Brick & Mortar)."
    synonyms: ["purchase channel", "channel", "store vs online", "medium"]
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: is_ecommerce {
    type: yesno
    label: "Is Ecommerce"
    description: "Flags whether the transaction originated from the digital/online channel."
    synonyms: ["is online", "web order", "digital sale"]
    sql: LOWER(${sales_channel}) LIKE '%ecommerce%' OR LOWER(${sales_channel}) LIKE '%online%' ;;
  }

  dimension: is_return {
    type: yesno
    label: "Is Return"
    description: "Flags whether this line item represents a customer return."
    synonyms: ["refund", "returned item", "money back"]
    sql: ${TABLE}.is_return ;;
  }

  dimension: quantity {
    type: number
    label: "Quantity"
    description: "The number of units purchased or returned on this line item."
    synonyms: ["units", "item count", "pieces"]
    sql: ${TABLE}.quantity ;;
  }

  dimension: unit_price {
    type: number
    label: "Unit Price"
    description: "The price paid per individual unit."
    synonyms: ["price per item", "sold price"]
    sql: ${TABLE}.unit_price ;;
  }

  dimension: gross_sales_amount {
    type: number
    label: "Gross Sales Amount"
    description: "The total sales amount before discounts and taxes."
    synonyms: ["gross revenue", "pre-discount sales"]
    sql: ${TABLE}.gross_sales_amount ;;
  }

  dimension: discount_amount {
    type: number
    label: "Discount Amount"
    description: "The total amount discounted from the gross price."
    synonyms: ["markdown amount", "savings", "promo amount"]
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: net_sales_amount {
    type: number
    label: "Net Sales Amount"
    description: "The final sales amount after discounts and returns, before tax."
    synonyms: ["net revenue", "top line", "actual sales"]
    sql: ${TABLE}.net_sales_amount ;;
  }

  dimension: total_cost_amount {
    type: number
    label: "Total Cost Amount"
    description: "The total cost of goods sold for this transaction line."
    synonyms: ["total COGS", "extended cost"]
    sql: ${TABLE}.total_cost_amount ;;
  }

  dimension: tax_amount {
    type: number
    label: "Tax Amount"
    description: "The amount of tax collected for this line item."
    synonyms: ["sales tax", "VAT"]
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: gross_margin {
    type: number
    label: "Gross Margin Amount"
    description: "Net sales minus total cost."
    synonyms: ["profit", "margin dollars", "gross profit"]
    sql: ${net_sales_amount} - ${total_cost_amount} ;;
  }

  dimension: source_system {
    type: string
    hidden: yes
    sql: ${TABLE}.source_system ;;
  }

  # --- Measures ---

  measure: total_net_sales {
    type: sum
    label: "Total Net Sales"
    description: "The total top-line revenue generated after discounts."
    synonyms: ["total revenue", "overall sales", "net dollars"]
    sql: ${net_sales_amount} ;;
    value_format_name: usd
  }

  measure: total_gross_sales {
    type: sum
    label: "Total Gross Sales"
    description: "The total revenue before any discounts are applied."
    synonyms: ["gross volume", "total gross"]
    sql: ${gross_sales_amount} ;;
    value_format_name: usd
  }

  measure: total_gross_margin {
    type: sum
    label: "Total Gross Margin"
    description: "Total profit dollars (Net Sales - COGS)."
    synonyms: ["total profit", "margin dollars", "bottom line"]
    sql: ${gross_margin} ;;
    value_format_name: usd
  }

  measure: total_units_sold {
    type: sum
    label: "Total Units Sold"
    description: "The total quantity of items sold."
    synonyms: ["total quantity", "volume sold", "pieces sold"]
    sql: ${quantity} ;;
  }

  measure: count_transactions {
    type: count_distinct
    label: "Total Transactions"
    description: "The count of unique orders or receipts."
    synonyms: ["number of orders", "receipt count", "total baskets"]
    sql: ${transaction_id} ;;
  }

  measure: average_order_value {
    type: number
    label: "Average Order Value (AOV)"
    description: "The average net sales amount per unique transaction."
    synonyms: ["AOV", "average basket size", "ATV", "average transaction value"]
    sql: ${total_net_sales} / NULLIF(${count_transactions}, 0) ;;
    value_format_name: usd
  }

  measure: units_per_transaction {
    type: number
    label: "Units Per Transaction (UPT)"
    description: "The average number of items purchased in a single transaction."
    synonyms: ["UPT", "items per basket", "basket depth"]
    sql: ${total_units_sold} / NULLIF(${count_transactions}, 0) ;;
    value_format_name: decimal_2
  }

  measure: return_rate {
    type: number
    label: "Return Rate %"
    description: "The percentage of items returned out of total items sold."
    synonyms: ["refund rate", "return percentage"]
    sql: SUM(CASE WHEN ${is_return} THEN ${quantity} ELSE 0 END) / NULLIF(${total_units_sold}, 0) ;;
    value_format_name: percent_2
  }
}
