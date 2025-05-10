access_grant: can_see_patient_pii {
  user_attribute: can_see_sensitive_data
  allowed_values: ["Yes"]
}

view: patients {
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.patients` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.patients_v2` ;;

  dimension: patient_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.patient_id ;;

    link: {
      label: "Patient Lookup"
      url: "/dashboards/4GvbCKwuuG2i31wgQRq0Jb?Patient+ID={{value}}"
      icon_url: "https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.gifthealth.com/"
    }
  }

  dimension: patient_id_string {
    order_by_field: patient_id
    type: string
    sql: CAST(${patient_id} AS string) ;;

    link: {
      label: "Patient Lookup"
      url: "/dashboards/4GvbCKwuuG2i31wgQRq0Jb?Patient+ID={{value}}"
      icon_url: "https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.gifthealth.com/"
    }
  }
  dimension: address {
    required_access_grants: [can_see_patient_pii]
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: gender {
    required_access_grants: [can_see_patient_pii]
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: medication_compliance_rate {
    value_format_name: percent_0
    type: number
    sql: ${TABLE}.medication_compliance_rate ;;
  }
  dimension_group: patient_dob {
    label: "Patient DOB"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.patient_dob ;;
  }
  dimension: patient_first_name {
    required_access_grants: [can_see_patient_pii]
    hidden: yes
    type: string
    sql: ${TABLE}.patient_first_name ;;
  }
  dimension: patient_last_name {
    required_access_grants: [can_see_patient_pii]
    hidden: yes
    type: string
    sql: ${TABLE}.patient_last_name ;;
  }

  dimension: patient_name {
    required_access_grants: [can_see_patient_pii]
    type: string
    sql: CONCAT(${patient_first_name}, ' ', ${patient_last_name}) ;;
    link: {
      label: "Patient Lookup"
      url: "/dashboards/4GvbCKwuuG2i31wgQRq0Jb?Patient+ID={{patient_id._value}}"
      icon_url: "https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.gifthealth.com/"
    }
  }
  dimension_group: record_created {
    label: "Patient Joined"
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
  dimension: state {
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zipcode {
    required_access_grants: [can_see_patient_pii]
    type: zipcode
    sql: CAST(${TABLE}.zipcode as string) ;;
  }


  measure: count {
    label: "# of Patients"
    type: count
  }
  measure: average_medication_compliance_rate {
    type: average
    value_format_name: percent_0
    sql: ${medication_compliance_rate} ;;
  }

  drill_fields: [patient_details*,prescriptions.count,fill_requests.count,orders.count, cases.count]

  set: patient_details {
    fields: [patient_id,patient_name, record_created_date, gender, patient_dob_date, address,city,state,zipcode]
  }

}
