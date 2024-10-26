SELECT * FROM Cidades;
SELECT * FROM Alunos;

SELECT * FROM Alunos INNER JOIN Cidades on Cidades.id = Alunos.cidade_id;
SELECT * FROM Alunos LEFT JOIN Cidades ON Cidades.id = Alunos.cidade_id ORDER BY Alunos.nome;

SELECT A.id AS "RA", A.nome AS "Nome", A.data_nasc AS "Data de Nascimento" FROM Alunos A 
LEFT JOIN Cidades C ON A.cidade_id = C.id  WHERE C.nome IS NOT NULL AND C.nome LIKE 'Por%' 
AND A.data_nasc > '2001-08-15' ORDER BY A.nome;

