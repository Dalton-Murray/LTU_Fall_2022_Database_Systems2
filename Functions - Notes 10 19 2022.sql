-- SELECT CONCAT_WS(", ", "Hello", "World") as helloWorld;

-- SELECT trim(both "*" FROM "***John Smith***") as name;

-- SELECT * FROM ap.vendors
-- WHERE lower(vendor_name) = "JobTrak";

-- SET @x = 5;
-- SET @y = 10;
-- SELECT @x := 5 as variable;
-- SELECT @x + @y as addition;

-- SELECT SUBSTRING("(517)-582-3398", 7, 3) as numWithoutArea;
SELECT SUBSTRING_INDEX("www.ltu.edu", ".", -1);