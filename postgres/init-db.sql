--
-- can be used to initialize postgres when being installed
-- such as seeding databases, creating objects, etc.
--
-- only runs once ~ I.e. not each time docker starts the container!
--

SELECT datname
FROM pg_catalog.pg_database
ORDER BY datname;
