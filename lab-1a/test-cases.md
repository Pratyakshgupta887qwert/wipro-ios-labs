
# Swift Lab-1: Test Cases

## Student Grade Calculator

| Test | Subject Marks (5 subjects) | Attendance | Expected Result |
|---|---|---:|---|
| TC-01 | 100, 100, 100, 100, 100 | 100% | PASS, A+ |
| TC-02 | 80, 80, 80, 80, 80 | 90% | PASS, A |
| TC-03 | 70, 70, 70, 70, 70 | 85% | PASS, B |
| TC-04 | 60, 60, 60, 60, 60 | 80% | PASS, C |
| TC-05 | 50, 50, 50, 50, 50 | 75% | PASS, D |
| TC-06 | 34, 80, 80, 80, 80 | 90% | FAIL, F |
| TC-07 | 0, 0, 0, 0, 0 | 100% | FAIL, F |
| TC-08 | 90, 90, 90, 90, 90 | 74% | FAIL, A+ |
| TC-09 | 100, 100, 100, 100, 100 | 120% | Invalid attendance rejected |
| TC-10 | 101, 80, 80, 80, 80 | 90% | Invalid marks rejected |

## Validation Rules

1. Subject marks must be between 0 and 100.
2. Attendance must be between 0 and 100.
3. A student must score at least 35 in every subject.
4. Minimum required attendance is 75%.
5. Both marks and attendance conditions must be satisfied to pass.

## Grade Criteria

| Percentage | Grade |
|---|---|
| 90-100 | A+ |
| 80-89.99 | A |
| 70-79.99 | B |
| 60-69.99 | C |
| 50-59.99 | D |
| Below 50 | F |
