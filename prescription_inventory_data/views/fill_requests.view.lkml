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
  measure: completed_fill_requests {
    label: "# of Completed Fill Requests"
    type: count
    filters: [
      fill_request_status: "Filled"
    ]
  }
  measure: fill_request_completion_rate {
    type: number
    value_format_name: percent_1
    sql: 1.0*${completed_fill_requests}/NULLIF(${count},0) ;;
  }

  #### Funnel Analysis ####

  measure: count_fill_request_created {
    label: "Step 1: Fill Request Created"
    group_label: "Fill Request Funnel"
    type: count
    filters: [fill_request_time: "-NULL"]
    drill_fields: [fill_request_funnel_details*]
  }

  measure: count_fill_request_created_and_completed {
    label: "Step 2: Fill Request Completed"
    group_label: "Fill Request Funnel"
    type: count
    filters: [fill_request_time: "-NULL", fill_completed_time: "-NULL"]
    drill_fields: [fill_request_funnel_details*]
  }

  measure: count_fill_request_created_and_completed_and_shipped {
    label: "Step 3: Fill Request Shipped"
    group_label: "Fill Request Funnel"
    type: count
    filters: [fill_request_time: "-NULL", fill_completed_time: "-NULL", shipments.shipment_time: "-NULL"]
    drill_fields: [fill_request_funnel_details*]
  }

  measure: count_fill_request_created_and_completed_and_shipped_and_delivered {
    label: "Step 4: Fill Request Delivered"
    group_label: "Fill Request Funnel"
    type: count
    filters: [fill_request_time: "-NULL", fill_completed_time: "-NULL", shipments.shipment_time: "-NULL", shipments.delivered_date: "-NULL"]
    drill_fields: [fill_request_funnel_details*]
  }


  set: fill_request_funnel_details {
    fields: [fill_request_id,fill_request_status,prescriptions.prescribed_drug_name, prescribers.prescriber_namepatients.patient_name,fill_request_time,fill_completed_time, shipments.shipment_time,shipments.delivered_date]
  }





}
