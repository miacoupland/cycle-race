CREATE TABLE Agent (
	agent_id VARCHAR(5) NOT NULL,
	name VARCHAR(20) NOT NULL,
	phone_no VARCHAR(15) NOT NULL,
	email VARCHAR(30) NOT NULL,
	PRIMARY KEY (agent_id)
) ENGINE = INNODB;

CREATE TABLE Venue (
	venue_id VARCHAR(5) NOT NULL,
	venue_type VARCHAR(20) NOT NULL,
	address VARCHAR(30) NOT NULL,
	max_occupancy INT NOT NULL,
	PRIMARY KEY (venue_id)
) ENGINE = INNODB;

CREATE TABLE Team (
	team_id VARCHAR(5) NOT NULL,
	team_name VARCHAR(20) NOT NULL,
	team_overview VARCHAR(150) NOT NULL,
	agent_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (team_id),
	FOREIGN KEY (agent_id) REFERENCES Agent(agent_id)
) ENGINE = INNODB;

CREATE TABLE Cyclist (
	cyclist_id VARCHAR(5) NOT NULL,
	cyclist_name VARCHAR(20) NOT NULL,
	bio VARCHAR(100) NOT NULL,
	email VARCHAR(30) NOT NULL,
	phone_no VARCHAR(15) NOT NULL,
	team_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (cyclist_id),
	FOREIGN KEY (team_id) REFERENCES Team(team_id)
) ENGINE = INNODB;

CREATE TABLE Customer (
	customer_id VARCHAR(5) NOT NULL,
	customer_name VARCHAR(20) NOT NULL,
	address VARCHAR(30) NOT NULL,
	phone_no VARCHAR(15) NOT NULL,
	PRIMARY KEY (customer_id)
) ENGINE = INNODB;

CREATE TABLE Ticket (
	ticket_set_id VARCHAR(5) NOT NULL,
	quantity_bought INT NOT NULL,
	race_URN VARCHAR(5) NOT NULL,
	customer_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (ticket_set_id),
	FOREIGN KEY (race_URN) REFERENCES Race(race_URN),
	FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
) ENGINE = INNODB;

CREATE TABLE Race (
	race_URN VARCHAR(5) NOT NULL,
	race_description VARCHAR(150) NOT NULL,
	start_date_time DATETIME NOT NULL,
	venue_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (race_URN),
	FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
) ENGINE = INNODB;

CREATE TABLE Employee (
	staff_id VARCHAR(5) NOT NULL,
	staff_name VARCHAR(20) NOT NULL,
	job_title VARCHAR(20) NOT NULL,
	phone_no VARCHAR(15) NOT NULL,
	venue_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (staff_id),
	FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
) ENGINE = INNODB;

CREATE TABLE Participates_In (
	race_URN VARCHAR(5) NOT NULL,
	team_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (race_URN) REFERENCES Race(race_URN),
	FOREIGN KEY (team_id) REFERENCES Team(team_id)
) ENGINE = INNODB;