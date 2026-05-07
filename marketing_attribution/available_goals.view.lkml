view: available_goals {
  derived_table: {
    # We query the arrays directly to get a distinct list of all historical goal types
    sql:
      SELECT DISTINCT goal.goal_type
      FROM ${marketing_attribution_demo.SQL_TABLE_NAME},
      UNNEST(metrics__accrual__last_touch__7.goal_completions) as goal

      UNION DISTINCT

      SELECT DISTINCT goal.goal_type
      FROM ${marketing_attribution_demo.SQL_TABLE_NAME},
      UNNEST(metrics__cash__first_touch__30.goal_completions) as goal
    ;;
  }

  dimension: goal_type {
    type: string
    sql: ${TABLE}.goal_type ;;
    hidden: no
  }
}
