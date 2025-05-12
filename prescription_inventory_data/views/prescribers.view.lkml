view: prescribers {
  view_label: "Prescribers (Doctors)"
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.prescribers` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.prescribers_v2` ;;

  dimension: prescriber_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.prescriber_id ;;
  }
  dimension: prescriber_dea {
    label: "Prescriber DEA #"
    type: string
    sql: ${TABLE}.prescriber_dea ;;
  }
  dimension: prescriber_email {
    type: string
    sql: ${TABLE}.prescriber_email ;;
  }
  dimension: prescriber_first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.prescriber_first_name ;;
  }
  dimension: prescriber_last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.prescriber_last_name ;;
  }
  dimension: prescriber_name {
    type: string
    sql: CONCAT(${prescriber_first_name}, ' ', ${prescriber_last_name}) ;;
  }
  dimension: prescriber_npi {
    description: "this is the NPI number of the Doctor"
    tags: ["doctor","provider"]
    label: "Prescriber NPI"
    type: number
    sql: ${TABLE}.prescriber_npi ;;
  }
  dimension: prescriber_phone {
    type: string
    sql: ${TABLE}.prescriber_phone ;;
  }
  dimension: prescriber_state {
    type: string
    sql: ${TABLE}.prescriber_state ;;
  }
  dimension: prescriber_zipcode {
    type: number
    sql: ${TABLE}.prescriber_zipcode ;;
  }
  dimension_group: record_created {
    label: "Prescriber Joined"
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
  measure: count {
    label: "# of Prescribers (Doctors)"
    type: count
  }
  measure: prescribers_running_total {
    label: "Prescribers Running Total"
    type: running_total
    sql: ${count} ;;
  }

  drill_fields: [presciber_details*, patients.count, prescriptions.count]

  set: presciber_details {
    fields: [prescriber_id, prescriber_name, prescriber_npi,prescriber_dea, record_created_date, prescriber_phone, prescriber_state,prescriber_zipcode]
  }
}
