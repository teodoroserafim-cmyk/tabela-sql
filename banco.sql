-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.turmas (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  curso_id integer NOT NULL,
  CONSTRAINT turmas_pkey PRIMARY KEY (id),
  CONSTRAINT turmas_id_fkey FOREIGN KEY (id) REFERENCES public.professores(id)
);
CREATE TABLE public.alunos (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  turma_id bigint,
  CONSTRAINT alunos_pkey PRIMARY KEY (id),
  CONSTRAINT alunos_turma_id_fkey FOREIGN KEY (turma_id) REFERENCES public.turmas(id)
);
CREATE TABLE public.professores (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  CONSTRAINT professores_pkey PRIMARY KEY (id),
  CONSTRAINT professores_id_fkey FOREIGN KEY (id) REFERENCES public.alunos(id)
);
CREATE TABLE public.disciplinas (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  professor_id bigint,
  CONSTRAINT disciplinas_pkey PRIMARY KEY (id),
  CONSTRAINT disciplinas_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.professores(id),
  CONSTRAINT disciplinas_id_fkey FOREIGN KEY (id) REFERENCES public.alunos(id)
);
CREATE TABLE public.cursos (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  CONSTRAINT cursos_pkey PRIMARY KEY (id),
  CONSTRAINT cursos_id_fkey FOREIGN KEY (id) REFERENCES public.alunos(id)
);
