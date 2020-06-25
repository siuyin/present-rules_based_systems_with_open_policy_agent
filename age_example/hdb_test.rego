package hdb

test_age_eligible {
  age_eligible with input as
  {"application_date":"2020-06-01","applicants":[
    {"applicant":{"date_of_birth":"1999-06-01"}},  # 21 exactly
    {"applicant":{"date_of_birth":"2000-06-01"}},  # 20
  ]}

  age_eligible with input as
  {"application_date":"2020-06-01","applicants":[
    {"applicant":{"date_of_birth":"1998-06-01"}}   # 22
  ]}

  not age_eligible with input as
  {"application_date":"2020-06-01","applicants":[
    {"applicant":{"date_of_birth":"2000-06-02"}}   # 19
  ]}
}

