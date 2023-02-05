CREATE DATABASE EMPLOYEES;
USE EMPLOYEES;

/*drop table work_period;
drop table  documents;
drop table employees;*/


create table IF NOT EXISTS employees(
	id integer primary key auto_increment,
    familyName varchar(50) not null,
    firstName varchar(50) not null,
    secondName varchar(50) null,
    dt_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_blocked BOOL DEFAULT FALSE,
    dt_blocked DATETIME NULL,
    memo varchar(256) null
);

create table IF NOT EXISTS documents (
id integer primary key auto_increment,
id_employees int,
doc_type varchar(50),
doc_date DATETIME,
doc_number varchar(50) null,
doc_memo varchar(256) null,
FOREIGN KEY (id_employees) REFERENCES employees(id),
INDEX idx_documents (id, id_employees)
);


create table IF NOT EXISTS work_period(
id integer primary key auto_increment,
id_employees int,
dt_start datetime,
id_doc_start int,
dt_end datetime NULL,
id_doc_end int NULL,
work_memo varchar(256) null,
UNIQUE (id_employees, dt_start),
FOREIGN KEY (id_employees) REFERENCES employees(id),
FOREIGN KEY (id_doc_start, id_employees) REFERENCES documents(id, id_employees),
FOREIGN KEY (id_doc_end, id_employees) REFERENCES documents(id, id_employees)
);



INSERT INTO employees (familyName, firstName) 
VALUES ("Ivanov", "Ivan"), ("Sergeev", "Sergey");

INSERT INTO documents (id_employees, doc_type, doc_date, doc_number)
VALUES 
(1, "вид на жительство", "2023-01-01", "RP-01"),
(2, "LTR", "2023-02-01", "LTR-01");
/* (3, "договор подряда", "2023-01-15", "2023-01"); 
Response:
Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (
`employees`.`documents`, CONSTRAINT `documents_ibfk_1` 
FOREIGN KEY (`id_employees`) REFERENCES `employees` (`id`))*/

DELIMITER $$

CREATE TRIGGER work_period_check_dates
BEFORE INSERT ON work_period
FOR EACH ROW
BEGIN
  IF (NEW.dt_start < (SELECT doc_date FROM documents WHERE documents.id = NEW.id_doc_start)) OR 
     (NEW.dt_end IS NOT NULL AND NEW.dt_end < (SELECT doc_date FROM documents WHERE documents.id = NEW.id_doc_end)) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect dates in work_period table';
  END IF;
END;
$$
DELIMITER ;


INSERT INTO work_period (id_employees, dt_start, id_doc_start)
VALUES
-- (1, "2023-01-01", 1),
(2, "2023-02-01", 2);
