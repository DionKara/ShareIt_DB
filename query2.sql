DROP TEMPORARY TABLE IF EXISTS t1;
DROP TEMPORARY TABLE IF EXISTS t2;
CREATE TEMPORARY TABLE t1 AS SELECT * FROM video_popularity WHERE views > 3;
CREATE TEMPORARY TABLE t2 AS SELECT * FROM t1 WHERE likes > 1; 
SELECT t2.views, t2.likes, video.title  
FROM t2
	JOIN video ON t2.video_id = video.video_id
WHERE dislikes < 3 OR dislikes IS NULL;
