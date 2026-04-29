connection: "argolis"

include: "/streaming_platform/*.view.lkml"
include: "/streaming_platform/*.dashboard.lookml"

explore: sessions {
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
}
