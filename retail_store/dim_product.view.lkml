view: dim_product {
  sql_table_name: `ant-billet-looker-core-argolis.retail_store.dim_product` ;;

  dimension_group: _etl_loaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._etl_loaded_at ;;
    hidden: yes
  }

  dimension: product_id {
    primary_key: yes
    type: string
    label: "Product ID"
    description: "The unique identifier for the product."
    synonyms: ["item id", "product code", "SKU ID"]
    sql: ${TABLE}.product_id ;;
  }

  dimension: brand {
    type: string
    label: "Brand"
    description: "The brand name of the apparel or product."
    synonyms: ["label", "make", "designer"]
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    label: "Category"
    description: "The high-level category of the product (e.g., Tops, Bottoms, Outerwear)."
    synonyms: ["product family", "clothing type", "apparel category"]
    sql: ${TABLE}.category ;;
  }

  dimension: subcategory {
    type: string
    label: "Subcategory"
    description: "The specific subcategory of the product (e.g., T-Shirts, Jeans, Sweaters)."
    synonyms: ["item type", "clothing sub-type", "specific category"]
    sql: ${TABLE}.subcategory ;;
  }

  dimension: department {
    type: string
    label: "Department"
    description: "The target demographic or department (e.g., Mens, Womens, Kids, Baby)."
    synonyms: ["gender", "audience", "division"]
    sql: ${TABLE}.department ;;
  }

  dimension: color {
    type: string
    label: "Color"
    description: "The primary color of the product."
    synonyms: ["shade", "hue", "colorway"]
    sql: ${TABLE}.color ;;
  }

  dimension: size {
    type: string
    label: "Size"
    description: "The size of the garment or product."
    synonyms: ["fit", "measure", "clothing size"]
    sql: ${TABLE}.size ;;
  }

  dimension: size_group {
    type: string
    label: "Size Group"
    description: "Categorization of sizes into standard groupings."
    synonyms: ["size tier", "fit category"]
    sql: CASE
          WHEN ${size} IN ('XXS', 'XS', 'S') THEN 'Small'
          WHEN ${size} IN ('M', 'L') THEN 'Medium'
          WHEN ${size} IN ('XL', 'XXL', 'XXXL') THEN 'Large/Plus'
          ELSE 'Other'
        END ;;
  }

  dimension: sku {
    type: string
    label: "SKU"
    description: "Stock Keeping Unit; the granular identifier for a specific style, color, and size."
    synonyms: ["barcode", "stock keeping unit", "UPC"]
    sql: ${TABLE}.sku ;;
  }

  dimension: product_name {
    type: string
    label: "Product Name"
    description: "The full display name of the product."
    synonyms: ["item name", "style name", "garment name"]
    sql: ${TABLE}.product_name ;;
  }

  dimension: current_retail_price {
    type: number
    label: "Current Retail Price"
    description: "The current selling price of the product to the consumer."
    synonyms: ["MSRP", "price", "sticker price", "selling price"]
    sql: ${TABLE}.current_retail_price ;;
    value_format_name: usd
  }

  dimension: unit_cost {
    type: number
    label: "Unit Cost"
    description: "The manufacturing or wholesale cost of a single unit."
    synonyms: ["COGS", "cost of goods", "wholesale price", "landed cost"]
    sql: ${TABLE}.unit_cost ;;
    value_format_name: usd
  }

  dimension: markup_percentage {
    type: number
    label: "Markup Percentage"
    description: "The percentage markup from unit cost to retail price."
    synonyms: ["profit margin", "markup", "margin percent"]
    sql: (${current_retail_price} - ${unit_cost}) / NULLIF(${unit_cost}, 0) ;;
    value_format_name: percent_2
  }

  dimension: is_active {
    type: yesno
    label: "Is Active"
    description: "Indicates whether the product is currently active in the catalog."
    synonyms: ["active status", "is selling", "currently available"]
    sql: ${TABLE}.is_active ;;
  }

  dimension: source_system {
    type: string
    label: "Source System"
    description: "The upstream system where this product data originated."
    hidden: yes
    sql: ${TABLE}.source_system ;;
  }

  measure: count {
    type: count
    label: "Product Count"
    description: "The total number of unique products."
    synonyms: ["number of products", "total items", "style count"]
    drill_fields: [product_id, product_name, brand, category]
  }
}
