view: shipments {
  # sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.shipments` ;;
  sql_table_name: `ant-billet-looker-core-argolis.sample_prescription_inventory_data.shipments_v2` ;;

  dimension: shipment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.shipment_id ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: fill_request_id {
    hidden: yes
    type: number
    sql: ${TABLE}.fill_request_id ;;
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
  dimension: ship_to_state {
    type: string
    sql: ${TABLE}.ship_to_state ;;
  }
  dimension_group: shipment {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipment_at ;;
  }
  dimension: shipment_carrier {
    type: string
    sql: ${TABLE}.shipment_carrier ;;
  }
  dimension: shipment_method {
    type: string
    sql: ${TABLE}.shipment_method ;;
  }
  dimension: status {
    label: "Shipment Status"
    type: string
    sql: CASE WHEN ${TABLE}.status IS NULL THEN 'Not Shipped' ELSE ${TABLE}.status END ;;
  }
  dimension: zip_code_3 {
    label: "Zipcode"
    type: number
    sql: ${TABLE}.zip_code_3 ;;
  }
  measure: count {
    label: "# of Shipments"
    type: count
  }

  drill_fields: [shipment_details*]

  set: shipment_details {
    fields: [shipment_id,shipment_method,shipment_time,delivered_time]
  }
}
