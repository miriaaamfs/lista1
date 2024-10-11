LISTA 1- VIEWS

1-CREATE VIEW vw_alunos_cursos_disciplinas AS
SELECT 
    a.nome AS aluno_nome, 
    d.nome AS disciplina_nome, 
    c.nome AS curso_nome
FROM 
    alunos a
JOIN matriculas m ON a.id = m.aluno_id
JOIN disciplinas d ON m.disciplina_id = d.id
JOIN cursos c ON d.curso_id = c.id;


2-CREATE VIEW vw_total_alunos_por_disciplina AS
SELECT 
    d.nome AS disciplina_nome,
    COUNT(m.aluno_id) AS total_alunos
FROM 
    disciplinas d
LEFT JOIN matriculas m ON d.id = m.disciplina_id
GROUP BY d.nome;

3-
CREATE VIEW vw_total_alunos_por_disciplina AS
SELECT 
    d.nome AS disciplina_nome,
    COUNT(m.aluno_id) AS total_alunos
FROM 
    disciplinas d
LEFT JOIN matriculas m ON d.id = m.disciplina_id
GROUP BY d.nome;


4-

CREATE VIEW vw_professores_turmas AS
SELECT 
    p.nome AS professor_nome,
    d.nome AS disciplina_nome,
    t.horario AS turma_horario
FROM 
    professores p
JOIN disciplinas d ON p.id = d.professor_id
JOIN turmas t ON d.id = t.disciplina_id;

5-

CREATE VIEW vw_alunos_maiores_20_anos AS
SELECT 
    nome AS aluno_nome, 
    data_nascimento
FROM 
    alunos
WHERE 
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 20;

6-
CREATE VIEW vw_cursos_carga_horaria AS
SELECT 
    c.nome AS curso_nome, 
    COUNT(d.id) AS total_disciplinas,
    SUM(d.carga_horaria) AS carga_horaria_total
FROM 
    cursos c
JOIN disciplinas d ON c.id = d.curso_id
GROUP BY c.nome;

7-

CREATE VIEW vw_professores_especialidades AS
SELECT 
    p.nome AS professor_nome, 
    p.especialidade
FROM 
    professores p;

8-

CREATE VIEW vw_alunos_mais_de_uma_disciplina AS
SELECT 
    a.nome AS aluno_nome, 
    COUNT(m.disciplina_id) AS total_disciplinas
FROM 
    alunos a
JOIN matriculas m ON a.id = m.aluno_id
GROUP BY a.nome
HAVING total_disciplinas > 1;

9-

CREATE VIEW vw_alunos_disciplinas_concluidas AS
SELECT 
    a.nome AS aluno_nome, 
    COUNT(m.disciplina_id) AS disciplinas_concluidas
FROM 
    alunos a
JOIN matriculas m ON a.id = m.aluno_id
WHERE m.status = 'Concluído'
GROUP BY a.nome;


10-

CREATE VIEW vw_turmas_por_semestre AS
SELECT 
    t.id AS turma_id, 
    d.nome AS disciplina_nome, 
    t.semestre
FROM 
    turmas t
JOIN disciplinas d ON t.disciplina_id = d.id
WHERE t.semestre = '2024.1'; -- Ajuste o semestre conforme necessário


11-

CREATE VIEW vw_alunos_matriculas_trancadas AS
SELECT 
    a.nome AS aluno_nome
FROM 
    alunos a
JOIN matriculas m ON a.id = m.aluno_id
WHERE m.status = 'Trancado';

12-

CREATE VIEW vw_disciplinas_sem_alunos AS
SELECT 
    d.nome AS disciplina_nome
FROM 
    disciplinas d
LEFT JOIN matriculas m ON d.id = m.disciplina_id
WHERE m.aluno_id IS NULL;


13-
CREATE VIEW vw_alunos_por_status_matricula AS
SELECT 
    m.status AS status_matricula, 
    COUNT(m.aluno_id) AS total_alunos
FROM 
    matriculas m
GROUP BY m.status;


14-

CREATE VIEW vw_professores_por_especialidade AS
SELECT 
    p.especialidade, 
    COUNT(p.id) AS total_professores
FROM 
    professores p
GROUP BY p.especialidade;

15-

CREATE VIEW vw_alunos_e_idades AS
SELECT 
    nome AS aluno_nome, 
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM 
    alunos;


16-
CREATE VIEW vw_alunos_ultimas_matriculas AS
SELECT 
    a.nome AS aluno_nome, 
    MAX(m.data_matricula) AS ultima_matricula
FROM 
    alunos a
JOIN matriculas m ON a.id = m.aluno_id
GROUP BY a.nome;


17-


CREATE VIEW vw_disciplinas_por_curso AS
SELECT 
    d.nome AS disciplina_nome, 
    c.nome AS curso_nome
FROM 
    disciplinas d
JOIN cursos c ON d.curso_id = c.id
WHERE c.nome = 'Engenharia de Software'; -- Ajuste o nome do curso conforme necessário


18-
CREATE VIEW vw_professores_sem_turmas AS
SELECT 
    p.nome AS professor_nome
FROM 
    professores p
LEFT JOIN disciplinas d ON p.id = d.professor_id
LEFT JOIN turmas t ON d.id = t.disciplina_id
WHERE t.id IS NULL;


19-
CREATE VIEW vw_alunos_cpf_email AS
SELECT 
    nome AS aluno_nome, 
    cpf, 
    email
FROM 
    alunos;


20-


CREATE VIEW vw_total_disciplinas_por_professor AS
SELECT 
    p.nome AS professor_nome, 
    COUNT(d.id) AS total_disciplinas
FROM 
    professores p
JOIN disciplinas d ON p.id = d.professor_id
GROUP BY p.nome;