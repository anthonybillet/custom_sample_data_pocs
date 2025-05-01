connection: "argolis"

include: "/prescription_inventory_data/views/*.view.lkml"

explore: patients {
  join: prescribers {
    type: left_outer
    sql_on: ${prescribers.prescriber_id} = ${prescriptions.prescriber_id} ;;
    relationship: many_to_one
  }
  join: fill_requests {
    type: left_outer
    sql_on: ${fill_requests.prescription_id} = ${prescriptions.prescription_id} ;;
    relationship: one_to_many
  }
  join: shipments {
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
}
