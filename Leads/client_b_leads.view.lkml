view: client_b_leads {
  sql_table_name: `ant-billet-looker-core-argolis.sample_data.client_b_leads` ;;

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: lead_id {
    type: number
    sql: ${TABLE}.lead_id ;;
  }
  dimension: lead_score {
    type: number
    sql: ${TABLE}.lead_score ;;
  }
  measure: count {
    type: count
  }
}
