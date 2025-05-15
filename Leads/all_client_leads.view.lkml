view: all_client_leads {
  sql_table_name: `ant-billet-looker-core-argolis.sample_data.all_client_leads` ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }
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
    label: "# of Leads"
    type: count
  }

  measure: average_lead_score {
    type: average
    sql: ${lead_score} ;;
  }



}
