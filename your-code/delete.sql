USE mysql_lab;
-- I had already changed the VIN vecause I Set the field as Unique so error popped when I was creating the table.
-- Howecer, I will still delet the record for the purpose of this challenge
DELETE FROM Cars
WHERE ID = 4;