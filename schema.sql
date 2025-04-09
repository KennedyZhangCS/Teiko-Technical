create table projects(
    project_id varchar(50) primary key,
    project_name text,
    description text,
    start_date date,
    end_date date,
);

create table subjects (
    subject_id varchar(50) primary key,
    project_id varchar(50) references projects(project_id),
    age integer,
    sex char(1),
    condition varchar(50)
);

create table treatments(
    treatment_id varchar(50) primary key,
    treatment_name varchar (100),
    description text
);

create table samples(
    sample_id varchar(50) primary key,
    subject_id varchar(50) references subjects(subject_id),
    sample_type ()
    collection_date date,
    time_from_treatment_start integer
);

create table cell_populations(
    measurement_id
    sample_id
    b_cell integer
    cd8_t_cell integer
    cd4_t_cell integer
    nk_cell integer
    monocyte integer
    total_cell_count integer
);

create table responses (
    response_id
    subject_id references subjects(subject_id),
    treatment_id references treatments(treatment_id),
    response char(1),
    notes TEXT
);

--2. What would be some advantages in capturing this information in a database?
--some of the advantages of capturing this information in a database:
--1) there will be no duplications in the database (because of primary key) that can confuse users/people
--and lead to any wrong data analysis
--2)it optimizes access by creating an "index" (i.e. a search tree)
--3) database can control access to sensitive data (i.e. require permission) and prevent data loss by having backups

