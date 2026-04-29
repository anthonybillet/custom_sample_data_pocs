view: marketing_attribution_demo {
  sql_table_name: `ant-billet-looker-core-argolis.sample_data.marketing_attribution_demo` ;;

  # --- STANDARD DIMENSIONS ---
  dimension_group: event {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: tenant_id {
    type: string
    sql: ${TABLE}.tenant_id ;;
  }

  # ==========================================
  # 1: RUNTIME PARAMETRIZATION
  # ==========================================
  parameter: accounting_mode {
    type: unquoted
    allowed_value: { label: "Accrual" value: "accrual" }
    allowed_value: { label: "Cash" value: "cash" }
    default_value: "accrual"
  }

  parameter: attribution_model {
    type: unquoted
    allowed_value: { label: "Last Touch" value: "last_touch" }
    allowed_value: { label: "First Touch" value: "first_touch" }
    default_value: "last_touch"
  }

  parameter: attribution_window {
    type: unquoted
    allowed_value: { label: "7 Day" value: "7" }
    allowed_value: { label: "30 Day" value: "30" }
    default_value: "7"
  }

  # The engine dynamically swaps the BQ column based on user UI selections
  measure: dynamic_revenue {
    type: sum
    sql: ${TABLE}.metrics__{% parameter accounting_mode %}__{% parameter attribution_model %}__{% parameter attribution_window %}.revenue ;;
    value_format_name: usd
  }

  measure: dynamic_impressions {
    hidden: yes # Hidden because we only use it for the censoring logic below
    type: sum
    sql: ${TABLE}.metrics__{% parameter accounting_mode %}__{% parameter attribution_model %}__{% parameter attribution_window %}.impressions ;;
  }

  # ==========================================
  # 2: RUNTIME DYNAMISM (UNNESTING)
  # ==========================================
  parameter: custom_goal_name {
    type: string
    description: "Type the name of any goal mapped in your database (e.g., 'newsletter_signup', 'demo_booked')"
  }

  measure: dynamic_custom_goal {
    type: number
    description: "Calculates on the fly based on the Custom Goal Name parameter"
    sql: SUM(COALESCE((
          SELECT goal.goal_value
          FROM UNNEST(${TABLE}.metrics__{% parameter accounting_mode %}__{% parameter attribution_model %}__{% parameter attribution_window %}.goal_completions) AS goal
          WHERE goal.goal_type = {% parameter custom_goal_name %}
         ), 0)) ;;
  }

  # ==========================================
  # 3: REQUEST-SHAPE (CENSORING)
  # ==========================================
  # Note: For the demo, I'm using a parameter so you can toggle it live on the call.
  # In production, this would be a User Attribute: _user_attributes['is_censorable']
  parameter: simulate_feature_flag_censoring {
    type: unquoted
    allowed_value: { label: "Flag ON (Censor Data)" value: "yes" }
    allowed_value: { label: "Flag OFF (Raw Data)" value: "no" }
    default_value: "yes"
  }

  measure: censored_revenue {
    type: number
    sql:
      {% if simulate_feature_flag_censoring._parameter_value == 'yes' %}
        CASE
          WHEN ${platform} = 'Meta' AND ${dynamic_impressions} < 100 THEN 0
          ELSE ${dynamic_revenue}
        END
      {% else %}
        ${dynamic_revenue}
      {% endif %} ;;
    value_format_name: usd
  }
}
