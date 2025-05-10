view: cases {
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.cases` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.cases_v2` ;;

  dimension: case_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.case_id ;;
    link: {
      label: "Lookup in Support Portal: Case: {{value}}"
      url: "https://www.google.com/search?q=case{{value}}"
      icon_url: "https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.gifthealth.com/"
    }
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
    label: "Case Created"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.record_created_at ;;
  }
  dimension_group: record_updated {
    hidden: yes
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.record_updated_at ;;
  }
  dimension: resolution_method {
    type: string
    sql: ${TABLE}.resolution_method ;;
  }

  drill_fields: [case_details*]

  set: case_details {
    fields: [case_id,patient_id,patients.patient_name, record_created_time, case_status, case_type,case_outcome,case_details]
  }

  measure: count {
    label: "# of Cases"
    type: count
  }
}
