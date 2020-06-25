# 10 OMIT
package siuyin.time

# age returns the age in years (integer), 
# given a specified time, t (nanoseconds since epoch), and
# a date of birth, dob (string yyyy-mm-dd).
age(t, dob) = x {
  bt := parse_time(dob)
  bcy := birthday_in_current_year(t,bt)
  t >= bcy    # celebrated birthday this year
  x := year(t) - year(bt)
}
age(t, dob) = x {
  bt := parse_time(dob)
  bcy := birthday_in_current_year(t,bt)
  t < bcy     # yet to celebrate birthday
  x := year(t) - year(bt) -1
}
# 20 OMIT
parse_time(dob) = x {
  # 2006-01-02 is Go's time format, see https://golang.org/pkg/time/#Time.Format
  x := time.parse_ns("2006-01-02",dob)
}

birthday_in_current_year(current_time,birth_time) = x {
  cy := year(current_time)
  bymd := time.date(birth_time)   # time.date returns [year, month, day]
  x := parse_time(sprintf("%04d-%02d-%02d",[ cy, bymd[1], bymd[2] ]))
}

year(t) = x {
  x := time.date(t)[0]
}
# 30 OMIT
