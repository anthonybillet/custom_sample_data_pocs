view: prescriptions {
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.prescriptions` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.prescriptions_v2` ;;
  drill_fields: [prescription_id]

  dimension: prescription_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.prescription_id ;;
  }
  dimension: icd_diagnosis_codes {
    type: string
    sql: ${TABLE}.icd_diagnosis_codes ;;
  }
  dimension: number_refills {
    type: number
    sql: ${TABLE}.number_refills ;;
  }
  dimension_group: original {
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
    type: string
    sql: ${TABLE}.prescribed_drug_ndc ;;
  }
  dimension: prescriber_id {
    type: number
    hidden: yes
    sql: ${TABLE}.prescriber_id ;;
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
  dimension: rx_source {
    type: string
    sql: ${TABLE}.rx_source ;;
  }
  dimension_group: written {
    type: time
    # timeframes: [raw, date, week, month, quarter, year]
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

}
