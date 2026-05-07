connection: "argolis"

include: "/streaming_platform/views/**/*.view.lkml"
include: "/streaming_platform/dashboards/*.dashboard.lookml"

explore: sessions {
  access_filter: {
    user_attribute: creator_id
    field: creator_id
  }
  join: users {
    type: left_outer
    sql_on: ${sessions.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }

  join: broadcasts {
    type: left_outer
    sql_on: ${sessions.broadcast_id} = ${broadcasts.broadcast_id} ;;
    relationship: many_to_one
  }

  join: tips {
    type: left_outer
    sql_on: ${sessions.session_id} = ${tips.session_id} ;;
    relationship: one_to_many
  }

  join: creators {
    type: left_outer
    sql_on: ${sessions.creator_id} = ${creators.creator_id} ;;
    relationship: many_to_one
  }
  # join: tipper_platform_activity {
  #   type: full_outer
  #   sql_on: ${sessions.session_start_day_of_week} = ${tipper_platform_activity.tip_time_day_of_week} AND ${sessions.session_start_hour_of_day} = ${tipper_platform_activity.tip_time_hour_of_day} ;;
  #   relationship: many_to_one
  # }
  join: tipper_platform_activity {
    type: full_outer
    sql_on: EXTRACT(DAYOFWEEK FROM ${sessions.session_start_raw}) = ${tipper_platform_activity.day_of_week_index}
      AND EXTRACT(HOUR FROM ${sessions.session_start_raw}) = ${tipper_platform_activity.hour_of_day} ;;
    relationship: many_to_one
  }

}
