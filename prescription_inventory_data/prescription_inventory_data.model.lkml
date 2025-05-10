connection: "argolis"

include: "/prescription_inventory_data/views/*.view.lkml"

explore: patients {
  label: "Prescription Pipeline"
  join: prescribers {
    type: left_outer
    sql_on: ${prescribers.prescriber_id} = ${prescriptions.prescriber_id} ;;
    relationship: many_to_one
  }
  join: fill_requests {
    view_label: "Fill Requests and Shipments"
    type: left_outer
    sql_on: ${fill_requests.prescription_id} = ${prescriptions.prescription_id} ;;
    relationship: one_to_many
  }
  join: shipments {
    view_label: "Fill Requests and Shipments"
    type: left_outer
    sql_on: ${fill_requests.fill_request_id} = ${shipments.fill_request_id} ;;
    relationship: one_to_many
  }
  join: orders {
    type: left_outer
    sql_on: ${orders.fill_request_id} = ${fill_requests.fill_request_id} ;;
    relationship: one_to_one
  }
  join: prescriptions {
    type: left_outer
    sql_on: ${patients.patient_id} = ${prescriptions.patient_id} ;;
    relationship: many_to_one
  }
  join: cases {
    type: left_outer
    sql_on: ${cases.patient_id} = ${patients.patient_id} ;;
    relationship: one_to_many
  }
  join: web_traffic {
    type: left_outer
    sql_on: ${web_traffic.patient_id} = ${patients.patient_id} ;;
    relationship: one_to_many
  }


  query: scripts_and_patients_per_doctor {
    label: "Which Doctors have the most Patients and Scripts?"
    description: "Click here!"
    dimensions: [prescribers.prescriber_id, prescribers.prescriber_name]
    measures: [count, prescriptions.count]
    filters: [prescribers.prescriber_name: "-NULL"]
    timezone: "America/New_York"
  }

  query: fill_request_funnel {
    description: "See the progression of Fill Requests"
    measures: [fill_requests.count_fill_request_created, fill_requests.count_fill_request_created_and_completed, fill_requests.count_fill_request_created_and_completed_and_shipped, fill_requests.count_fill_request_created_and_completed_and_shipped_and_delivered]
    timezone: "America/New_York"
  }

  query: monthly_shipments_by_carrier {
    label: "How many Shipments do we have per month per Carrier?"
    description: "Click Here!"

    dimensions: [shipments.shipment_month]
    pivots: [shipments.shipment_carrier]
    measures: [shipments.count]
    timezone: "America/New_York"
  }

  query: weekly_support_cases {
    description: "See the trend of cases by creation week"
    dimensions: [cases.record_created_week]
    measures: [cases.count]
    timezone: "America/New_York"
  }


}
