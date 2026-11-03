CREATE DATABASE db_filmes_isa;
USE db_filmes_isa;


CREATE TABLE filmes (
    id_filme INT PRIMARY KEY,
    nome_filme VARCHAR(100) NOT NULL,
    genero_filme VARCHAR(100) NULL,
	classificacao_filme varchar(100) NULL
);

CREATE TABLE cinemas (
    id_cinema INT PRIMARY KEY,
    nome_cinema VARCHAR(100) NOT NULL,
    local_cinema VARCHAR(100) NULL,
    contato_cinema VARCHAR(20)
);

CREATE TABLE ingressos (
    id_ingresso INT PRIMARY KEY,
    data_exibição date,
    id_filme INT NULL,
    id_cinema INT NULL,
    status_ingresso VARCHAR(100),
    
    FOREIGN KEY (id_filme)
        REFERENCES filmes(id_filme),

    FOREIGN KEY (id_cinema)
        REFERENCES cinemas(id_cinema)
);


INSERT INTO filmes
(id_filme, nome_filme, genero_filme, classificacao_filme)
VALUES
(1007, 	"Titanic", "Romance / Drama", "12 anos"),
(1008, "Shrek", "Animação / Comédia", NULL),
(1009, "Extraordinário", "Drama / Família", "10 anos"),
(1010, "Vingadores: Ultimato", "Ação / Ficção científica", "12 anos"),
(1011, "O Rei Leão", "Animação / Drama", "Livre"),
(1012, "As Branquelas", "Comédia", "14 anos"),
(1013, "Enrolados", NULL, "Livre"),
(1014, "It: A Coisa", "Terror / Suspense", "16 anos"),
(1015, 	"Ratatouille", "Animação / Comédia", "Livre"),
(1016, 	"Jurassic Park", "Aventura / Ficção científica", "12 anos");

SELECT * FROM filmes;


INSERT INTO cinemas
(id_cinema, nome_cinema, local_cinema, contato_cinema)
VALUES
(1524, 	"CineMovie", "Rua Sorocaba", 11987423156),
(2009, "CineSul", NULL, 15996318247),
(1099, "CinePatio", "Rua Rubelita", 21991734826),
(2327, "CinePrime", "Rua Curitiba", 31986241593),
(3004, "CineNorte", "Rua Gramado", 41997516382),
(5098, "CineReserva", "Rua Fortaleza", 51982467315),
(1093, "CineBela", "Rua Maceió", 61993825147),
(6874, "CineEstação", "Rua Campinas", 13988316254),
(4002, 	"CineArte", "Rua Manaus", 27984169273),
(5769, 	"CineWorld", NULL, 43996148527);

SELECT * FROM cinemas;


INSERT INTO ingressos
(id_ingresso, data_exibição, id_filme, id_cinema, status_ingresso)
VALUES
(1020, '2026-11-05', 1007, 1524, "Pago"),
(2030, '2026-11-06', 1008, 2009, "Pendente"),
(3040, '2026-11-07', 1009, 1099, "Pendente"),
(4050, '2026-11-08', 1010, 2327, "Pago"),
(5060, '2026-11-09', 1011, 3004,"Pago"),
(6070, '2026-11-10', 1012, 5098, "Pago"),
(7080, '2026-11-11', 1013, 1093, "Pendente"),
(8090, '2026-11-12', 1014, 6874, "Pago"),
(9010, '2026-11-13', NULL, 4002, "Pendente"),
(1010, '2026-11-14', 1015, NULL, "Pendente");

SELECT * FROM ingressos;

-- 1
SELECT filmes.nome_filme, cinemas.nome_cinema
FROM filmes
JOIN ingressos ON filmes.id_filme = ingressos.id_filme
JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 2
SELECT filmes.nome_filme, cinemas.id_cinema, cinemas.nome_cinema, cinemas.local_cinema, cinemas.contato_cinema
FROM filmes
JOIN ingressos ON filmes.id_filme = ingressos.id_filme
JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 3
SELECT filmes.nome_filme, cinemas.nome_cinema, ingressos.status_ingresso
FROM filmes
JOIN ingressos ON filmes.id_filme = ingressos.id_filme
JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 4
SELECT filmes.nome_filme, cinemas.contato_cinema, cinemas.nome_cinema
FROM filmes
JOIN ingressos ON filmes.id_filme = ingressos.id_filme
JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 5
SELECT filmes.nome_filme, cinemas.nome_cinema, ingressos.data_exibição
FROM ingressos
JOIN filmes ON ingressos.id_filme = filmes.id_filme
JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 6
SELECT filmes.nome_filme, cinemas.nome_cinema
FROM filmes
JOIN ingressos ON filmes.id_filme = ingressos.id_filme
JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema
WHERE ingressos.status_ingresso = 'Pago';

-- 7
SELECT filmes.nome_filme, cinemas.nome_cinema
FROM filmes
LEFT JOIN ingressos ON filmes.id_filme = ingressos.id_filme
LEFT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 8
SELECT filmes.nome_filme, filmes.genero_filme, cinemas.nome_cinema
FROM filmes
LEFT JOIN ingressos ON filmes.id_filme = ingressos.id_filme
LEFT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 9
SELECT cinemas.nome_cinema, filmes.nome_filme
FROM cinemas
LEFT JOIN ingressos ON cinemas.id_cinema = ingressos.id_cinema
LEFT JOIN filmes ON ingressos.id_filme = filmes.id_filme;

-- 10
SELECT filmes.nome_filme, cinemas.nome_cinema, ingressos.status_ingresso
FROM filmes
LEFT JOIN ingressos ON filmes.id_filme = ingressos.id_filme
LEFT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 11
SELECT filmes.nome_filme
FROM filmes
LEFT JOIN ingressos ON filmes.id_filme = ingressos.id_filme
WHERE ingressos.id_ingresso IS NULL;

-- 12
SELECT ingressos.id_ingresso, filmes.nome_filme, cinemas.nome_cinema, ingressos.status_ingresso
FROM ingressos
LEFT JOIN filmes ON ingressos.id_filme = filmes.id_filme
LEFT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 13
SELECT filmes.nome_filme, cinemas.nome_cinema
FROM ingressos
RIGHT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema
LEFT JOIN filmes ON ingressos.id_filme = filmes.id_filme;

-- 14
SELECT ingressos.id_ingresso, ingressos.data_exibição, ingressos.status_ingresso, filmes.nome_filme, cinemas.nome_cinema
FROM ingressos
LEFT JOIN filmes ON ingressos.id_filme = filmes.id_filme
LEFT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 15
SELECT ingressos.id_ingresso, filmes.nome_filme, cinemas.nome_cinema
FROM filmes
RIGHT JOIN ingressos ON filmes.id_filme = ingressos.id_filme
RIGHT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

-- 16
SELECT cinemas.nome_cinema
FROM ingressos
RIGHT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema
WHERE ingressos.id_ingresso IS NULL;

-- 17
SELECT filmes.nome_filme, cinemas.nome_cinema, ingressos.status_ingresso
FROM filmes
JOIN ingressos ON filmes.id_filme = ingressos.id_filme
JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema
WHERE ingressos.status_ingresso = 'Pendente';

-- 18
SELECT filmes.nome_filme, filmes.genero_filme
FROM filmes
LEFT JOIN ingressos ON filmes.id_filme = ingressos.id_filme;

-- 19
SELECT cinemas.nome_cinema, cinemas.local_cinema, filmes.nome_filme
FROM ingressos
RIGHT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema
LEFT JOIN filmes ON ingressos.id_filme = filmes.id_filme;

-- 20
SELECT filmes.nome_filme, filmes.genero_filme, cinemas.nome_cinema, ingressos.data_exibição, ingressos.status_ingresso
FROM filmes
LEFT JOIN ingressos ON filmes.id_filme = ingressos.id_filme
LEFT JOIN cinemas ON ingressos.id_cinema = cinemas.id_cinema;

