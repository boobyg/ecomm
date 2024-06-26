view: products {
  sql_table_name: `ecomm.products`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: category_image {
    type: string
    sql: ${TABLE}.category;;
#    html: <img src="https://storage.cloud.google.com/boris_ramp_test_co/{{value}}/Valeo.png" width="100" /> ;;
#    html: <img src="https://storage.cloud.google.com/boris_ramp_test_co/Looker.png" width="100" /> ;;
    html:
    {% if value == 'Jeans' %}
        <img src="https://storage.cloud.google.com/boris_ramp_test_co/product_category/{{value}}.webp" width="100" />
    {% else %}
        <img src="https://storage.cloud.google.com/boris_ramp_test_co/Looker.png" width="100" />
    {% endif %} ;;
  }

  dimension: null_value {
#    type: count_distinct
    sql: null ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }
}
