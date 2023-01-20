SELECT video.channel_id AS channel_id, AVG(video_popularity.views) AS avgViews
FROM video
	JOIN video_popularity ON video.video_id = video_popularity.video_id
GROUP BY video.channel_id