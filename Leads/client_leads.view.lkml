view: client_leads {
  sql_table_name: `ant-billet-looker-core-argolis.sample_data.{{ _user_attributes['client_lead_table'] }}_leads` ;;

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
    value_format_name: decimal_3
  }
}
