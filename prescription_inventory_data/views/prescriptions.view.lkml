view: prescriptions {
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.prescriptions` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.prescriptions_v2` ;;

  dimension: prescription_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.prescription_id ;;
  }
  dimension: icd_diagnosis_codes {
    label: "ICD Diagnosis Codes"
    type: string
    sql: ${TABLE}.icd_diagnosis_codes ;;
  }
  dimension: number_refills {
    type: number
    sql: ${TABLE}.number_refills ;;
  }
  dimension_group: original {
    hidden: yes
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.original_date ;;
  }
  dimension: patient_id {
    type: number
    hidden: yes
    sql: ${TABLE}.patient_id ;;
  }
  dimension: prescribed_drug_name {
    type: string
    sql: ${TABLE}.prescribed_drug_name ;;
    link: {
      label: "Drug Lookup: {{value}}"
      url: "https://www.drugs.com/search.php?searchterm={{value | url_encode}}"
      icon_url: "https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.gifthealth.com/"

    }
  }
  dimension: prescribed_drug_ndc {
    label: "Prescribed Drug NDC"
    type: string
    sql: ${TABLE}.prescribed_drug_ndc ;;
  }
  dimension: prescriber_id {
    type: number
    hidden: yes
    sql: ${TABLE}.prescriber_id ;;
  }
  dimension_group: record_created {
    hidden: yes
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
  dimension: rx_source {
    type: string
    sql: ${TABLE}.rx_source ;;
  }
  dimension_group: written_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.written_at ;;
  }

  # dimension_group: current_date {
  #   hidden: yes
  #   type: time
  #   sql: CURRENT_DATE ;;
  # }

  # dimension: written_is_month_to_date {
  #   type: yesno
  #   sql: ;;
  # }
  measure: count {
    label: "# of Prescriptions"
    type: count
  }

  drill_fields: [prescription_details*,fill_requests.count]

  set: prescription_details {
    fields: [prescription_id,prescribed_drug_name, prescribed_drug_ndc,icd_diagnosis_codes,written_at_date,rx_source]
  }

}
