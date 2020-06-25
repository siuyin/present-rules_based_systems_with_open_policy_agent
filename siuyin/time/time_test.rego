package siuyin.time

test_year {
  year(parse_time("2020-06-01")) == 2020
  year(parse_time("2019-06-01")) == 2019
  year(parse_time("2021-06-01")) == 2021
}

test_birthday_in_current_year {
  birthday_in_current_year(parse_time("2020-06-01"),parse_time("2000-01-02")) 
    == parse_time("2020-01-02")
  birthday_in_current_year(parse_time("2019-06-01"),parse_time("2000-01-02"))
    == parse_time("2019-01-02")
  birthday_in_current_year(parse_time("2021-06-01"),parse_time("2000-01-02"))
    == parse_time("2021-01-02")
}

test_age {
  age(parse_time("2020-06-01"),"2000-06-01") == 20   # birthday is today!
  age(parse_time("2020-06-01"),"2000-05-31") == 20   # celebrated birthday yesterday
  age(parse_time("2020-06-01"),"2000-06-02") == 19   # birthday is tomorrow
}
