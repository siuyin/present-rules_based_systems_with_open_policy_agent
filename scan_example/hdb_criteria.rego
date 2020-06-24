package hdb

default at_least_one_citizen = false
at_least_one_citizen {
  input.applicants[_].applicant.resident_status == "citizen"
}
