package hdb

test_at_least_two_citizens_or_a_citizen_and_a_pr {
  at_least_two_citizens_or_a_citizen_and_a_pr with input as
  {"applicants":[
    {"applicant":{"resident_status":"citizen"}},
    {"applicant":{"resident_status":"citizen"}}
  ]}

  at_least_two_citizens_or_a_citizen_and_a_pr with input as
  {"applicants":[
    {"applicant":{"resident_status":"citizen"}},
    {"applicant":{"resident_status":"other"}},
    {"applicant":{"resident_status":"pr"}}
  ]}

  not at_least_two_citizens_or_a_citizen_and_a_pr with input as
  {"applicants":[
    {"applicant":{"resident_status":"other"}},
    {"applicant":{"resident_status":"pr"}}
  ]}
}
