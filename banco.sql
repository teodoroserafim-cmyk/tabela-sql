create table turmas (
    id bigint generated always as identity primary key,
    nome text not null
);

create table alunos (
    id bigint generated always as identity primary key,
    nome text not null,
    turma_id bigint,
    constraint fk_turma
    foreign key (turma_id)
    references turmas(id)
);insert into turmas (nome)
values
('DS1'),
('DS2');

insert into alunos (nome, turma_id)
values
('João', 1),
('Maria', 1),
('Ana', 2);select
    alunos.id,
    alunos.nome,
    turmas.nome as turma
from alunos
join turmas
on alunos.turma_id = turmas.id;
