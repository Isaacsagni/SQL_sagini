
SELECT *,
    ROW_NUMBER() OVER (PARTITION BY company, location, industry, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs;
