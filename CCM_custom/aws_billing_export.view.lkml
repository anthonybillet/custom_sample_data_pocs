# The name of this view in Looker is "Aws Billing Export"
view: aws_billing_export {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ant-billet-looker-core-argolis.CCM.aws_billing_export` ;;

  dimension: bill_bill_type {
    type: string
    sql: ${TABLE}.bill_bill_type ;;
  }

  dimension: bill_billing_entity {
    type: string
    sql: ${TABLE}.bill_billing_entity ;;
  }

  dimension_group: bill_billing_period_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.bill_billing_period_end_date ;;
  }

  dimension_group: bill_billing_period_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.bill_billing_period_start_date ;;
  }

  dimension: bill_invoice_id {
    type: string
    sql: ${TABLE}.bill_invoice_id ;;
  }

  dimension: bill_invoicing_entity {
    type: string
    sql: ${TABLE}.bill_invoicing_entity ;;
  }

  dimension: bill_payer_account_id {
    type: string
    sql: ${TABLE}.bill_payer_account_id ;;
  }

  dimension: cost_category_aws_invoice_invoice_unit_name {
    type: string
    sql: ${TABLE}.cost_category_aws_invoice_invoice_unit_name ;;
  }

  dimension: cost_category_cost_center {
    type: string
    sql: ${TABLE}.cost_category_cost_center ;;
  }

  dimension: discount_bundled_discount {
    type: number
    sql: ${TABLE}.discount_bundled_discount ;;
  }

  dimension: discount_edp_discount {
    type: number
    sql: ${TABLE}.discount_edp_discount ;;
  }

  dimension: discount_private_rate_discount {
    type: number
    sql: ${TABLE}.discount_private_rate_discount ;;
  }

  dimension: discount_total_discount {
    type: number
    sql: ${TABLE}.discount_total_discount ;;
  }

  dimension: identity_line_item_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.identity_line_item_id ;;
  }

  dimension: identity_time_interval {
    type: string
    sql: ${TABLE}.identity_time_interval ;;
  }

  dimension: line_item_availability_zone {
    type: string
    sql: ${TABLE}.line_item_availability_zone ;;
  }

  dimension: line_item_blended_cost {
    type: number
    sql: ${TABLE}.line_item_blended_cost ;;
    hidden: yes
  }

  dimension: line_item_blended_rate {
    type: string
    sql: ${TABLE}.line_item_blended_rate ;;
    hidden: yes
  }

  dimension: line_item_currency_code {
    type: string
    sql: ${TABLE}.line_item_currency_code ;;
  }

  dimension: line_item_legal_entity {
    type: string
    sql: ${TABLE}.line_item_legal_entity ;;
  }

  dimension: line_item_line_item_description {
    type: string
    sql: ${TABLE}.line_item_line_item_description ;;
  }

  dimension: line_item_line_item_type {
    type: string
    sql: ${TABLE}.line_item_line_item_type ;;
  }

  dimension: line_item_net_unblended_cost {
    type: number
    sql: ${TABLE}.line_item_net_unblended_cost ;;
  }

  dimension: line_item_net_unblended_rate {
    type: string
    sql: ${TABLE}.line_item_net_unblended_rate ;;
  }

  dimension: line_item_normalization_factor {
    type: number
    sql: ${TABLE}.line_item_normalization_factor ;;
  }

  dimension: line_item_normalized_usage_amount {
    type: number
    sql: ${TABLE}.line_item_normalized_usage_amount ;;
  }

  dimension: line_item_operation {
    type: string
    sql: ${TABLE}.line_item_operation ;;
  }

  dimension: line_item_product_code {
    type: string
    sql: ${TABLE}.line_item_product_code ;;
  }

  dimension: line_item_resource_id {
    type: string
    sql: ${TABLE}.line_item_resource_id ;;
  }

  dimension: line_item_tax_type {
    type: string
    sql: ${TABLE}.line_item_tax_type ;;
  }

  dimension: line_item_unblended_cost {
    type: number
    sql: ${TABLE}.line_item_unblended_cost ;;
    hidden: yes
  }

  measure: total_unblended_cost {
    type: sum
    sql: ${line_item_unblended_cost} ;;
    value_format_name: usd
    description: "Total Unblended Cost for AWS"
  }

  dimension: line_item_unblended_rate {
    type: string
    sql: ${TABLE}.line_item_unblended_rate ;;
  }

  dimension: line_item_usage_account_id {
    type: string
    sql: ${TABLE}.line_item_usage_account_id ;;
  }

  dimension: line_item_usage_amount {
    type: number
    sql: ${TABLE}.line_item_usage_amount ;;
  }

  dimension_group: line_item_usage_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.line_item_usage_end_date ;;
  }

  dimension_group: line_item_usage_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.line_item_usage_start_date ;;
  }

  dimension: line_item_usage_type {
    type: string
    sql: ${TABLE}.line_item_usage_type ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: pricing_currency {
    type: string
    sql: ${TABLE}.pricing_currency ;;
  }

  dimension: pricing_lease_contract_length {
    type: string
    sql: ${TABLE}.pricing_lease_contract_length ;;
  }

  dimension: pricing_offering_class {
    type: string
    sql: ${TABLE}.pricing_offering_class ;;
  }

  dimension: pricing_public_on_demand_cost {
    type: number
    sql: ${TABLE}.pricing_public_on_demand_cost ;;
  }

  dimension: pricing_public_on_demand_rate {
    type: string
    sql: ${TABLE}.pricing_public_on_demand_rate ;;
  }

  dimension: pricing_purchase_option {
    type: string
    sql: ${TABLE}.pricing_purchase_option ;;
  }

  dimension: pricing_rate_code {
    type: string
    sql: ${TABLE}.pricing_rate_code ;;
  }

  dimension: pricing_rate_id {
    type: string
    sql: ${TABLE}.pricing_rate_id ;;
  }

  dimension: pricing_term {
    type: string
    sql: ${TABLE}.pricing_term ;;
  }

  dimension: pricing_unit {
    type: string
    sql: ${TABLE}.pricing_unit ;;
  }

  dimension: product_access_type {
    type: string
    sql: ${TABLE}.product_access_type ;;
  }

  dimension: product_account_assistance {
    type: string
    sql: ${TABLE}.product_account_assistance ;;
  }

  dimension: product_action {
    type: string
    sql: ${TABLE}.product_action ;;
  }

  dimension: product_alarm_type {
    type: string
    sql: ${TABLE}.product_alarm_type ;;
  }

  dimension: product_alpha3countrycode {
    type: string
    sql: ${TABLE}.product_alpha3countrycode ;;
  }

  dimension: product_api_calls {
    type: string
    sql: ${TABLE}.product_api_calls ;;
  }

  dimension: product_api_category {
    type: string
    sql: ${TABLE}.product_api_category ;;
  }

  dimension: product_api_type {
    type: string
    sql: ${TABLE}.product_api_type ;;
  }

  dimension: product_apitype {
    type: string
    sql: ${TABLE}.product_apitype ;;
  }

  dimension: product_architectural_review {
    type: string
    sql: ${TABLE}.product_architectural_review ;;
  }

  dimension: product_architecture {
    type: string
    sql: ${TABLE}.product_architecture ;;
  }

  dimension: product_architecture_support {
    type: string
    sql: ${TABLE}.product_architecture_support ;;
  }

  dimension: product_attachment_type {
    type: string
    sql: ${TABLE}.product_attachment_type ;;
  }

  dimension: product_availability {
    type: string
    sql: ${TABLE}.product_availability ;;
  }

  dimension: product_availability_zone {
    type: string
    sql: ${TABLE}.product_availability_zone ;;
  }

  dimension: product_backupservice {
    type: string
    sql: ${TABLE}.product_backupservice ;;
  }

  dimension: product_best_practices {
    type: string
    sql: ${TABLE}.product_best_practices ;;
  }

  dimension: product_broker_engine {
    type: string
    sql: ${TABLE}.product_broker_engine ;;
  }

  dimension: product_bundle {
    type: string
    sql: ${TABLE}.product_bundle ;;
  }

  dimension: product_bundle_description {
    type: string
    sql: ${TABLE}.product_bundle_description ;;
  }

  dimension: product_bundle_group {
    type: string
    sql: ${TABLE}.product_bundle_group ;;
  }

  dimension: product_cache_engine {
    type: string
    sql: ${TABLE}.product_cache_engine ;;
  }

  dimension: product_cache_type {
    type: string
    sql: ${TABLE}.product_cache_type ;;
  }

  dimension: product_calling_type {
    type: string
    sql: ${TABLE}.product_calling_type ;;
  }

  dimension: product_capacity {
    type: string
    sql: ${TABLE}.product_capacity ;;
  }

  dimension: product_capacitystatus {
    type: string
    sql: ${TABLE}.product_capacitystatus ;;
  }

  dimension: product_case_severityresponse_times {
    type: string
    sql: ${TABLE}.product_case_severityresponse_times ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_certificate_domain_type {
    type: string
    sql: ${TABLE}.product_certificate_domain_type ;;
  }

  dimension: product_certificate_export_type {
    type: string
    sql: ${TABLE}.product_certificate_export_type ;;
  }

  dimension: product_certificate_type {
    type: string
    sql: ${TABLE}.product_certificate_type ;;
  }

  dimension: product_check_type {
    type: string
    sql: ${TABLE}.product_check_type ;;
  }

  dimension: product_ci_type {
    type: string
    sql: ${TABLE}.product_ci_type ;;
  }

  dimension: product_classicnetworkingsupport {
    type: string
    sql: ${TABLE}.product_classicnetworkingsupport ;;
  }

  dimension: product_client_location {
    type: string
    sql: ${TABLE}.product_client_location ;;
  }

  dimension: product_clock_speed {
    type: string
    sql: ${TABLE}.product_clock_speed ;;
  }

  dimension: product_cloudformationresource_provider {
    type: string
    sql: ${TABLE}.product_cloudformationresource_provider ;;
  }

  dimension: product_comment {
    type: string
    sql: ${TABLE}.product_comment ;;
  }

  dimension: product_component {
    type: string
    sql: ${TABLE}.product_component ;;
  }

  dimension: product_compute_family {
    type: string
    sql: ${TABLE}.product_compute_family ;;
  }

  dimension: product_compute_type {
    type: string
    sql: ${TABLE}.product_compute_type ;;
  }

  dimension: product_connection_type {
    type: string
    sql: ${TABLE}.product_connection_type ;;
  }

  dimension: product_content_type {
    type: string
    sql: ${TABLE}.product_content_type ;;
  }

  dimension: product_continent {
    type: string
    sql: ${TABLE}.product_continent ;;
  }

  dimension: product_country {
    type: string
    sql: ${TABLE}.product_country ;;
  }

  dimension: product_cputupe {
    type: string
    sql: ${TABLE}.product_cputupe ;;
  }

  dimension: product_cputype {
    type: string
    sql: ${TABLE}.product_cputype ;;
  }

  dimension: product_crossregion_data_replication {
    type: string
    sql: ${TABLE}.product_crossregion_data_replication ;;
  }

  dimension: product_current_generation {
    type: string
    sql: ${TABLE}.product_current_generation ;;
  }

  dimension: product_customer_service_and_communities {
    type: string
    sql: ${TABLE}.product_customer_service_and_communities ;;
  }

  dimension: product_data {
    type: string
    sql: ${TABLE}.product_data ;;
  }

  dimension: product_data_type {
    type: string
    sql: ${TABLE}.product_data_type ;;
  }

  dimension: product_database_edition {
    type: string
    sql: ${TABLE}.product_database_edition ;;
  }

  dimension: product_database_engine {
    type: string
    sql: ${TABLE}.product_database_engine ;;
  }

  dimension: product_database_engine_type {
    type: string
    sql: ${TABLE}.product_database_engine_type ;;
  }

  dimension: product_datatransferout {
    type: string
    sql: ${TABLE}.product_datatransferout ;;
  }

  dimension: product_dedicated_ebs_throughput {
    type: string
    sql: ${TABLE}.product_dedicated_ebs_throughput ;;
  }

  dimension: product_dedicated_ebs_throughput_description {
    type: string
    sql: ${TABLE}.product_dedicated_ebs_throughput_description ;;
  }

  dimension: product_deployment_option {
    type: string
    sql: ${TABLE}.product_deployment_option ;;
  }

  dimension: product_describes {
    type: string
    sql: ${TABLE}.product_describes ;;
  }

  dimension: product_description {
    type: string
    sql: ${TABLE}.product_description ;;
  }

  dimension: product_direct_connect_location {
    type: string
    sql: ${TABLE}.product_direct_connect_location ;;
  }

  dimension: product_directory_size {
    type: string
    sql: ${TABLE}.product_directory_size ;;
  }

  dimension: product_directory_type {
    type: string
    sql: ${TABLE}.product_directory_type ;;
  }

  dimension: product_directory_type_description {
    type: string
    sql: ${TABLE}.product_directory_type_description ;;
  }

  dimension: product_dominantnondominant {
    type: string
    sql: ${TABLE}.product_dominantnondominant ;;
  }

  dimension: product_durability {
    type: string
    sql: ${TABLE}.product_durability ;;
  }

  dimension: product_duration {
    type: string
    sql: ${TABLE}.product_duration ;;
  }

  dimension: product_ecu {
    type: string
    sql: ${TABLE}.product_ecu ;;
  }

  dimension: product_edition {
    type: string
    sql: ${TABLE}.product_edition ;;
  }

  dimension: product_eksproducttype {
    type: string
    sql: ${TABLE}.product_eksproducttype ;;
  }

  dimension: product_endpoint {
    type: string
    sql: ${TABLE}.product_endpoint ;;
  }

  dimension: product_endpoint_type {
    type: string
    sql: ${TABLE}.product_endpoint_type ;;
  }

  dimension: product_engine {
    type: string
    sql: ${TABLE}.product_engine ;;
  }

  dimension: product_engine_code {
    type: string
    sql: ${TABLE}.product_engine_code ;;
  }

  dimension: product_engine_major_version {
    type: string
    sql: ${TABLE}.product_engine_major_version ;;
  }

  dimension: product_enhanced_networking_support {
    type: string
    sql: ${TABLE}.product_enhanced_networking_support ;;
  }

  dimension: product_enhanced_networking_supported {
    type: string
    sql: ${TABLE}.product_enhanced_networking_supported ;;
  }

  dimension: product_entity_type {
    type: string
    sql: ${TABLE}.product_entity_type ;;
  }

  dimension: product_equivalentondemandsku {
    type: string
    sql: ${TABLE}.product_equivalentondemandsku ;;
  }

  dimension: product_event_type {
    type: string
    sql: ${TABLE}.product_event_type ;;
  }

  dimension: product_extended_support_pricing_year {
    type: string
    sql: ${TABLE}.product_extended_support_pricing_year ;;
  }

  dimension: product_feature {
    type: string
    sql: ${TABLE}.product_feature ;;
  }

  dimension: product_fee_code {
    type: string
    sql: ${TABLE}.product_fee_code ;;
  }

  dimension: product_fee_description {
    type: string
    sql: ${TABLE}.product_fee_description ;;
  }

  dimension: product_file_system_type {
    type: string
    sql: ${TABLE}.product_file_system_type ;;
  }

  dimension: product_finding_group {
    type: string
    sql: ${TABLE}.product_finding_group ;;
  }

  dimension: product_finding_source {
    type: string
    sql: ${TABLE}.product_finding_source ;;
  }

  dimension: product_finding_storage {
    type: string
    sql: ${TABLE}.product_finding_storage ;;
  }

  dimension: product_finding_type {
    type: string
    sql: ${TABLE}.product_finding_type ;;
  }

  dimension: product_framework_type {
    type: string
    sql: ${TABLE}.product_framework_type ;;
  }

  dimension: product_free_query_types {
    type: string
    sql: ${TABLE}.product_free_query_types ;;
  }

  dimension: product_free_tier {
    type: string
    sql: ${TABLE}.product_free_tier ;;
  }

  dimension: product_free_trial {
    type: string
    sql: ${TABLE}.product_free_trial ;;
  }

  dimension: product_free_usage_included {
    type: string
    sql: ${TABLE}.product_free_usage_included ;;
  }

  dimension: product_from_location {
    type: string
    sql: ${TABLE}.product_from_location ;;
  }

  dimension: product_from_location_type {
    type: string
    sql: ${TABLE}.product_from_location_type ;;
  }

  dimension: product_from_region_code {
    type: string
    sql: ${TABLE}.product_from_region_code ;;
  }

  dimension: product_gb {
    type: string
    sql: ${TABLE}.product_gb ;;
  }

  dimension: product_georegioncode {
    type: string
    sql: ${TABLE}.product_georegioncode ;;
  }

  dimension: product_gets {
    type: string
    sql: ${TABLE}.product_gets ;;
  }

  dimension: product_gpu {
    type: string
    sql: ${TABLE}.product_gpu ;;
  }

  dimension: product_gpu_memory {
    type: string
    sql: ${TABLE}.product_gpu_memory ;;
  }

  dimension: product_granularity {
    type: string
    sql: ${TABLE}.product_granularity ;;
  }

  dimension: product_group {
    type: string
    sql: ${TABLE}.product_group ;;
  }

  dimension: product_group_description {
    type: string
    sql: ${TABLE}.product_group_description ;;
  }

  dimension: product_included_services {
    type: string
    sql: ${TABLE}.product_included_services ;;
  }

  dimension: product_inference_type {
    type: string
    sql: ${TABLE}.product_inference_type ;;
  }

  dimension: product_insightstype {
    type: string
    sql: ${TABLE}.product_insightstype ;;
  }

  dimension: product_instance {
    type: string
    sql: ${TABLE}.product_instance ;;
  }

  dimension: product_instance_capacity_metal {
    type: string
    sql: ${TABLE}.product_instance_capacity_metal ;;
  }

  dimension: product_instance_configuration_type {
    type: string
    sql: ${TABLE}.product_instance_configuration_type ;;
  }

  dimension: product_instance_family {
    type: string
    sql: ${TABLE}.product_instance_family ;;
  }

  dimension: product_instance_name {
    type: string
    sql: ${TABLE}.product_instance_name ;;
  }

  dimension: product_instance_storage {
    type: string
    sql: ${TABLE}.product_instance_storage ;;
  }

  dimension: product_instance_type {
    type: string
    sql: ${TABLE}.product_instance_type ;;
  }

  dimension: product_instance_type_family {
    type: string
    sql: ${TABLE}.product_instance_type_family ;;
  }

  dimension: product_instancesku {
    type: string
    sql: ${TABLE}.product_instancesku ;;
  }

  dimension: product_intel_avx2_available {
    type: string
    sql: ${TABLE}.product_intel_avx2_available ;;
  }

  dimension: product_intel_avx_available {
    type: string
    sql: ${TABLE}.product_intel_avx_available ;;
  }

  dimension: product_intel_turbo_available {
    type: string
    sql: ${TABLE}.product_intel_turbo_available ;;
  }

  dimension: product_invocation {
    type: string
    sql: ${TABLE}.product_invocation ;;
  }

  dimension: product_io {
    type: string
    sql: ${TABLE}.product_io ;;
  }

  dimension: product_launch_support {
    type: string
    sql: ${TABLE}.product_launch_support ;;
  }

  dimension: product_license {
    type: string
    sql: ${TABLE}.product_license ;;
  }

  dimension: product_license_model {
    type: string
    sql: ${TABLE}.product_license_model ;;
  }

  dimension: product_line_type {
    type: string
    sql: ${TABLE}.product_line_type ;;
  }

  dimension: product_location {
    type: string
    sql: ${TABLE}.product_location ;;
  }

  dimension: product_location_type {
    type: string
    sql: ${TABLE}.product_location_type ;;
  }

  dimension: product_logs_destination {
    type: string
    sql: ${TABLE}.product_logs_destination ;;
  }

  dimension: product_m2m_category {
    type: string
    sql: ${TABLE}.product_m2m_category ;;
  }

  dimension: product_mailbox_storage {
    type: string
    sql: ${TABLE}.product_mailbox_storage ;;
  }

  dimension: product_marketoption {
    type: string
    sql: ${TABLE}.product_marketoption ;;
  }

  dimension: product_max_iops_burst_performance {
    type: string
    sql: ${TABLE}.product_max_iops_burst_performance ;;
  }

  dimension: product_max_iopsvolume {
    type: string
    sql: ${TABLE}.product_max_iopsvolume ;;
  }

  dimension: product_max_throughputvolume {
    type: string
    sql: ${TABLE}.product_max_throughputvolume ;;
  }

  dimension: product_max_volume_size {
    type: string
    sql: ${TABLE}.product_max_volume_size ;;
  }

  dimension: product_maximum_extended_storage {
    type: string
    sql: ${TABLE}.product_maximum_extended_storage ;;
  }

  dimension: product_maximum_storage_volume {
    type: string
    sql: ${TABLE}.product_maximum_storage_volume ;;
  }

  dimension: product_memory {
    type: string
    sql: ${TABLE}.product_memory ;;
  }

  dimension: product_memory_gib {
    type: string
    sql: ${TABLE}.product_memory_gib ;;
  }

  dimension: product_memorytype {
    type: string
    sql: ${TABLE}.product_memorytype ;;
  }

  dimension: product_message_delivery_frequency {
    type: string
    sql: ${TABLE}.product_message_delivery_frequency ;;
  }

  dimension: product_message_delivery_order {
    type: string
    sql: ${TABLE}.product_message_delivery_order ;;
  }

  dimension: product_min_volume_size {
    type: string
    sql: ${TABLE}.product_min_volume_size ;;
  }

  dimension: product_minimum_storage_volume {
    type: string
    sql: ${TABLE}.product_minimum_storage_volume ;;
  }

  dimension: product_model {
    type: string
    sql: ${TABLE}.product_model ;;
  }

  dimension: product_network_performance {
    type: string
    sql: ${TABLE}.product_network_performance ;;
  }

  dimension: product_newcode {
    type: string
    sql: ${TABLE}.product_newcode ;;
  }

  dimension: product_normalization_size_factor {
    type: string
    sql: ${TABLE}.product_normalization_size_factor ;;
  }

  dimension: product_ocb_late_fee {
    type: string
    sql: ${TABLE}.product_ocb_late_fee ;;
  }

  dimension: product_operating_system {
    type: string
    sql: ${TABLE}.product_operating_system ;;
  }

  dimension: product_operation {
    type: string
    sql: ${TABLE}.product_operation ;;
  }

  dimension: product_operations_support {
    type: string
    sql: ${TABLE}.product_operations_support ;;
  }

  dimension: product_ops_items {
    type: string
    sql: ${TABLE}.product_ops_items ;;
  }

  dimension: product_origin {
    type: string
    sql: ${TABLE}.product_origin ;;
  }

  dimension: product_overhead {
    type: string
    sql: ${TABLE}.product_overhead ;;
  }

  dimension: product_pack_size {
    type: string
    sql: ${TABLE}.product_pack_size ;;
  }

  dimension: product_parameter_type {
    type: string
    sql: ${TABLE}.product_parameter_type ;;
  }

  dimension: product_physical_cores {
    type: string
    sql: ${TABLE}.product_physical_cores ;;
  }

  dimension: product_physical_cpu {
    type: string
    sql: ${TABLE}.product_physical_cpu ;;
  }

  dimension: product_physical_gpu {
    type: string
    sql: ${TABLE}.product_physical_gpu ;;
  }

  dimension: product_physical_processor {
    type: string
    sql: ${TABLE}.product_physical_processor ;;
  }

  dimension: product_plancode {
    type: string
    sql: ${TABLE}.product_plancode ;;
  }

  dimension: product_planfamilycode {
    type: string
    sql: ${TABLE}.product_planfamilycode ;;
  }

  dimension: product_planfamilyname {
    type: string
    sql: ${TABLE}.product_planfamilyname ;;
  }

  dimension: product_platoclassificationtype {
    type: string
    sql: ${TABLE}.product_platoclassificationtype ;;
  }

  dimension: product_platodataanalyzedtype {
    type: string
    sql: ${TABLE}.product_platodataanalyzedtype ;;
  }

  dimension: product_platoinstancename {
    type: string
    sql: ${TABLE}.product_platoinstancename ;;
  }

  dimension: product_platoinstancetype {
    type: string
    sql: ${TABLE}.product_platoinstancetype ;;
  }

  dimension: product_platopagedatatype {
    type: string
    sql: ${TABLE}.product_platopagedatatype ;;
  }

  dimension: product_platopricingtype {
    type: string
    sql: ${TABLE}.product_platopricingtype ;;
  }

  dimension: product_platopricingunittype {
    type: string
    sql: ${TABLE}.product_platopricingunittype ;;
  }

  dimension: product_platoprotocoltype {
    type: string
    sql: ${TABLE}.product_platoprotocoltype ;;
  }

  dimension: product_platostoragetype {
    type: string
    sql: ${TABLE}.product_platostoragetype ;;
  }

  dimension: product_platotrafficdirection {
    type: string
    sql: ${TABLE}.product_platotrafficdirection ;;
  }

  dimension: product_platotransfertype {
    type: string
    sql: ${TABLE}.product_platotransfertype ;;
  }

  dimension: product_platousagetype {
    type: string
    sql: ${TABLE}.product_platousagetype ;;
  }

  dimension: product_platovolumetype {
    type: string
    sql: ${TABLE}.product_platovolumetype ;;
  }

  dimension: product_port_speed {
    type: string
    sql: ${TABLE}.product_port_speed ;;
  }

  dimension: product_pre_installed_sw {
    type: string
    sql: ${TABLE}.product_pre_installed_sw ;;
  }

  dimension: product_pricing_unit {
    type: string
    sql: ${TABLE}.product_pricing_unit ;;
  }

  dimension: product_pricingplan {
    type: string
    sql: ${TABLE}.product_pricingplan ;;
  }

  dimension: product_proactive_guidance {
    type: string
    sql: ${TABLE}.product_proactive_guidance ;;
  }

  dimension: product_processor_architecture {
    type: string
    sql: ${TABLE}.product_processor_architecture ;;
  }

  dimension: product_processor_features {
    type: string
    sql: ${TABLE}.product_processor_features ;;
  }

  dimension: product_product_family {
    type: string
    sql: ${TABLE}.product_product_family ;;
  }

  dimension: product_product_name {
    type: string
    sql: ${TABLE}.product_product_name ;;
  }

  dimension: product_product_schema_description {
    type: string
    sql: ${TABLE}.product_product_schema_description ;;
  }

  dimension: product_product_type {
    type: string
    sql: ${TABLE}.product_product_type ;;
  }

  dimension: product_programmatic_case_management {
    type: string
    sql: ${TABLE}.product_programmatic_case_management ;;
  }

  dimension: product_protocol {
    type: string
    sql: ${TABLE}.product_protocol ;;
  }

  dimension: product_provider {
    type: string
    sql: ${TABLE}.product_provider ;;
  }

  dimension: product_provisioned {
    type: string
    sql: ${TABLE}.product_provisioned ;;
  }

  dimension: product_purchase_option {
    type: string
    sql: ${TABLE}.product_purchase_option ;;
  }

  dimension: product_purchaseterm {
    type: string
    sql: ${TABLE}.product_purchaseterm ;;
  }

  dimension: product_q_present {
    type: string
    sql: ${TABLE}.product_q_present ;;
  }

  dimension: product_queue_type {
    type: string
    sql: ${TABLE}.product_queue_type ;;
  }

  dimension: product_recipient {
    type: string
    sql: ${TABLE}.product_recipient ;;
  }

  dimension: product_recipient_validation {
    type: string
    sql: ${TABLE}.product_recipient_validation ;;
  }

  dimension: product_region {
    type: string
    sql: ${TABLE}.product_region ;;
  }

  dimension: product_region_code {
    type: string
    sql: ${TABLE}.product_region_code ;;
  }

  dimension: product_request_description {
    type: string
    sql: ${TABLE}.product_request_description ;;
  }

  dimension: product_request_type {
    type: string
    sql: ${TABLE}.product_request_type ;;
  }

  dimension: product_resource_endpoint {
    type: string
    sql: ${TABLE}.product_resource_endpoint ;;
  }

  dimension: product_resource_price_group {
    type: string
    sql: ${TABLE}.product_resource_price_group ;;
  }

  dimension: product_resource_type {
    type: string
    sql: ${TABLE}.product_resource_type ;;
  }

  dimension: product_rootvolume {
    type: string
    sql: ${TABLE}.product_rootvolume ;;
  }

  dimension: product_routing_target {
    type: string
    sql: ${TABLE}.product_routing_target ;;
  }

  dimension: product_routing_type {
    type: string
    sql: ${TABLE}.product_routing_type ;;
  }

  dimension: product_running_mode {
    type: string
    sql: ${TABLE}.product_running_mode ;;
  }

  dimension: product_scan_type {
    type: string
    sql: ${TABLE}.product_scan_type ;;
  }

  dimension: product_servicecode {
    type: string
    sql: ${TABLE}.product_servicecode ;;
  }

  dimension: product_servicename {
    type: string
    sql: ${TABLE}.product_servicename ;;
  }

  dimension: product_size_flex {
    type: string
    sql: ${TABLE}.product_size_flex ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: product_software_included {
    type: string
    sql: ${TABLE}.product_software_included ;;
  }

  dimension: product_software_type {
    type: string
    sql: ${TABLE}.product_software_type ;;
  }

  dimension: product_sourcetype {
    type: string
    sql: ${TABLE}.product_sourcetype ;;
  }

  dimension: product_ssd {
    type: string
    sql: ${TABLE}.product_ssd ;;
  }

  dimension: product_standard_group {
    type: string
    sql: ${TABLE}.product_standard_group ;;
  }

  dimension: product_standard_storage {
    type: string
    sql: ${TABLE}.product_standard_storage ;;
  }

  dimension: product_standard_storage_retention_included {
    type: string
    sql: ${TABLE}.product_standard_storage_retention_included ;;
  }

  dimension: product_storage {
    type: string
    sql: ${TABLE}.product_storage ;;
  }

  dimension: product_storage_class {
    type: string
    sql: ${TABLE}.product_storage_class ;;
  }

  dimension: product_storage_family {
    type: string
    sql: ${TABLE}.product_storage_family ;;
  }

  dimension: product_storage_media {
    type: string
    sql: ${TABLE}.product_storage_media ;;
  }

  dimension: product_storage_tier {
    type: string
    sql: ${TABLE}.product_storage_tier ;;
  }

  dimension: product_storage_type {
    type: string
    sql: ${TABLE}.product_storage_type ;;
  }

  dimension: product_subcategory {
    type: string
    sql: ${TABLE}.product_subcategory ;;
  }

  dimension: product_subscription_type {
    type: string
    sql: ${TABLE}.product_subscription_type ;;
  }

  dimension: product_subservice {
    type: string
    sql: ${TABLE}.product_subservice ;;
  }

  dimension: product_supported_modes {
    type: string
    sql: ${TABLE}.product_supported_modes ;;
  }

  dimension: product_technical_support {
    type: string
    sql: ${TABLE}.product_technical_support ;;
  }

  dimension: product_tenancy {
    type: string
    sql: ${TABLE}.product_tenancy ;;
  }

  dimension: product_thirdparty_software_support {
    type: string
    sql: ${TABLE}.product_thirdparty_software_support ;;
  }

  dimension: product_throughput {
    type: string
    sql: ${TABLE}.product_throughput ;;
  }

  dimension: product_throughput_capacity {
    type: string
    sql: ${TABLE}.product_throughput_capacity ;;
  }

  dimension: product_throughput_class {
    type: string
    sql: ${TABLE}.product_throughput_class ;;
  }

  dimension: product_tickettype {
    type: string
    sql: ${TABLE}.product_tickettype ;;
  }

  dimension: product_tiertype {
    type: string
    sql: ${TABLE}.product_tiertype ;;
  }

  dimension: product_time_window {
    type: string
    sql: ${TABLE}.product_time_window ;;
  }

  dimension: product_tnbapicalls {
    type: string
    sql: ${TABLE}.product_tnbapicalls ;;
  }

  dimension: product_to_location {
    type: string
    sql: ${TABLE}.product_to_location ;;
  }

  dimension: product_to_location_type {
    type: string
    sql: ${TABLE}.product_to_location_type ;;
  }

  dimension: product_to_region_code {
    type: string
    sql: ${TABLE}.product_to_region_code ;;
  }

  dimension: product_traffic_direction {
    type: string
    sql: ${TABLE}.product_traffic_direction ;;
  }

  dimension: product_training {
    type: string
    sql: ${TABLE}.product_training ;;
  }

  dimension: product_transfer_type {
    type: string
    sql: ${TABLE}.product_transfer_type ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: product_type_description {
    type: string
    sql: ${TABLE}.product_type_description ;;
  }

  dimension: product_unbundled_licensing {
    type: string
    sql: ${TABLE}.product_unbundled_licensing ;;
  }

  dimension: product_updates {
    type: string
    sql: ${TABLE}.product_updates ;;
  }

  dimension: product_usage_family {
    type: string
    sql: ${TABLE}.product_usage_family ;;
  }

  dimension: product_usage_group {
    type: string
    sql: ${TABLE}.product_usage_group ;;
  }

  dimension: product_usage_volume {
    type: string
    sql: ${TABLE}.product_usage_volume ;;
  }

  dimension: product_usagetype {
    type: string
    sql: ${TABLE}.product_usagetype ;;
  }

  dimension: product_uservolume {
    type: string
    sql: ${TABLE}.product_uservolume ;;
  }

  dimension: product_vcpu {
    type: string
    sql: ${TABLE}.product_vcpu ;;
  }

  dimension: product_version {
    type: string
    sql: ${TABLE}.product_version ;;
  }

  dimension: product_virtual_interface_type {
    type: string
    sql: ${TABLE}.product_virtual_interface_type ;;
  }

  dimension: product_volume_api_name {
    type: string
    sql: ${TABLE}.product_volume_api_name ;;
  }

  dimension: product_volume_type {
    type: string
    sql: ${TABLE}.product_volume_type ;;
  }

  dimension: product_volumeoptimization {
    type: string
    sql: ${TABLE}.product_volumeoptimization ;;
  }

  dimension: product_vpcnetworkingsupport {
    type: string
    sql: ${TABLE}.product_vpcnetworkingsupport ;;
  }

  dimension: product_vpn_type {
    type: string
    sql: ${TABLE}.product_vpn_type ;;
  }

  dimension: product_who_can_open_cases {
    type: string
    sql: ${TABLE}.product_who_can_open_cases ;;
  }

  dimension: product_with_active_users {
    type: string
    sql: ${TABLE}.product_with_active_users ;;
  }

  dimension: product_yearnumber {
    type: string
    sql: ${TABLE}.product_yearnumber ;;
  }

  dimension: reservation_amortized_upfront_cost_for_usage {
    type: number
    sql: ${TABLE}.reservation_amortized_upfront_cost_for_usage ;;
  }

  dimension: reservation_amortized_upfront_fee_for_billing_period {
    type: number
    sql: ${TABLE}.reservation_amortized_upfront_fee_for_billing_period ;;
  }

  dimension: reservation_availability_zone {
    type: string
    sql: ${TABLE}.reservation_availability_zone ;;
  }

  dimension: reservation_effective_cost {
    type: number
    sql: ${TABLE}.reservation_effective_cost ;;
  }

  dimension: reservation_end_time {
    type: string
    sql: ${TABLE}.reservation_end_time ;;
  }

  dimension: reservation_modification_status {
    type: string
    sql: ${TABLE}.reservation_modification_status ;;
  }

  dimension: reservation_net_amortized_upfront_cost_for_usage {
    type: number
    sql: ${TABLE}.reservation_net_amortized_upfront_cost_for_usage ;;
  }

  dimension: reservation_net_amortized_upfront_fee_for_billing_period {
    type: number
    sql: ${TABLE}.reservation_net_amortized_upfront_fee_for_billing_period ;;
  }

  dimension: reservation_net_effective_cost {
    type: number
    sql: ${TABLE}.reservation_net_effective_cost ;;
  }

  dimension: reservation_net_recurring_fee_for_usage {
    type: number
    sql: ${TABLE}.reservation_net_recurring_fee_for_usage ;;
  }

  dimension: reservation_net_unused_amortized_upfront_fee_for_billing_period {
    type: number
    sql: ${TABLE}.reservation_net_unused_amortized_upfront_fee_for_billing_period ;;
  }

  dimension: reservation_net_unused_recurring_fee {
    type: number
    sql: ${TABLE}.reservation_net_unused_recurring_fee ;;
  }

  dimension: reservation_net_upfront_value {
    type: number
    sql: ${TABLE}.reservation_net_upfront_value ;;
  }

  dimension: reservation_normalized_units_per_reservation {
    type: string
    sql: ${TABLE}.reservation_normalized_units_per_reservation ;;
  }

  dimension: reservation_number_of_reservations {
    type: string
    sql: ${TABLE}.reservation_number_of_reservations ;;
  }

  dimension: reservation_recurring_fee_for_usage {
    type: number
    sql: ${TABLE}.reservation_recurring_fee_for_usage ;;
  }

  dimension: reservation_reservation_a_r_n {
    type: string
    sql: ${TABLE}.reservation_reservation_a_r_n ;;
  }

  dimension: reservation_start_time {
    type: string
    sql: ${TABLE}.reservation_start_time ;;
  }

  dimension: reservation_subscription_id {
    type: string
    sql: ${TABLE}.reservation_subscription_id ;;
  }

  dimension: reservation_total_reserved_normalized_units {
    type: string
    sql: ${TABLE}.reservation_total_reserved_normalized_units ;;
  }

  dimension: reservation_total_reserved_units {
    type: string
    sql: ${TABLE}.reservation_total_reserved_units ;;
  }

  dimension: reservation_units_per_reservation {
    type: string
    sql: ${TABLE}.reservation_units_per_reservation ;;
  }

  dimension: reservation_unused_amortized_upfront_fee_for_billing_period {
    type: number
    sql: ${TABLE}.reservation_unused_amortized_upfront_fee_for_billing_period ;;
  }

  dimension: reservation_unused_normalized_unit_quantity {
    type: number
    sql: ${TABLE}.reservation_unused_normalized_unit_quantity ;;
  }

  dimension: reservation_unused_quantity {
    type: number
    sql: ${TABLE}.reservation_unused_quantity ;;
  }

  dimension: reservation_unused_recurring_fee {
    type: number
    sql: ${TABLE}.reservation_unused_recurring_fee ;;
  }

  dimension: reservation_upfront_value {
    type: number
    sql: ${TABLE}.reservation_upfront_value ;;
  }

  dimension: resource_tags_aws_eks_cluster_name {
    type: string
    sql: ${TABLE}.resource_tags_aws_eks_cluster_name ;;
  }

  dimension: resource_tags_user_aws_application {
    type: string
    sql: ${TABLE}.resource_tags_user_aws_application ;;
  }

  dimension: resource_tags_user_aws_cost_center {
    type: string
    sql: ${TABLE}.resource_tags_user_aws_cost_center ;;
  }

  dimension: resource_tags_user_costanalysis_s3 {
    type: string
    sql: ${TABLE}.resource_tags_user_costanalysis_s3 ;;
  }

  dimension: resource_tags_user_ec2costenv {
    type: string
    sql: ${TABLE}.resource_tags_user_ec2costenv ;;
  }

  dimension: resource_tags_user_ec2costprod {
    type: string
    sql: ${TABLE}.resource_tags_user_ec2costprod ;;
  }

  dimension: resource_tags_user_eks_cluster_name {
    type: string
    sql: ${TABLE}.resource_tags_user_eks_cluster_name ;;
  }

  dimension: resource_tags_user_eks_eks_cluster_name {
    type: string
    sql: ${TABLE}.resource_tags_user_eks_eks_cluster_name ;;
  }

  dimension: resource_tags_user_machine_type {
    type: string
    sql: ${TABLE}.resource_tags_user_machine_type ;;
  }

  dimension: resource_tags_user_name {
    type: string
    sql: ${TABLE}.resource_tags_user_name ;;
  }

  dimension: resource_tags_user_periscope_vpc {
    type: string
    sql: ${TABLE}.resource_tags_user_periscope_vpc ;;
  }

  dimension: resource_tags_user_project {
    type: string
    sql: ${TABLE}.resource_tags_user_project ;;
  }

  dimension: resource_tags_user_service {
    type: string
    sql: ${TABLE}.resource_tags_user_service ;;
  }

  dimension: savings_plan_amortized_upfront_commitment_for_billing_period {
    type: number
    sql: ${TABLE}.savings_plan_amortized_upfront_commitment_for_billing_period ;;
  }

  dimension: savings_plan_end_time {
    type: string
    sql: ${TABLE}.savings_plan_end_time ;;
  }

  dimension: savings_plan_instance_type_family {
    type: string
    sql: ${TABLE}.savings_plan_instance_type_family ;;
  }

  dimension: savings_plan_net_amortized_upfront_commitment_for_billing_period {
    type: number
    sql: ${TABLE}.savings_plan_net_amortized_upfront_commitment_for_billing_period ;;
  }

  dimension: savings_plan_net_recurring_commitment_for_billing_period {
    type: number
    sql: ${TABLE}.savings_plan_net_recurring_commitment_for_billing_period ;;
  }

  dimension: savings_plan_net_savings_plan_effective_cost {
    type: number
    sql: ${TABLE}.savings_plan_net_savings_plan_effective_cost ;;
  }

  dimension: savings_plan_offering_type {
    type: string
    sql: ${TABLE}.savings_plan_offering_type ;;
  }

  dimension: savings_plan_payment_option {
    type: string
    sql: ${TABLE}.savings_plan_payment_option ;;
  }

  dimension: savings_plan_purchase_term {
    type: string
    sql: ${TABLE}.savings_plan_purchase_term ;;
  }

  dimension: savings_plan_recurring_commitment_for_billing_period {
    type: number
    sql: ${TABLE}.savings_plan_recurring_commitment_for_billing_period ;;
  }

  dimension: savings_plan_region {
    type: string
    sql: ${TABLE}.savings_plan_region ;;
  }

  dimension: savings_plan_savings_plan_a_r_n {
    type: string
    sql: ${TABLE}.savings_plan_savings_plan_a_r_n ;;
  }

  dimension: savings_plan_savings_plan_effective_cost {
    type: number
    sql: ${TABLE}.savings_plan_savings_plan_effective_cost ;;
  }

  dimension: savings_plan_savings_plan_rate {
    type: number
    sql: ${TABLE}.savings_plan_savings_plan_rate ;;
  }

  dimension: savings_plan_start_time {
    type: string
    sql: ${TABLE}.savings_plan_start_time ;;
  }

  dimension: savings_plan_total_commitment_to_date {
    type: number
    sql: ${TABLE}.savings_plan_total_commitment_to_date ;;
  }

  dimension: savings_plan_used_commitment {
    type: number
    sql: ${TABLE}.savings_plan_used_commitment ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      resource_tags_user_name,
      product_product_name,
      product_instance_name,
      product_volume_api_name,
      resource_tags_user_eks_eks_cluster_name,
      product_servicename,
      product_planfamilyname,
      cost_category_aws_invoice_invoice_unit_name,
      resource_tags_aws_eks_cluster_name,
      product_platoinstancename,
      resource_tags_user_eks_cluster_name
    ]
  }

}
