# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: marketing_attribution_demo {
  hidden: yes
    join: marketing_attribution_demo__metrics__cash__first_touch__30__goal_completions {
      view_label: "Marketing Attribution Demo: Metrics Cash First Touch 30 Goal Completions"
      sql: LEFT JOIN UNNEST(${marketing_attribution_demo.metrics__cash__first_touch__30__goal_completions}) as marketing_attribution_demo__metrics__cash__first_touch__30__goal_completions ;;
      relationship: one_to_many
    }
    join: marketing_attribution_demo__metrics__accrual__last_touch__7__goal_completions {
      view_label: "Marketing Attribution Demo: Metrics Accrual Last Touch 7 Goal Completions"
      sql: LEFT JOIN UNNEST(${marketing_attribution_demo.metrics__accrual__last_touch__7__goal_completions}) as marketing_attribution_demo__metrics__accrual__last_touch__7__goal_completions ;;
      relationship: one_to_many
    }
}
view: marketing_attribution_demo {
  sql_table_name: `ant-billet-looker-core-argolis.sample_data.marketing_attribution_demo` ;;

  dimension_group: event {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }
  dimension: metrics__accrual__last_touch__7__goal_completions {
    hidden: yes
    sql: ${TABLE}.metrics__accrual__last_touch__7.goal_completions ;;
    group_label: "Metrics Accrual Last Touch 7"
    group_item_label: "Goal Completions"
  }
  dimension: metrics__accrual__last_touch__7__impressions {
    type: number
    sql: ${TABLE}.metrics__accrual__last_touch__7.impressions ;;
    group_label: "Metrics Accrual Last Touch 7"
    group_item_label: "Impressions"
  }
  dimension: metrics__accrual__last_touch__7__revenue {
    type: number
    sql: ${TABLE}.metrics__accrual__last_touch__7.revenue ;;
    group_label: "Metrics Accrual Last Touch 7"
    group_item_label: "Revenue"
  }
  dimension: metrics__accrual__last_touch__7__spend {
    type: number
    sql: ${TABLE}.metrics__accrual__last_touch__7.spend ;;
    group_label: "Metrics Accrual Last Touch 7"
    group_item_label: "Spend"
  }
  dimension: metrics__cash__first_touch__30__goal_completions {
    hidden: yes
    sql: ${TABLE}.metrics__cash__first_touch__30.goal_completions ;;
    group_label: "Metrics Cash First Touch 30"
    group_item_label: "Goal Completions"
  }
  dimension: metrics__cash__first_touch__30__impressions {
    type: number
    sql: ${TABLE}.metrics__cash__first_touch__30.impressions ;;
    group_label: "Metrics Cash First Touch 30"
    group_item_label: "Impressions"
  }
  dimension: metrics__cash__first_touch__30__revenue {
    type: number
    sql: ${TABLE}.metrics__cash__first_touch__30.revenue ;;
    group_label: "Metrics Cash First Touch 30"
    group_item_label: "Revenue"
  }
  dimension: metrics__cash__first_touch__30__spend {
    type: number
    sql: ${TABLE}.metrics__cash__first_touch__30.spend ;;
    group_label: "Metrics Cash First Touch 30"
    group_item_label: "Spend"
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: tenant_id {
    type: string
    sql: ${TABLE}.tenant_id ;;
  }
  measure: count {
    type: count
  }
}

view: marketing_attribution_demo__metrics__cash__first_touch__30__goal_completions {

  dimension: goal_type {
    type: string
    sql: ${TABLE}.goal_type ;;
  }
  dimension: goal_value {
    type: number
    sql: ${TABLE}.goal_value ;;
  }
}

view: marketing_attribution_demo__metrics__accrual__last_touch__7__goal_completions {

  dimension: goal_type {
    type: string
    sql: ${TABLE}.goal_type ;;
  }
  dimension: goal_value {
    type: number
    sql: ${TABLE}.goal_value ;;
  }
}
