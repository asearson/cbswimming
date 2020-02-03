view: cbswimming_txn {
  derived_table: {
    sql: SELECT
        txn.*,
        row_number() over (partition by txn.cust_id,txn.activity_category,extract(year from txn.txn_date) order by txn.txn_date) as txn_order
      FROM
        `ferrous-pact-266018.cbswimming.cbswimming_txn` as txn ;;
  }

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

  dimension: name {
    type: string
    sql: CONCAT(${TABLE}.first_name, " ", ${TABLE}.last_name) ;;
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

  dimension: txn_order {
    type: number
    sql: ${TABLE}.txn_order ;;
  }

  dimension: withdraw_reason {
    type: string
    sql: ${TABLE}.withdraw_reason ;;
  }

  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  measure: minimum_age {
    type: min
    sql: ${age} ;;
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  measure: individual_count {
    type: count_distinct
    sql:  ${name} ;;
  }

#   measure: nameageunique {
#     type: string
#     sql: CONCAT(${TABLE}.first_name, " ", ${TABLE}.last_name, ${TABLE}.age, ${transaction_year}) ;;
#   }
}
