CREATE DATABASE IF NOT EXISTS symfony;

USE symfony;

CREATE TABLE users (
    id          int(255) auto_increment not null,
    role        varchar(20),
    name        varchar(255),
    subname     varchar(255),
    email       varchar(255),
    password    varchar(255),
    image       varchar(255),
    create_at   datetime,
    CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;


CREATE TABLE videos (
    id          int(255) auto_increment not null,
    user_id     int(255) not null,
    title       varchar(255),
    description text,
    status      varchar(20),
    image       varchar(255),
    video_path  varchar(255),
    create_at   datetime DEFAULT NULL,
    updated_at datetime DEFAULT NULL,
    CONSTRAINT pk_videos PRIMARY KEY(id),
    CONSTRAINT fk_videos_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;


CREATE TABLE comments (
    id          int(255) auto_increment not null,
    video_id     int(255) not null,
    user_id     int(255) not null,
    body        text,
    create_at   datetime DEFAULT NULL,
    CONSTRAINT pk_comment PRIMARY KEY(id),
    CONSTRAINT fk_comment_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_comment_video FOREIGN KEY(video_id) REFERENCES videos(id)
)ENGINE=InnoDb;
