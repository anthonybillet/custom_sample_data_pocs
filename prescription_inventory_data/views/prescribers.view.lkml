view: prescribers {
  view_label: "Prescribers (Doctors)"
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.prescribers` ;;
  drill_fields: [prescriber_id]

  dimension: prescriber_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.prescriber_id ;;
  }
  dimension: prescriber_dea {
    type: string
    sql: ${TABLE}.prescriber_dea ;;
  }
  dimension: prescriber_email {
    type: string
    sql: ${TABLE}.prescriber_email ;;
  }
  dimension: prescriber_first_name {
    type: string
    sql: ${TABLE}.prescriber_first_name ;;
  }
  dimension: prescriber_last_name {
    type: string
    sql: ${TABLE}.prescriber_last_name ;;
  }
  dimension: prescriber_npi {
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
    label: "# of Prescribers (Doctors)"
    type: count
  }
}
