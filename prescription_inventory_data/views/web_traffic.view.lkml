view: web_traffic {
  label: "Web Events"
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.web_traffic` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.web_traffic_v2` ;;

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }
  dimension_group: event {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_at ;;
  }
  dimension: event_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.event_id ;;
  }
  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }
  dimension: page_source {
    type: string
    sql: ${TABLE}.page_source ;;
  }
  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }
  dimension: patient_id {
    type: string
    hidden: yes
    sql: CAST( CASE WHEN ${TABLE}.patient_id = 'NULL' THEN NULL ELSE ${TABLE}.patient_id END AS INT64) ;;
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

  drill_fields: [event_id]
  measure: count {
    label: "# of Events"
    type: count
  }
}
