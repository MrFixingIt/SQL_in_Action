-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon
-- LIKE THIS
-- SELECT * FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Find out how many rows are in the table "final_airbnb"
-- EXPECTED OUTPUT: 146

-- ---------- SOLUTION ----------
-- SELECT COUNT(id) as Number_of_rows
-- FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Find out the name of the host for "host_id" 63613
-- HINT: "Where" could it be?
-- EXPECTED OUTPUT: Patricia

-- ---------- SOLUTION ----------
-- SELECT host_name FROM final_airbnb
-- WHERE host_id = 63613;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Query the data to just show the unique neighbourhoods listed
-- HINT: This is a "distinct" operation...
-- EXPECTED OUTPUT: 40 neighbourhoods listed

-- ---------- SOLUTION ----------
-- SELECT distinct neighbourhood
-- FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Find both the highest price listing and the lowest price listing, displaying the entire row for each
-- HINT: This can be two different queries.
-- FOOD FOR THOUGHT: Think about the results. Are the high and low prices outliers in this data set?
-- EXPECTED OUTPUT: Highest = 785, Lowest = 55

-- ---------- SOLUTIONS ----------
-- SELECT * FROM final_airbnb
-- WHERE price = (SELECT MAX(price) FROM final_airbnb);

-- SELECT * FROM final_airbnb
-- WHERE price = (SELECT MIN(price) FROM final_airbnb);

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Find the average availability for all listings in the data set (using the availability_365 column)
-- HINT: Aggregates are more than just big rocks...
-- EXPECTED OUTPUT: 165.3904

-- ---------- SOLUTION ----------
-- SELECT AVG(availability_365) FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Find all listings that do NOT have a review
-- HINT: There are a few ways to go about this. Remember that an empty cell is "no value", but not necessarily NULL
-- EXPECTED OUTPUT: 6 rows

-- ---------- SOLUTION ----------
-- SELECT * FROM final_airbnb
-- WHERE number_of_reviews = 0;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 
-- HINT: Sorting is your friend!
-- EXPECTED OUTPUT: 58059

-- ---------- SOLUTION ----------
-- SELECT id FROM final_airbnb
-- WHERE room_type = "Private room"
-- AND number_of_reviews = (SELECT MAX(number_of_reviews) FROM final_airbnb);

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>> DONE?
-- Find the most popular neighbourhood for listings 
-- HINT: Look for which neighbourhood appears most frequently in the neighbourhood column
-- HINT: You are creating "summary rows" for each neighbourhood, so you will just see one entry for each neighbourhood
-- EXPECTED OUTPUT: Williamsburg
-- INVESTIGATE: Should Williamsburg be crowned the most popular neighbourhood?

-- ---------- HELPFUL EXAMPLES ----------
-- SELECT DISTINCT neighbourhood AS all_neighbourhoods FROM final_airbnb (40 rows returned)
-- MAX(number_of_appearances)

-- ---------- SOLUTION ----------
-- SELECT neighbourhood, COUNT(neighbourhood) as number_of_appearances
-- FROM final_airbnb
-- GROUP BY neighbourhood
-- ORDER BY number_of_appearances DESC
-- LIMIT 40;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with a minimum_nights value of less than 7
-- HINT: Sorting is still your friend! So are constraints.
-- EXPECTED OUTPUT: 58059

-- ---------- HELPFUL EXAMPLE ----------
-- SELECT id FROM final_airbnb
-- WHERE room_type = "Private room"
-- AND number_of_reviews = (SELECT MAX(number_of_reviews) FROM final_airbnb)

-- ---------- SOLUTION ----------
-- SELECT id FROM final_airbnb
-- WHERE minimum_nights < 7
-- AND reviews_per_month = (SELECT MAX(reviews_per_month) FROM final_airbnb);

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>> DONE
-- Find out which host has the most listings. 
-- Create a NEW column that will show a calculation for how many listings the host for each listing has in the table
-- Display the column using aliasing.
-- HINT: Work this one step at a time. See if you can find a way to just display the count of listings per host first.
-- EXPECTED OUTPUT: The Box House Hotel with 6 listings

-- ---------- HELPFUL EXAMPLE ----------
-- SELECT city, population FROM north_american_cities
-- WHERE country LIKE "United States"
-- ORDER BY population DESC
-- LIMIT 2 OFFSET 2;

-- ---------- SOLUTION ----------
-- SELECT host_name, COUNT(host_name) as number_of_listings
-- FROM final_airbnb
-- GROUP BY host_name
-- ORDER BY number_of_listings DESC
-- LIMIT 1;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 11 >>>>>>>>>>>>>>>>>>>>>>>
-- <<<<<<<<<<<<<<<<<<<<<<< WRAP UP >>>>>>>>>>>>>>>>>>>>>>>>>
-- What do you think makes a successful AirBnB rental in this market? What factors seem to be at play the most?
-- Write a few sentences and include them with your project submission in the README file 
-- On Problem #7, I did SO MUCH research try to figure out how to query two different conditions inside of one query just to find out that all I needed was "AND". Once upon a time, that would have frustrated me greatly. But now, I find it very funny.

-- <<<<<<<<<<<<<<<<<<<<< ** BONUS ** >>>>>>>>>>>>>>>>>>>>>>>
-- Find the percent above or below each listing is compared to the average price for all listings.
-- HINT: No hints! It's a bonus for a reason :)


