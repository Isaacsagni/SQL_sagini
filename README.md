Explanation of the key parts of the query:

CTE Definition (duplicate_cte): This part creates a temporary result set using a Common Table Expression (CTE) to identify rows that have the same values in specified columns.
ROW_NUMBER(): This function assigns a unique number to each row within the partitioned set of data, which helps in identifying duplicates. The PARTITION BY clause defines which columns are used to group the rows.
Final SELECT Statement: The outer query retrieves rows where the row number is greater than 1, indicating those rows are duplicates.
