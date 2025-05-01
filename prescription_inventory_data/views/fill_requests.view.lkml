view: fill_requests {
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.fill_requests` ;;
  drill_fields: [fill_request_id]

  dimension: fill_request_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.fill_request_id ;;
  }
  dimension: dispensed_quantity {
    type: number
    sql: ${TABLE}.dispensed_quantity ;;
  }
  dimension_group: fill_completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fill_completed_at ;;
  }
  dimension: fill_number {
    type: number
    sql: ${TABLE}.fill_number ;;
  }
  dimension_group: fill_request {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fill_request_at ;;
  }
  dimension: fill_request_status {
    type: string
    sql: ${TABLE}.fill_request_status ;;
  }
  dimension: prescription_id {
    type: number
    hidden: yes
    sql: ${TABLE}.prescription_id ;;
  }
  dimension_group: record_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.record_created_at ;;
  }
  dimension_group: record_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.record_updated_at ;;
  }
  measure: count {
    label: "# of Fill Requests"
    type: count
  }
}
