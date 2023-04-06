/*In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
Using the rental table, find out how many rentals were processed by each employee.
Using the film table, find out how many films were released each year.
Using the film table, find out for each rating how many films were there.
What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
Which kind of movies (rating) have a mean duration of more than two hours?
Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.*/

SELECT last_name, COUNT(*)  as count
FROM actor
GROUP BY last_name
HAVING count = 1;
-- got only unique last name by using having clause

SELECT last_name, COUNT(*) as count
FROM actor
GROUP BY last_name
HAVING count > 1;
-- 

SELECT staff_id, COUNT(*) AS rental_count
FROM rental
GROUP BY staff_id
ORDER BY rental_count DESC;
-- total no of oders processed by each employ

select release_year, count(*) from film
group by release_year;

Select rating, count(*) from film
group by rating;

SELECT rating, ROUND(AVG(length), 2) AS mean_length
FROM film
GROUP BY rating;

SELECT rating FROM film
GROUP BY rating
having avg(length) > 120;

SELECT title, length, RANK() OVER (ORDER BY length DESC) AS rank_of_movies
FROM film
WHERE length IS NOT NULL AND length > 0;



