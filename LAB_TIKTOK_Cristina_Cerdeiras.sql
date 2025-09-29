CREATE DATABASE IF NOT EXISTS TikTokDB;
USE TikTokDB;

CREATE TABLE IF NOT EXISTS Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
);
 
-- Tabla Videos
CREATE TABLE IF NOT EXISTS Videos (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(100),
    descripcion TEXT,
    fecha_publicacion DATE,
    duracion_segundos INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
 
-- Tabla Comentarios
CREATE TABLE IF NOT EXISTS Comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_video INT NOT NULL,
    id_usuario INT NOT NULL,
    texto_comentario TEXT NOT NULL,
    fecha_comentario DATE,
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
 
-- Tabla Likes
CREATE TABLE IF NOT EXISTS Likes (
    id_like INT AUTO_INCREMENT PRIMARY KEY,
    id_video INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_like DATE,
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
 
-- Tabla Seguidores
CREATE TABLE IF NOT EXISTS Seguidores (
    id_seguidor INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_seguidor INT NOT NULL,
    id_usuario_seguido INT NOT NULL,
    fecha_seguimiento DATE,
    FOREIGN KEY (id_usuario_seguidor) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_usuario_seguido) REFERENCES Usuarios(id_usuario)
);

-- Usuarios
INSERT INTO Usuarios (nombre_usuario, email, fecha_registro, pais_origen) VALUES
('ana123', 'ana@example.com', '2024-01-10', 'España'),
('pedro89', 'pedro@example.com', '2023-12-05', 'México'),
('maria_99', 'maria@example.com', '2024-02-20', 'Argentina');
 
-- Videos
INSERT INTO Videos (id_usuario, titulo, descripcion, fecha_publicacion, duracion_segundos) VALUES
(1, 'Baile divertido', 'Un baile que me encanta', '2024-04-01', 30),
(2, 'Receta rápida', 'Cómo hacer una tortilla', '2024-03-25', 45),
(3, 'Paisajes', 'Hermosos paisajes naturales', '2024-04-05', 60);
 
-- Comentarios
INSERT INTO Comentarios (id_video, id_usuario, texto_comentario, fecha_comentario) VALUES
(1, 2, '¡Muy divertido!', '2024-04-02'),
(2, 1, 'Me encanta la receta', '2024-03-26'),
(3, 2, 'Qué paisajes tan lindos', '2024-04-06');
 
-- Likes
INSERT INTO Likes (id_video, id_usuario, fecha_like) VALUES
(1, 3, '2024-04-02'),
(2, 1, '2024-03-27'),
(3, 1, '2024-04-06');
 
-- Seguidores
INSERT INTO Seguidores (id_usuario_seguidor, id_usuario_seguido, fecha_seguimiento) VALUES
(1, 2, '2024-02-01'),
(2, 3, '2024-03-15'),
(3, 1, '2024-04-01');

-- Ver todos los usuarios
SELECT * FROM Usuarios;
 
-- Ver todos los videos publicados
SELECT * FROM Videos;
 
-- Ver los comentarios realizados
SELECT * FROM Comentarios;
 
-- Ver todos los likes dados
SELECT * FROM Likes;
 
-- Ver relaciones de seguimiento
SELECT * FROM Seguidores;

-- QUERY 1
SELECT nombre_usuario, email, pais_origen FROM usuarios
WHERE pais_origen = 'España';

-- QUERY 2
SELECT * FROM videos
WHERE duracion_segundos > 40;

-- QUERY 3
SELECT * FROM seguidores
ORDER BY id_usuario_seguido;
