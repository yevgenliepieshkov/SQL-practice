
USE company;

CREATE TABLE employee (
		fname VARCHAR(15) NOT NULL,
		minit VARCHAR(1),
        lname VARCHAR(15) NOT NULL,
        ssn CHAR(9) ,
        bdate DATETIME,
        address VARCHAR(50),
        sex CHAR(10) ,
        Salary DECIMAL(10,2),
        superssn CHAR(9),
        dno INT(4),
        PRIMARY KEY (ssn),
        FOREIGN KEY (superssn) REFERENCES employee (ssn)
) ENGINE = innodb;


CREATE TABLE department (
		dname VARCHAR(25) NOT NULL,
        dnumber INT(4),
        mgrssn CHAR(9) NOT NULL,
        mgrstartdate DATETIME,
        PRIMARY KEY (dnumber),
        UNIQUE(dname),
        FOREIGN KEY (mgrssn) REFERENCES employee(ssn)
) ENGINE = innodb;


CREATE TABLE project (
		pname VARCHAR(25) NOT NULL,
		pnumber INT(4),
		plocation VARCHAR(15),
		dnum INT(4) NOT NULL,
		PRIMARY KEY (pnumber),
		UNIQUE (pname),
		FOREIGN KEY (dnum) REFERENCES department (dnumber)
) ENGINE = innodb;


CREATE TABLE works_on (
		essn CHAR(9),
        pno INT(4),
        hours DECIMAL(4,1),
        PRIMARY KEY (essn,pno),
        FOREIGN KEY (essn) REFERENCES employee (ssn),
        FOREIGN KEY (pno) REFERENCES project(pnumber)
) ENGINE = innodb;


CREATE TABLE dependent (
		essn CHAR(9),
        dependent_name VARCHAR(15),
        sex CHAR,
        bdate DATE,
        relationship VARCHAR(8),
        PRIMARY KEY (essn , dependent_name),
        FOREIGN KEY (essn)REFERENCES employee (ssn)
)  ENGINE=INNODB;


DROP TABLE IF EXISTS dependent1;
