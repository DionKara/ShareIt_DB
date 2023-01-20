SELECT video_category.category, video.title, video_popularity.views
FROM video
	JOIN video_category ON video.video_id = video_category.video_id
	LEFT JOIN video_popularity ON video_category.video_id = video_popularity.video_id
WHERE video_category.category = 'Funny';