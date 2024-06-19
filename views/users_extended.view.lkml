include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
view: users_extended {
  sql_table_name: `ecomm.users`  ;;
  drill_fields: [id]
  extends: [users]

dimension: id_extended {
#  primary_key: yes
  type: number
  sql: ${TABLE}.id ;;
  label: " 🚗 User ID  Group Extended🚎 "
  description: "This is a grouping of users 🚍"
}

measure: count_extended {
  type: count
}

parameter: big_search_filter {   #testing BQ Big Search ... see .mdl
  type: number
}

measure: count_liquid {
  type: number
  sql:
   {% if big_search_filter._in_query %}
     {% parameter big_search_filter %}
  {% else %}
      00
  {% endif %} ;;
}

}
