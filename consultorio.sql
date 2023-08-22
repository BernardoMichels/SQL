REM   Script: exercicio_consultorio_medico
REM   Exercicio sobre cração de tabelas

CREATE TABLE ESPECIALIDADES ( 
    cod_especialidade int, 
    descricao char(50), 
    constraint pk_especialidade primary key (cod_especialidade) 
);

CREATE TABLE MEDICOS( 
 
    cod_medico int, 
    nome char(50), 
    endereco char(50), 
    cidade char(20), 
    fone_residencial int, 
    fone_comercial int, 
    fone_celular int, 
    cod_especialidade int, 
    constraint fk_cod_especialidade foreign key (cod_especialidade) references ESPECIALIDADES (cod_especialidade), 
    constraint pk_cod_medico primary key (cod_medico) 
);

CREATE TABLE PACIENTES ( 
 
    cod_paciente int, 
	nome char(50), 
    endereco char(50), 
    cidade char (50), 
    telefone int, 
    dt_nascimento date, 
    constraint pk_paciente primary key (cod_paciente) 
);

CREATE TABLE CONSULTORIOS ( 
 
	cod_consultorio int, 
	endereco char(50), 
    telefone int, 
    constraint pk_consultorio primary key (cod_consultorio) 
);

CREATE TABLE HORARIO_ATENDIMENTO ( 
    cod_paciente int, 
    cod_medico int, 
    cod_consultorio int, 
	constraint fk_cod_paciente foreign key (cod_paciente) references PACIENTES (cod_paciente), 
	constraint fk_cod_medico foreign key (cod_medico) references MEDICOS (cod_medico), 
	data_atendimento date, 
    hora_atendimento int, 
    constraint atendimento_pk primary key (cod_paciente, cod_medico, data_atendimento, hora_atendimento), 
    situacao char(50), 
    constraint fk_cod_consultorio foreign key (cod_consultorio) references CONSULTORIOS (cod_consultorio) 
);

