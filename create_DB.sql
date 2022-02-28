DROP DATABASE IF EXISTS employees;

CREATE DATABASE IF NOT EXISTS employees;

CREATE TABLE IF NOT EXISTS languages(
    iso_code VARCHAR(2) NOT NULL PRIMARY KEY,
    language_name VARCHAR(255) NOT NULL
);

# Setting up the languages
INSERT INTO languages(`iso_code`, `language_name`)
VALUES ('en', 'English'),('es', 'Spanish'),('fr', 'French');
    
    # Employee base info
    CREATE TABLE IF NOT EXISTS employee_base_info(
        id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
        employee_name VARCHAR(255) NOT NULL,
        birthname DATE NOT NULL,
        id_code VARCHAR(255) NOT NULL,
        is_current_employee BOOLEAN NOT NULL,
        email VARCHAR(255),
        phone_number VARCHAR(255),
        address_employee VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        created_by VARCHAR(255),
        updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
        updated_by VARCHAR(255)
    );
    
    # Employee extra info
    CREATE TABLE IF NOT EXISTS informations_about_employee(
        id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
        introduction TEXT NOT NULL,
        work_experience TEXT NOT NULL,
        education TEXT NOT NULL,
        employee_id INTEGER NOT NULL,
        language_iso_code VARCHAR(2) NOT NULL,
        FOREIGN KEY(employee_id) REFERENCES employee_base_info(id),
        FOREIGN KEY(language_iso_code) REFERENCES languages(iso_code)
    );

CREATE TRIGGER IF NOT EXISTS `employee_base_info_insert` BEFORE INSERT ON `employee_base_info` FOR EACH ROW SET new.created_by = USER();
CREATE TRIGGER IF NOT EXISTS `employee_base_info_update` BEFORE UPDATE ON `employee_base_info` FOR EACH ROW SET new.updated_by = USER();

