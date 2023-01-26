CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "course_video" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "courses_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "course_video_categories" (
  "id" serial PRIMARY KEY,
  "course_video_id" uuid NOT NULL,
  "categories_id" int NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "course_video_categories" ADD FOREIGN KEY ("course_video_id") REFERENCES "course_video" ("id");

ALTER TABLE "course_video_categories" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

insert into users (
id,
first_name,
last_name,
email,
"password",
age) values ('08ff8e99-85f3-44a5-b91a-af1c7df6fb19',
'Maria',
'Zambrano',
'mariaz@gmail.com',
'maria.2343',
23),(
'29d2ec5d-f250-4f41-b9ef-c96249a79fd4',
'Alejandro',
'Perez',
'aleperez@gmail.com',
'prez.2567',
21)

select * from users;

insert into courses (
title,
description,
"level",
teacher,
user_id) values(
'fundamentos',
'curso donde se aprende lo basico para el desarrollo web',
1,
'Brenda Gonzales',
'08ff8e99-85f3-44a5-b91a-af1c7df6fb19'),(
'React',
'curso donde se aprende a programar con la biblioteca de React',
2,
'Rafael Gommez',
'29d2ec5d-f250-4f41-b9ef-c96249a79fd4')

insert into course_video (
id,
title,
url,
courses_id) values (
'4686a583-0e2c-441c-8965-feb11b0aaab0',
'Aprendiendo HTML',
'youtube.com/gufnbjfnbjd',
1),(
'42cc2a36-2d95-464f-851c-1cb4feb4184a',
'Como hacer un ecommerce con html y css',
'youtube.com/fjbvcfghjk',
1),(
'997011cc-b28e-4ddb-ad81-04a8925347d0',
'Bootstrap con react',
'youtube.com/vgvcghjvcgh',
2)

insert into categories (name) values 
('HTML'),
('CSS'),
('Javascript'),
('React'),
('Json'),
('Express'),
('Nodejs')

insert into course_video_categories
(course_video_id, categories_id) values 
('4686a583-0e2c-441c-8965-feb11b0aaab0',
1),
('4686a583-0e2c-441c-8965-feb11b0aaab0',
3),
('42cc2a36-2d95-464f-851c-1cb4feb4184a',1),
('42cc2a36-2d95-464f-851c-1cb4feb4184a',2),
('997011cc-b28e-4ddb-ad81-04a8925347d0',3),
('997011cc-b28e-4ddb-ad81-04a8925347d0',4)

select * from users inner join courses on users.id=courses.user_id;

select * from users inner join courses on users.id=courses.user_id
inner join course_video on courses.id=course_video.courses_id 
inner join course_video_categories on course_video.id= course_video_categories.course_video_id
inner join categories  on course_video_categories.categories_id = categories.id