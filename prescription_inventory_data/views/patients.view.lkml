view: patients {
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.patients` ;;
  drill_fields: [patient_id]

  dimension: patient_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.patient_id ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: medication_compliance_rate {
    type: number
    sql: ${TABLE}.medication_compliance_rate ;;
  }
  dimension_group: patient_dob {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.patient_dob ;;
  }
  dimension: patient_first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.patient_first_name ;;
  }
  dimension: patient_last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.patient_last_name ;;
  }

  dimension: patient_name {
    type: string
    sql: CONCAT(${patient_first_name}, ' ', ${patient_last_name} ;;
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
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }
  measure: count {
    label: "# of Patients"
    type: count
  }

}
