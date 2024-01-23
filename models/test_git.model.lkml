connection: "bigqueryntt"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: test_git_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_git_default_datagroup

explore: sales {
  join: date {
    type: left_outer 
    sql_on: ${sales.date_id} = ${date.date_id} ;;
    relationship: many_to_one
  }
}

explore: date {}

explore: products {}

explore: client_id {}

explore: regions {}

explore: categories {}

