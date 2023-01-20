SELECT video.title, video.duration
FROM video
	JOIN playlist_consists_of_videos ON video.video_id = playlist_consists_of_videos.video_id
WHERE add_date > '2010-09-2' AND playlist_id = 'PL1';