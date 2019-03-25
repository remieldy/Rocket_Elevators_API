SELECT extract(YEAR FROM date_of_creation) AS YEAR, extract(MONTH FROM date_of_creation) AS MONTH, COUNT(contact_id)
FROM      factcontact
GROUP BY  YEAR, MONTH
ORDER BY  YEAR, MONTH