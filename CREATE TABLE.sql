CREATE TABLE Cidades (
id 			INT 			PRIMARY KEY,
nome 		VARCHAR(60) 	NOT NULL,
populacao 	INT
);

CREATE TABLE Alunos (
id 			INT 		    PRIMARY KEY,
nome 		VARCHAR(60)     NOT NULL,
data_nasc 	DATE,
cidade_id 	INT,

FOREIGN KEY(cidade_id) REFERENCES Cidades(id)
);