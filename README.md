# Gerenciamento de Tabelas e Dados SQL

Este repositório contém o código SQL para a criação e manipulação das tabelas `Cidades` e `Alunos`, incluindo comandos de inserção e consultas complexas para gestão de dados.

## Estrutura das Tabelas

### Tabela `Cidades`

A tabela `Cidades` armazena informações sobre diferentes cidades, incluindo:
- `id`: Identificador único da cidade (chave primária).
- `nome`: Nome da cidade.
- `populacao`: População estimada da cidade.

```sql
CREATE TABLE Cidades (
    id INT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    populacao INT
);
```

### Tabela `Alunos`

A tabela `Alunos` registra informações de alunos, com uma referência à cidade onde cada aluno reside. A estrutura inclui:
- `id`: Identificador único do aluno (chave primária).
- `nome`: Nome do aluno.
- `data_nasc`: Data de nascimento do aluno.
- `cidade_id`: ID da cidade onde o aluno reside (chave estrangeira para `Cidades`).

```sql
CREATE TABLE Alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    data_nasc DATE,
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES Cidades(id)
);
```

## Inserção de Dados e Consultas

### Dados da Tabela `Cidades`

Exemplo de inserção de dados na tabela `Cidades`:

```sql
INSERT INTO Cidades (id, nome, populacao) VALUES (1, 'São Paulo', 12176866);
INSERT INTO Cidades (id, nome, populacao) VALUES (2, 'Rio de Janeiro', 6748000);
INSERT INTO Cidades (id, nome, populacao) VALUES (3, 'Belo Horizonte', 2521564);
INSERT INTO Cidades (id, nome, populacao) VALUES (4, 'Curitiba', 1948626);
INSERT INTO Cidades (id, nome, populacao) VALUES (5, 'Porto Alegre', 1484941);
```

Consulta para exibir todos os registros da tabela `Cidades`:

```sql
SELECT * FROM Cidades;
```

### Dados da Tabela `Alunos`

Exemplo de inserção de dados na tabela `Alunos`:

```sql
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (1, 'Ana Silva', '2005-03-15', 1);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (2, 'Bruno Costa', '2004-07-22', 2);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (3, 'Carla Santos', '2006-01-30', 3);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (4, 'Diego Pereira', '2005-12-11', 4);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (5, 'Eduarda Lima', '2004-05-05', 5);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (6, 'Felipe Almeida', '2006-09-18', 1);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (7, 'Gabriela Ferreira', '2005-04-20', 2);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (8, 'Henrique Rocha', '2004-11-03', 3);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (9, 'Isabela Martins', '2005-08-29', 4);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (10, 'João Pedro', '2006-02-14', 5);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (11, 'Larissa Mendes', '2005-06-25', 1);
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES (12, 'Marcos Silva', '2004-10-09', 2);
```

Consulta para exibir todos os registros da tabela `Alunos`:

```sql
SELECT * FROM Alunos;
```

### Consultas Relacionadas

#### Alunos e Suas Cidades Correspondentes

Esta consulta utiliza `INNER JOIN` para mostrar todos os alunos e as respectivas cidades:

```sql
SELECT * FROM Alunos
INNER JOIN Cidades ON Cidades.id = Alunos.cidade_id;
```

#### Alunos com Suas Cidades (Incluindo Alunos Sem Cidade)

Usa `LEFT JOIN` para incluir todos os alunos, mesmo aqueles sem cidade associada. Os resultados são ordenados por nome:

```sql
SELECT * FROM Alunos
LEFT JOIN Cidades ON Cidades.id = Alunos.cidade_id
ORDER BY Alunos.nome;
```

#### Alunos de Cidades Específicas e Data de Nascimento

Consulta que seleciona alunos de cidades que começam com "Por" e nascidos após 15/08/2001, exibindo apenas o RA, Nome e Data de Nascimento:

```sql
SELECT A.id AS "RA", A.nome AS "Nome", A.data_nasc AS "Data de Nascimento"
FROM Alunos A
LEFT JOIN Cidades C ON A.cidade_id = C.id
WHERE C.nome IS NOT NULL
  AND C.nome LIKE 'Por%'
  AND A.data_nasc > '2001-08-15'
ORDER BY A.nome;
```
