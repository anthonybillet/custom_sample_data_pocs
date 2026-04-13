connection: "argolis"

include: "/CCM_custom/*.view.lkml"
include: "/CCM_custom/*.dashboard"

datagroup: midnight_et_refresh {
  label: "Midnight Eastern Time Refresh"
  description: "Triggers a rebuild of PDTs and clears cache every night at 12:00 AM Eastern Time."
  # BigQuery SQL that evaluates to the current Date in NY/Eastern Time.
  # This value only changes once a day at exactly midnight ET.
  sql_trigger: SELECT EXTRACT(DATE FROM CURRENT_TIMESTAMP() AT TIME ZONE 'America/New_York') ;;
  # A fallback cache expiration just in case the trigger query fails
  max_cache_age: "24 hours"
}

# One explore accross all cloud billing data
explore: unified_focus_cost {
  label: "Cloud Cost Usage Reporting"
  view_label: " Unified Fields"
  description: "Unified billing data across GCP, AWS, and OCI mapped to FinOps FOCUS standards."
  always_filter: {
    filters: [unified_focus_cost.provider_name: "", unified_focus_cost.charge_period_start_date: ""]

  }

  # Joining AWS Raw Data
  join: aws_billing_export {
    view_label: "AWS Specific Fields"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unified_focus_cost.provider_name} = 'AWS'
        AND ${unified_focus_cost.sub_account_id} = ${aws_billing_export.line_item_usage_account_id}
        AND ${unified_focus_cost.charge_period_start_raw} = ${aws_billing_export.line_item_usage_start_raw} ;;
  }

  # Joining GCP Raw Data
  join: gcp_billing_export {
    view_label: "GCP Specific Fields"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unified_focus_cost.provider_name} = 'GCP'
        AND ${unified_focus_cost.sub_account_id} = ${gcp_billing_export.project__id}
        AND ${unified_focus_cost.charge_period_start_raw} = ${gcp_billing_export.usage_start_raw} ;;
  }

  # Joining OCI Raw Data
  join: oci_billing_export {
    view_label: "OCI Specific Fields"
    type: left_outer
    relationship: one_to_one
    sql_on: ${unified_focus_cost.provider_name} = 'OCI'
        AND ${unified_focus_cost.sub_account_id} = ${oci_billing_export.sub_account_id}
        AND ${unified_focus_cost.charge_period_start_raw} = ${oci_billing_export.charge_period_start_raw} ;;
  }
}
