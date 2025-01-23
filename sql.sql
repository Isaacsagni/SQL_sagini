WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER () OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) as row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num>1;

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions
               ORDER BY company
           ) AS row_num
    FROM layoffs_staging
)
DELETE 
FROM layoffs_staging
WHERE ROW_NUMBER() OVER (
               PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions
);
