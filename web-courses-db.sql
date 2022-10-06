CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar UNIQUE NOT NULL,
  "age" integer,
  "country" varchar,
  "is_active" boolean DEFAULT false
);

CREATE TABLE "users_courses" (
  "user_id" uuid NOT NULL,
  "course_id" uuid NOT NULL,
  "course_percentage" float,
  "course_review" text
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text,
  "level" varchar,
  "teacher" varchar,
  "total_chapters" integer,
  "is_paid" boolean DEFAULT false,
  "pusblication_date" timestamp NOT NULL,
  "category_id" uuid NOT NULL
);

CREATE TABLE "course_video" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "duration" float,
  "total_students" integer,
  "course_id" uuid NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "users_roles" (
  "user_id" uuid NOT NULL,
  "role_id" uuid NOT NULL,
  "start_date_role" date NOT NULL
);

ALTER TABLE "course_video" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");


-- Add roles
insert into roles (
	id,
	name 
) 
values 
(
	'c9e104a3-e90a-40c9-9850-1bf67d2b4afa',
	'Administrador'
),
(
	'6cea6710-cc2c-4011-8dca-eb29ae45e5c7',
	'Profesor'
),
(
	'af2df4fe-eb01-4cc8-96ce-b4826be1ca8c',
	'Estudiante'
);

-- Informationa about user role
insert into users_roles (
	user_id,
  	role_id,
  	start_date_role 
) 
values 
(
	'a8d31ca0-6a4b-40cc-ba06-5e1d4a5c7d17',
	'6cea6710-cc2c-4011-8dca-eb29ae45e5c7',
	'2018-02-17'
),
(
	'a8d31ca0-6a4b-40cc-ba06-5e1d4a5c7d17', 
	'af2df4fe-eb01-4cc8-96ce-b4826be1ca8c',
	'2022-03-14'
),
(
	'514b244c-fd02-435a-afc0-b60add64a80e', 
	'af2df4fe-eb01-4cc8-96ce-b4826be1ca8c',
	'2019-11-18'
),
(
	'08e296fb-0a63-43a0-8c53-21396233d624', 
	'af2df4fe-eb01-4cc8-96ce-b4826be1ca8c',
	'2020-10-08'
),
(
	'ddfb0ee4-fea4-4e98-b1d3-5ac343e9151a',  
	'af2df4fe-eb01-4cc8-96ce-b4826be1ca8c',
	'2019-12-04'
),
(
	'63490483-76f9-4313-a796-96ca503c9dab', 
	'c9e104a3-e90a-40c9-9850-1bf67d2b4afa',
	'2017-04-24'
);

-- Add a user
insert into users (
	id,
  	name,
  	email,
  	password,
  	age,
  	country,
  	is_active
)
values
(
	'514b244c-fd02-435a-afc0-b60add64a80e',
	'Damián Cardoso Oropeza',
	'dacaor@gmail.com',
	'gt$h2#45Pre',
	25,
	'Perú',
	true
),
(
	'08e296fb-0a63-43a0-8c53-21396233d624',
	'José Álvarez Buollosa',
	'jabuo@hotmail.com',
	'Hy&#21wer{6',
	36,
	'Costa Rica',
	false
),
(
	'ddfb0ee4-fea4-4e98-b1d3-5ac343e9151a',
	'Rosa Carmona Tellez',
	'rocat@yahoo.com',
	'jy6%Qs#61$y',
	27,
	'México',
	true 
),
(
	'63490483-76f9-4313-a796-96ca503c9dab',
	'Anna Ivette Mondragón Luna',
	'ani@comunidad.unam.mx',
	'bw#81&%Tba',
	34,
	'Chile',
	true
),
(
	'a8d31ca0-6a4b-40cc-ba06-5e1d4a5c7d17',
	'Alejandra Galindo',
	'aleg@hotmail.com',
	'#67&Tgre=34',
	35,
	'México',
	true
);

-- Information about a course of a user 
insert into users_courses (
	user_id,
  	course_id,
  	course_percentage,
  	course_review
) 
values 
(
	'a8d31ca0-6a4b-40cc-ba06-5e1d4a5c7d17',
	'e277bcc3-4c93-403b-ac2a-5484af6de874',
	67.78,
	'El curso me ha gustado sin embargo en momentos falta más explicación de los ejemplos'
), 
(
	'514b244c-fd02-435a-afc0-b60add64a80e',
	'2a6b93ae-4d1a-4bd7-aede-04a4bd996c6f',
	45.6,
	'La manera de explicar es muy amena'
),
(
	'08e296fb-0a63-43a0-8c53-21396233d624',
	'f63a6761-8a31-4dbe-bfc0-76e508b0523a',
	28.67,
	'Me ha gustado mucho el curso'
),
(
	'ddfb0ee4-fea4-4e98-b1d3-5ac343e9151a',
	'e177b0b7-27df-4bbe-bf77-c3d0b4d5ad51',
	34.67,
	'Me ha resultado un tanto complicado, hasta el momento, comprender las actividades'
);

-- Add a course type
insert into courses (
	id,
  	title,
  	description,
  	level,
  	teacher,
  	total_chapters,
  	is_paid,
  	pusblication_date,
  	category_id
) 
values 
(
	'a4a4f396-008d-40f4-8607-e74542fa8515',
	'Introducción a la programación',
	'Curso para comprender las bases de la programación',
	'Principiante',
	'Ivette Carmona',
	8,
	false,
	'2021-04-23 18:23:00',
	'0250e36d-4030-4505-93db-a2d81df44ed7'
),
(
	'16102a5d-4373-4be3-9cd3-89aaaba8a531',
	'Literatura contemporánea 1',
	'Se analizan tanto los movimientos literarios como los autores más emblemáticos de la época',
	'Principiante',
	'Rodrigo Jaramillo',
	6,
	true,
	'2018-08-14 16:45:24',
	'5ef9f577-7758-44e5-8d8f-8bafdf52b71e'
),
(
	'3dd65b00-ad38-4817-b9a4-9eed1cd470b8',
	'Teoría computacional de la mente',
	'Se abordará los orígenes epistemológicos de la TCM para posteriormente comprender su incidencia en la psicología',
	'Intermedio',
	'Estela Pardo',
	8,
	true,
	'2019-05-14 09:45:29',
	'99b86a20-4fa1-461c-a5c5-f31d120af596'
),
(
	'42d911af-9089-456d-8ffc-1239fffe3bb1',
	'Temas selectos de África 1',
	'Se analizan diferentes temas sobre el contexto africano en la actualidad',
	'Avanzado',
	'Omar Ortiz',
	7,
	true,
	'2022-06-07 11:47:00',
	'3200d860-8094-464b-b28d-2715b0b93012'
),
(
	'e177b0b7-27df-4bbe-bf77-c3d0b4d5ad51',
	'Álgebra',
	'4',
	'Principiante',
	'Alejandra Galindo',
	8,
	true,
	'2018-11-18 14:05:45',
	'9cd379cb-611e-4d4c-ab3c-ff2e0bbd1fc2'
),
(
	'e277bcc3-4c93-403b-ac2a-5484af6de874',
	'React',
	'En este curso se aprenderán desde los fundamentos hasta ser competente en el ámbito laboral',
	'Intermedio',
	'Rául Cárdenas',
	9,
	true,
	'2022-06-25 13:45:38',
	'0250e36d-4030-4505-93db-a2d81df44ed7'

),
(
	'2a6b93ae-4d1a-4bd7-aede-04a4bd996c6f',
	'Problemas actuales de Cognición 1',
	'Se abordarán algunas temáticas desde la perpectiva actual congnitiva en psicología',
	'Avanzado',
	'Kirareset Riaño',
	10,
	true,
	'2021-04-03 18:45:28',
	'99b86a20-4fa1-461c-a5c5-f31d120af596'
),
(
	'f63a6761-8a31-4dbe-bfc0-76e508b0523a',
	'El boom latinoamericano',
	'Veremos origen, auge, influencia, representantes, de esteme movimiento literario',
	'Intermedio',
	'Lucía Capistrán',
	9,
	true,
	'2018-11-28 11:37:23',
	'5ef9f577-7758-44e5-8d8f-8bafdf52b71e'
),
(
	'733f71ce-5a2a-42ef-8d5d-589f315c7531',
	'El mundo árabe',
	'Atenderemos todo lo relacionado cuando nos referimos a árabe. Se explicitará que es y que no, y las consecuencias de ello',
	'Intermedio',
	'Omar Ortiz',
	10,
	true,
	'2021-07-11 18:34:19',
	'3200d860-8094-464b-b28d-2715b0b93012'

),
(
	'b017b635-0a85-4722-b3e1-f9b3e1b51de9',
	'Análisis matemático 1',
	'Se dotará de las herramientas para un correcto análisis en matemáticas',
	'Principiante',
	'Alejandra Galindo',
	10,
	true,
	'2019-08-29 15:13:20',
	'9cd379cb-611e-4d4c-ab3c-ff2e0bbd1fc2'
);

-- Add names categories of courses
insert into categories (
	id,
  	name
) 
values 
(
	'0250e36d-4030-4505-93db-a2d81df44ed7',
	'Programación'
), 
(
	'99b86a20-4fa1-461c-a5c5-f31d120af596',
	'Psicología'
), 
(
	'9cd379cb-611e-4d4c-ab3c-ff2e0bbd1fc2',
	'Matemáticas'
), 
(
	'3200d860-8094-464b-b28d-2715b0b93012',
	'Historia'
), 
(
	'5ef9f577-7758-44e5-8d8f-8bafdf52b71e',
	'Literatura'
);

-- Add information about course video
insert into course_video (
	id,
  	title,
  	url,
  	duration,
  	total_students,
  	course_id
) 
values 
(
	'da0ee2f1-c7aa-4649-9607-65f795f15024',
	'Inicios del Boom',
	'mardacourses.com/l/da0ee2f1-c7aa-4649-9607-65f795f15024',
	8.30,
	6,
	'f63a6761-8a31-4dbe-bfc0-76e508b0523a'
),
(
	'bcbc3f90-fc99-4514-b7f4-d46a021ce55a',
	'Influencias en el Boom',
	'mardacourses.com/l/bcbc3f90-fc99-4514-b7f4-d46a021ce55a',
	10.30,
	6,
	'f63a6761-8a31-4dbe-bfc0-76e508b0523a'
),
(
	'd09a2a3a-7a09-4dd4-9b60-06cea2b50a4e',
	'Primeros pasos con React',
	'mardacourses.com/r/d09a2a3a-7a09-4dd4-9b60-06cea2b50a4e',
	9.00,
	8,
	'e277bcc3-4c93-403b-ac2a-5484af6de874'
),
(
	'a3e528b5-c9d5-45b8-a21d-38f4691dc62e',
	'React Router Dom',
	'mardacourses.com/r/a3e528b5-c9d5-45b8-a21d-38f4691dc62e',
	10.30,
	8,
	'e277bcc3-4c93-403b-ac2a-5484af6de874'
),
(
	'ceab7153-ac8b-4321-aef9-92d938c8e16a',
	'Rutas anidadas',
	'mardacourses.com/r/ceab7153-ac8b-4321-aef9-92d938c8e16a',
	10.30,
	8,
	'e277bcc3-4c93-403b-ac2a-5484af6de874'
);



-- Join about courses and its relations
select c.id, c.title, c.description, c.level, c.teacher, c.total_chapters, c.is_paid, c.pusblication_date from courses c inner join users_courses uc on c.id = uc.course_id inner join course_video cv on c.id = cv.course_id inner join categories c2 on c.category_id = c2.id;  


