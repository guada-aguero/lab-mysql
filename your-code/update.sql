USE mysql_lab;

-- Update Salesperson table to correct the misspelling of 'Miami'
UPDATE Salesperson
SET Store = 'Miami'
WHERE ID = 4;

-- Update Customers table with the correct email addresses
UPDATE Customers
SET Email = 'ppicasso@gmail.com'
WHERE ID = 0;

UPDATE Customers
SET Email = 'lincoln@us.gov'
WHERE ID = 1;

UPDATE Customers
SET Email = 'hello@napoleon.me'
WHERE ID = 2;