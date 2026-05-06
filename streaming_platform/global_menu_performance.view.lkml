view: global_menu_performance {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.tipper_interest_agg` ;;

  dimension: menu_item {
    primary_key: yes
    type: string
    sql: ${TABLE}.PARSED_TIP_OPTION_CLEAN ;;
  }

  dimension: median_price {
    type: number
    sql: ${TABLE}.MEDIAN_PRICE ;;
  }

  dimension: tippers {
    type: number
    sql: ${TABLE}.TIPPERS ;;
  }

  measure: global_tippers_count {
    type: sum
    sql: ${tippers} ;;
  }

  measure: global_median_price {
    type: median
    sql: ${median_price} ;;
  }

  measure: your_tippers_count {
    label: "Your Tippers Who Bought"
    type: sum
    sql: ${tippers} ;;
  }
}
