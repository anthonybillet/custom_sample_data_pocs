view: users {
  sql_table_name: `ant-billet-looker-core-argolis.retail_s.users` ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }
  measure: count {
    type: count
    drill_fields: [user_id, last_name, first_name, orders.count]
  }

# --- NEW: User Demographics & Cohorts ---
  dimension: full_name {
    type: string
    description: "User's combined first and last name"
    sql: CONCAT(${TABLE}.first_name, ' ', ${TABLE}.last_name) ;;
  }

  dimension: days_since_signup {
    type: number
    description: "Number of days since the user created their account"
    sql: DATE_DIFF(CURRENT_TIMESTAMP(), ${TABLE}.created_at, DAY) ;;
  }

  dimension: is_new_customer {
    type: yesno
    description: "User account created in the last 30 days"
    sql: ${days_since_signup} <= 30 ;;
  }

  dimension: user_tenure_tier {
    type: tier
    description: "Grouped by days since signup"
    tiers: [30, 90, 180, 365, 730]
    style: integer
    sql: ${days_since_signup} ;;
  }

}
