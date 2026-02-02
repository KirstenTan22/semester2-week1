-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 chinook.sqlite
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit

-- 1. List all tracks along with their album title and artist name.
SELECT Track.*, Album.Title, Artist.Name FROM Track JOIN Album ON Track.AlbumId = Album.AlbumId JOIN Artist ON Album.ArtistId = Artist.ArtistId;

-- 2. List all albums along with the name of the artist.
SELECT Album.*, Artist.Name FROM Album JOIN Artist on Album.ArtistId = Artist.ArtistId;

-- 3. For each genre, list the number of tracks available.
SELECT Genre.Name, Count(*) FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId GROUP BY Track.GenreId;

-- 4. List the total duration (milliseconds) of tracks per genre.
SELECT Genre.Name, SUM(milliseconds) FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId GROUP BY Track.GenreId;

-- 5. For each media type, count the number of tracks.
SELECT MediaType.Name, Count(*) FROM Track JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId GROUP BY MediaType.MediaTypeId;

-- 6. Find the total number of tracks per album.
SELECT Album.Title, Count(*) FROM Track JOIN Album ON Track.AlbumId = Album.AlbumId GROUP BY Track.AlbumId;

-- 7. Find the average price of tracks per genre.
SELECT Genre.Name, AVG(Track.UnitPrice) FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId GROUP BY Track.GenreId;

-- 8. List all tracks along with genre, album, and artist name.
SELECT Track.*, Genre.Name, Album.Title, Artist.Name FROM Track 
JOIN Genre ON Track.GenreId = Genre.GenreID 
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId;

-- 9. Find the top 5 albums with the most tracks.
SELECT Album.Title, COUNT(*) FROM Track JOIN Album ON Track.AlbumId = Album.AlbumId GROUP BY Track.AlbumId ORDER BY Count(*) DESC LIMIT 5;

-- 10. Find the top 5 artists with the most albums.
SELECT Artist.Name, Count(*) FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId GROUP BY Album.ArtistId ORDER BY Count(*) DESC LIMIT 5;

-- 11. For each genre, find the total revenue generated from sales.
SELECT Genre.Name, SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) 
FROM Genre
    LEFT JOIN Track ON Genre.GenreId = Track.GenreId 
    LEFT JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Genre.GenreId, Genre.Name;

-- 12. Find the top 5 genres by total revenue.
SELECT Genre.Name, SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) as TotalRevenue 
FROM Genre
    LEFT JOIN Track ON Genre.GenreId = Track.GenreId 
    LEFT JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Genre.GenreId, Genre.Name
ORDER BY TotalRevenue DESC LIMIT 5;

-- 13. For each artist, calculate the total number of tracks sold and total revenue from sold tracks.
SELECT Artist.Name, COUNT(InvoiceLine.InvoiceLineId) AS '#TracksSold', SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) as TotalRevenue
FROM Artist 
    LEFT JOIN Album on Artist.ArtistId = Album.ArtistId 
    LEFT JOIN Track on Album.AlbumId = Track.AlbumId
    LEFT JOIN InvoiceLine on Track.TrackId = InvoiceLine.TrackId
GROUP BY Artist.ArtistId, Artist.Name;

-- 14. List albums with at least one track sold and total revenue from sold tracks.
SELECT Album.Title, COUNT(InvoiceLine.InvoiceLineId), SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity)
FROM Album
    JOIN Track on Album.AlbumId = Track.AlbumId
    JOIN InvoiceLine on Track.TrackId = InvoiceLine.TrackId
GROUP BY Album.AlbumId, Album.Title;

-- 15. Find the top 5 artists by total revenue.
SELECT Artist.Name, SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) as TotalRevenue
FROM Artist
    LEFT JOIN Album on Artist.ArtistId = Album.ArtistId
    LEFT JOIN Track on Album.AlbumId = Track.AlbumId
    LEFT JOIN InvoiceLine on Track.TrackId = InvoiceLine.TrackId
GROUP BY Artist.ArtistId, Artist.Name
ORDER BY TotalRevenue DESC LIMIT 5;

-- 16. For each media type, calculate the total revenue generated from tracks that have been sold.
SELECT MediaType.Name, SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) as TotalRevenue
FROM MediaType
    LEFT JOIN Track on MediaType.MediaTypeId = Track.MediaTypeId
    LEFT JOIN InvoiceLine on Track.TrackId = InvoiceLine.TrackId
GROUP BY MediaType.MediaTypeId, MediaType.Name;

-- 17. For each genre, find the average track price and total number of tracks.
SELECT Genre.Name, AVG(Track.UnitPrice), COUNT(Track.TrackId)
FROM Genre
    LEFT JOIN Track on Genre.GenreId = Track.GenreId
GROUP BY Genre.GenreId, Genre.Name;

-- 18. List the 10 tracks sold in the smallest quantities (tracks with at least one sale).
SELECT Track.Name

-- 19. Find the top 10 tracks by total revenue.
-- 20. For each artist, find the average track price and total number of tracks sold.
