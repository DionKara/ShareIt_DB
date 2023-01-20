CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpass'; 
GRANT ALL PRIVILEGES ON mydb.* TO 'admin'@'localhost';

CREATE USER 'employee'@'localhost' IDENTIFIED BY 'employeepass';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.* TO 'employee'@'localhost';

CREATE USER 'advertiser'@'%' IDENTIFIED BY 'advertiserpass';
GRANT SELECT ON mydb.video_popularity TO 'advertiser'@'%';
GRANT SELECT ON mydb.advertisement_in_videos TO 'advertiser'@'%';
GRANT SELECT ON mydb.ad TO 'advertiser'@'%';
GRANT SELECT ON mydb.video_has_ad TO 'advertiser'@'%';
GRANT SELECT ON mydb.user_reacts_video TO 'advertiser'@'%';
GRANT SELECT ON mydb.video_category TO 'advertiser'@'%';

CREATE USER 'user_channel'@'localhost' IDENTIFIED BY 'user_channel_password'; 
CREATE USER 'user_channel'@'%' IDENTIFIED BY 'user_channel_password'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.channel TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.channel TO 'user_channel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.photo TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.photo TO 'user_channel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.playlist TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.playlist TO 'user_channel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.playlist_consists_of_videos TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.playlist_consists_of_videos TO 'user_channel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.user TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.user TO 'user_channel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.user_reacts_video TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.user_reacts_video TO 'user_channel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.user_sex TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.user_sex TO 'user_channel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.video TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.video TO 'user_channel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.video_quality TO 'user_channel'@'localhost'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.video_quality TO 'user_channel'@'%';