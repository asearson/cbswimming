view: cbswimming_txn {
  sql_table_name: cbswimming.cbswimming_txn ;;

  dimension: activity {
    type: string
    sql: ${TABLE}.activity ;;
  }

  dimension: activity_category {
    type: string
    sql: ${TABLE}.activity_category ;;
  }

  dimension: activity_id {
    type: number
    sql: ${TABLE}.activity_id ;;
  }

  dimension: address_1 {
    type: string
    sql: ${TABLE}.address_1 ;;
  }

  dimension: address_2 {
    type: string
    sql: ${TABLE}.address_2 ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cust_id {
    type: number
    sql: ${TABLE}.cust_id ;;
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: payer_address_1 {
    type: string
    sql: ${TABLE}.payer_address_1 ;;
  }

  dimension: payer_address_2 {
    type: string
    sql: ${TABLE}.payer_address_2 ;;
  }

  dimension: payer_city {
    type: string
    sql: ${TABLE}.payer_city ;;
  }

  dimension: payer_email {
    type: string
    sql: ${TABLE}.payer_email ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.txn_date ;;
  }

  dimension: withdraw_reason {
    type: string
    sql: ${TABLE}.withdraw_reason ;;
  }

  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }
}
