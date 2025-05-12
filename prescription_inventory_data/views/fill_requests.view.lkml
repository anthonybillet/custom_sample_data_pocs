view: fill_requests {
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.fill_requests` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.fill_requests_v2` ;;

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

  measure: incomplete_fill_requests {
    label: "# of Incomplete Fill Requests"
    type: count
    filters: [
      fill_request_status: "-Filled"
    ]
  }

  measure: fill_request_completion_rate {
    type: number
    value_format_name: percent_1
    sql: 1.0*${completed_fill_requests}/NULLIF(${count},0) ;;
  }


  ### durations ###

  dimension: fill_request_to_completed_duration_min {
    group_label: "Fill Request Durations"
    label: "Step 1: Requested -> Filled Duration (Minutes)"
    hidden: yes
    type: duration_minute
    sql_start: ${fill_request_raw} ;;
    sql_end: ${fill_completed_raw} ;;
  }

  dimension: fill_request_to_completed_duration_hr {
    group_label: "Fill Request Durations"
    hidden: yes
    label: "Step 1: Requested -> Filled Duration (Hours)"
    type: number
    value_format_name: decimal_1
    sql: 1.0* ${fill_request_to_completed_duration_min}/60 ;;
  }

  measure: average_fill_request_to_completed_duration_hr {
    group_label: "Fill Request Durations"
    label: "Step 1: Requested -> Filled Duration (Hours)"
    description: "Average duration in hours from the moment a fill request is created by the client until it is completed by us"
    type: average
    value_format_name: decimal_1
    sql:  ${fill_request_to_completed_duration_hr};;
  }

  dimension: fill_request_completed_shipment_created_duration_min {
    group_label: "Fill Request Durations"
    label: "Step 2: Filled -> Shipped Duration (Minutes)"
    hidden: yes
    type: duration_minute
    sql_start: ${fill_completed_raw} ;;
    sql_end: ${shipments.shipment_raw} ;;
  }

  dimension: fill_request_completed_shipment_created_duration_hr {
    group_label: "Fill Request Durations"
    label: "Step 2: Filled -> Shipped Duration (Hours)"
    hidden: yes
    type: number
    value_format_name: decimal_1
    sql: 1.0* ${fill_request_completed_shipment_created_duration_min}/60 ;;
  }

  measure: average_fill_request_completed_shipment_created_duration_hr {
    group_label: "Fill Request Durations"
    label: "Step 2: Filled -> Shipped Duration (Hours)"
    description: "Average duration in hours from the moment a fill request is completed until it is shipped"
    type: average
    value_format_name: decimal_1
    sql:  ${fill_request_completed_shipment_created_duration_hr};;
  }

  dimension: shipped_delivered_min {
    group_label: "Fill Request Durations"
    label: "Step 3: Shipped -> Delivered Duration (Minutes)"
    hidden: yes
    type: duration_minute
    sql_start: ${shipments.shipment_raw} ;;
    sql_end: ${shipments.delivered_raw} ;;
  }

  dimension: shipped_delivered_hr {
    group_label: "Fill Request Durations"
    label: "Step 3: Shipped -> Delivered Duration (Hours)"
    hidden: yes
    type: number
    value_format_name: decimal_1
    sql: 1.0* ${shipped_delivered_min}/60 ;;
  }

  measure: average_shipped_delivered_hr {
    group_label: "Fill Request Durations"
    label: "Step 3: Shipped -> Delivered Duration (Hours)"
    description: "Average duration in hours from the moment a fill request is shipped until it is delivered to the client"
    type: average
    value_format_name: decimal_1
    sql:  ${shipped_delivered_hr};;
  }

  dimension: request_delivered_min {
    group_label: "Fill Request Durations"
    label: " Full Journey: Requested -> Delivered Duration (Minutes)"
    hidden: yes
    type: duration_minute
    sql_start: ${fill_request_raw} ;;
    sql_end: ${shipments.delivered_raw} ;;
  }

  dimension: request_delivered_hr {
    group_label: "Fill Request Durations"
    label: " Full Journey: Requested -> Delivered Duration (Hours)"
    hidden: yes
    type: number
    value_format_name: decimal_1
    sql: 1.0* ${request_delivered_min}/60 ;;
  }

  measure: average_request_delivered_hr {
    group_label: "Fill Request Durations"
    label: " Full Journey: Requested -> Delivered Duration (Hours)"
    description: "Average duration in hours from the moment a fill request is created by the client until it is delivered to the client"
    type: average
    value_format_name: decimal_1
    sql:  ${request_delivered_hr};;
  }


  #### Funnel Analysis ####

  measure: count_fill_request_created {
    label: "Step 1: Fill Request Created"
    group_label: "Fill Request Funnel"
    type: count
    filters: [fill_request_time: "-NULL"]
  }

  measure: count_fill_request_created_and_completed {
    label: "Step 2: Fill Request Completed"
    group_label: "Fill Request Funnel"
    type: count
    filters: [fill_request_time: "-NULL", fill_completed_time: "-NULL"]
  }

  measure: count_fill_request_created_and_completed_and_shipped {
    label: "Step 3: Fill Request Shipped"
    group_label: "Fill Request Funnel"
    type: count
    filters: [fill_request_time: "-NULL", fill_completed_time: "-NULL", shipments.shipment_time: "-NULL"]
  }

  measure: count_fill_request_created_and_completed_and_shipped_and_delivered {
    label: "Step 4: Fill Request Delivered"
    group_label: "Fill Request Funnel"
    type: count
    filters: [fill_request_time: "-NULL", fill_completed_time: "-NULL", shipments.shipment_time: "-NULL", shipments.delivered_date: "-NULL"]
  }

  drill_fields: [fill_request_details*]

  set: fill_request_details {
    fields: [fill_request_id,fill_request_status,prescriptions.prescribed_drug_name,dispensed_quantity, prescribers.prescriber_namepatients.patient_name,fill_request_time,fill_completed_time,shipments.shipment_time,shipments.delivered_date, orders.count]
  }




}
