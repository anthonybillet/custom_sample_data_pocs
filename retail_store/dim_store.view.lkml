view: dim_store {
  sql_table_name: `ant-billet-looker-core-argolis.retail_store.dim_store` ;;

  dimension_group: _etl_loaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._etl_loaded_at ;;
    hidden: yes
  }

  dimension: store_id {
    primary_key: yes
    type: string
    label: "Store ID"
    description: "The unique identifier for the retail location."
    synonyms: ["location id", "shop number", "store code"]
    sql: ${TABLE}.store_id ;;
  }

  dimension: store_name {
    type: string
    label: "Store Name"
    description: "The user-friendly name of the retail store."
    synonyms: ["location name", "shop name"]
    sql: ${TABLE}.store_name ;;
  }

  dimension: store_type {
    type: string
    label: "Store Type"
    description: "The operational format of the store (e.g., Outlet, Retail, Flagship)."
    synonyms: ["store format", "location type", "shop format"]
    sql: ${TABLE}.store_type ;;
  }

  dimension: is_flagship {
    type: yesno
    label: "Is Flagship"
    description: "Flags whether this location is a premier flagship store."
    synonyms: ["flagship location", "main store"]
    sql: LOWER(${store_type}) = 'flagship' ;;
  }

  dimension: total_square_footage {
    type: number
    label: "Total Square Footage"
    description: "The physical size of the retail location in square feet."
    synonyms: ["store size", "sq ft", "footprint", "area"]
    sql: ${TABLE}.total_square_footage ;;
  }

  dimension: store_size_tier {
    type: string
    label: "Store Size Tier"
    description: "Categorization of stores into Large, Standard, or Boutique based on square footage."
    synonyms: ["size format", "store footprint category"]
    sql: CASE
          WHEN ${total_square_footage} >= 50000 THEN 'Large/Flagship'
          WHEN ${total_square_footage} >= 15000 THEN 'Standard'
          ELSE 'Boutique/Small'
        END ;;
  }

  dimension_group: open {
    type: time
    label: "Store Open"
    description: "The date the store officially opened for business."
    synonyms: ["grand opening date", "launch date"]
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.open_date ;;
  }

  dimension: city {
    type: string
    label: "City"
    description: "The city where the store is located."
    synonyms: ["municipality", "town"]
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    type: string
    label: "State/Province"
    description: "The state or province where the store is located."
    synonyms: ["province", "territory"]
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: region {
    type: string
    label: "Region"
    description: "The broader geographic retail region."
    synonyms: ["territory", "district", "zone"]
    sql: ${TABLE}.region ;;
  }

  dimension: country {
    type: string
    label: "Country"
    description: "The country where the store is located."
    synonyms: ["nation"]
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: source_system {
    type: string
    hidden: yes
    sql: ${TABLE}.source_system ;;
  }

  # --- Measures ---

  measure: count_stores {
    type: count
    label: "Total Store Count"
    description: "The total number of store locations."
    synonyms: ["number of stores", "location count"]
    drill_fields: [store_id, store_name, city, state, store_type]
  }

  measure: average_store_size {
    type: average
    label: "Average Store Size (Sq Ft)"
    description: "The average square footage across all selected stores."
    synonyms: ["average footprint", "mean store size"]
    sql: ${total_square_footage} ;;
    value_format_name: decimal_0
  }
}
