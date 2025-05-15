connection: "argolis"

include: "/Leads/*.view.lkml"

explore: all_client_leads {
  access_filter: {
    user_attribute: client_name
    field: client_id
  }
}

explore: client_leads {}
