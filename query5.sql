DROP TEMPORARY TABLE IF EXISTS t5;
CREATE TEMPORARY TABLE t5 AS SELECT MAX(likes) AS maxlikes FROM video_popularity;
SELECT video_popularity.video_id, t5.maxlikes 
FROM video_popularity 
	JOIN t5 ON video_popularity.likes = t5.maxlikes;