view: cases {
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.cases` ;;

  dimension: case_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.case_id ;;
  }
  dimension: case_details {
    type: string
    sql: ${TABLE}.case_details ;;
  }
  dimension: case_outcome {
    type: string
    sql: ${TABLE}.case_outcome ;;
  }
  dimension: case_outcome_reason {
    type: string
    sql: ${TABLE}.case_outcome_reason ;;
  }
  dimension: case_status {
    type: string
    sql: ${TABLE}.case_status ;;
  }
  dimension: case_type {
    type: string
    sql: ${TABLE}.case_type ;;
  }
  dimension: patient_id {
    hidden: yes
    type: number
    # hidden: yes
    sql: ${TABLE}.patient_id ;;
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
  dimension: resolution_method {
    type: string
    sql: ${TABLE}.resolution_method ;;
  }

  drill_fields: [case_id]

  measure: count {
    label: "# of Cases"
    type: count
  }
}
