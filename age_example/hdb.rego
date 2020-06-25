package hdb

import data.siuyin.time as st

default age_eligible = false
age_eligible {
  ad := st.parse_time(input.application_date)
  age := st.age(ad, input.applicants[_].applicant.date_of_birth)
  age >= data.minimum_age
}
