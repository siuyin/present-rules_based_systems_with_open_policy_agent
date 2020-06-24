package hdb

default at_least_two_citizens_or_a_citizen_and_a_pr = false

# 2 citizen case
at_least_two_citizens_or_a_citizen_and_a_pr {
  some i,j
  input.applicants[i].applicant.resident_status == "citizen"
  input.applicants[j].applicant.resident_status == "citizen"
  i != j
}
# a citizen and a pr case
at_least_two_citizens_or_a_citizen_and_a_pr {
  some i,j
  input.applicants[i].applicant.resident_status == "pr"
  input.applicants[j].applicant.resident_status == "citizen"
  i != j
}
