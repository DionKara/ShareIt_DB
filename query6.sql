DROP TEMPORARY TABLE IF EXISTS t3;
DROP TEMPORARY TABLE IF EXISTS t4;
CREATE TEMPORARY TABLE t3 AS SELECT MAX(dislikes) AS maxdis FROM video_popularity;
CREATE TEMPORARY TABLE t4 AS SELECT video_popularity.video_id FROM video_popularity JOIN t3 ON video_popularity.dislikes = t3.maxdis;
SELECT user_reacts_video.comment, user_reacts_video.user_id
FROM user_reacts_video
	JOIN t4 ON user_reacts_video.video_id = t4.video_id;