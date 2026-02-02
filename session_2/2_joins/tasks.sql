-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 social.db
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit

-- 1. List all posts that have been deleted.
SELECT * FROM posts WHERE deleted = 1;

-- 2. List all users whose usernames begin with 'a'.
SELECT * FROM users WHERE username LIKE 'a%'; 

-- 3. Find all posts and the usernames of those who posted them whose content contains the word "small".
SELECT * FROM posts JOIN users ON user_id = users.id WHERE content LIKE '%small%';

-- 4. Return each non-deleted post and the username of the person who wrote in, in date order.
SELECT posts.*, users.username FROM posts JOIN users ON posts.user_id = users.id WHERE deleted = 0 ORDER BY created_on ASC;

-- 5. For each user, return their username and the total number of posts they have made.
SELECT users.username, COUNT(posts.*) as TotalPosts FROM users LEFT JOIN posts on posts.user_id = users.id GROUP BY users.id, users.username;

-- 6. Modify the previous query to return only users who have authored more than 3 posts.
SELECT users.username, COUNT(posts.*) as TotalPosts FROM users JOIN posts on posts.user_id = users.id GROUP BY users.id, users.username;
 HAVING COUNT(*) > 3;

-- 7. For each user, return their username and the number of users they follow, including users who follow no one.
SELECT U.username, COUNT(F.followed_user_id) AS TotalFollowed FROM users U LEFT JOIN follows F ON u.id = F.following_user_id GROUP BY u.id, u.username;

-- 8. List the top 5 most-followed users.
SELECT U.username, COUNT(F.followed_user_id) as TotalFollowers FROM users U JOIN follows F ON U.id = F.followed_user_id GROUP BY U.id, U.username ORDER BY TotalFollowers DESC LIMIT 5;

-- 9. Return a list showing the username of the follower and the username of the followed user for each follow relationship.
SELECT U1.username as Follower, U2.username Followed FROM follows F JOIN users U1 ON U1.id = F.following_user_id JOIN users U2 ON U2.id = F.followed_user_id;

-- 10. For a given user (christopherprice), return all non-deleted posts written by users they follow, ordered from most recent to oldest.
SELECT * FROM users as U JOIN follows F ON U.id = F.following_user_id JOIN posts P ON F.followed_user_id = P.user_id WHERE U.username = 'christopherprice' AND P.deleted = 0 ORDER BY P.created_on DESC;