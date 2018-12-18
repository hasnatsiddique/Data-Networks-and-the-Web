DROP TABLE IF EXISTS FluckGiven, MediaServe, Media, Account;

CREATE TABLE Account (
	id INT AUTO_INCREMENT,
	username VARCHAR(8) UNIQUE NOT NULL,
	password CHAR(61) NOT NULL,
	firstname VARCHAR(25) NOT NULL,
	lastname VARCHAR(25) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE Media (
	id INT AUTO_INCREMENT,
	img_url VARCHAR(100) UNIQUE,
	alt_txt VARCHAR(50),
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE MediaServe (
	id INT AUTO_INCREMENT,
	media_id INT NOT NULL,
	account_id INT,
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (account_id)
		REFERENCES Account (id),
	FOREIGN KEY (media_id)
		REFERENCES Media (id)
) ENGINE=InnoDB;

CREATE TABLE FluckGiven (
	id INT AUTO_INCREMENT,
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	serve_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (serve_id)
		REFERENCES MediaServe (id)
) ENGINE=InnoDB;