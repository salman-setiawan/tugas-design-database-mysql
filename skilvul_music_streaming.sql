-- Create Database --
create database skilvulmusic;

-- Go to Database --
use skilvulmusic;

-- Create Table User --
create table `user` (
  `user_id` int not null auto_increment primary key,
  `name` varchar(50) not null default '',
  `email` varchar(50) not null default '',
  `password` varchar(50) not null default ''
);

-- Create Table Singer --
create table `singer` (
  `user_id` int not null auto_increment primary key,
  `name` varchar(50) not null default ''
);

-- Create Table Album --
create table `album` (
  `album_id` int(10) null,
  `name` varchar(50) not null default '' collate 'utf8_general_ci',
  primary key ('album_id') using btree
);

-- Create Table Track --
create table `user` (
  `track_id` int(10) not null auto_increment primary key,
  `title` varchar(50) not null default collate 'utf8_general_ci',
  `singer` varchar(50) not null,
  `album` varchar(50) not null,
  constraint `album` foreign key (`album`) references `music_player`.`album` (`album_id`) on update cascade on delete cascade,
  constraint `singer` foreign key (`singer`) references `music_player`.`singer` (`singer_id`) on update cascade on delete cascade
);

-- Create Table Playlist --
create table `playlist` (
  `playlist_id` int(10) not null auto_increment primary key,
  `name` varchar(50) not null default collate 'utf8_general_ci',
  `user_id` varchar(50) not null,
  constraint `user` foreign key (`user_id`) references `user` (`user_id`) on update cascade on delete cascade
);

-- Create Table Playlist_Track --
create table `playlist_track` (
  `playlist_id` int(10) not null auto_increment primary key,
  `track_id` varchar(50) not null default collate 'utf8_general_ci',
  constraint `playlist` foreign key (`playlist_id`) references `music_player` (`playlist_id`) on update cascade on delete cascade,
  constraint `track` foreign key (`track_id`) references `track` (`track_id`) on update cascade on delete cascade
);
