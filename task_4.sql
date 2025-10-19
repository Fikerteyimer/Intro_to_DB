-- Script: task_4.sql
-- This script prints the full description of the table BOOKS
-- from the database passed as an argument

SELECT 
    COLUMN_NAME AS 'Field',
    COLUMN_TYPE AS 'Type',
    IS_NULLABLE AS 'Null',
    COLUMN_KEY AS 'Key',
    COLUMN_DEFAULT AS 'Default',
    EXTRA AS 'Extra'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'books';
