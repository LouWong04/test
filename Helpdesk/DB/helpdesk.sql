create database SE_database;
use SE_database;

-- testing purpose
SET SQL_SAFE_UPDATES = 0;
select * from admin;
select * from task;
select * from user;
truncate table task;


CREATE TABLE user (
	user_id int AUTO_INCREMENT PRIMARY KEY,
	user_name varchar(50) DEFAULT NULL,
	user_password varchar(100) DEFAULT NULL,
	user_email varchar(50) DEFAULT NULL,
	user_status enum ('basic', 'premium', 'blocked') DEFAULT 'basic',
	user_image blob DEFAULT NULL,
	user_verify_token varchar(255) DEFAULT NULL,
	user_reg_date datetime DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM user;
INSERT INTO user (user_name, user_password, user_email, user_status, user_image, user_verify_token) VALUES
('Alice Tan', 'password123', 'alice.tan@example.com', 'basic', NULL, 'token12345'),
('Bob Wong', 'securepass', 'bob.wong@example.com', 'premium', NULL, 'token67890'),
('Charlie Lim', 'mypassword', 'charlie.lim@example.com', 'blocked', NULL, 'token54321'),
('David Lee', 'pass1234', 'david.lee@example.com', 'basic', NULL, 'token98765'),
('Emma Chua', 'testpass', 'emma.chua@example.com', 'premium', NULL, 'token11111');



create table admin(
	admin_id int AUTO_INCREMENT PRIMARY KEY,
	admin_name varchar(50) DEFAULT NULL,
	admin_password varchar(100) DEFAULT NULL,
	admin_email varchar(50) DEFAULT NULL,
	admin_image blob DEFAULT NULL,
	admin_verify_token varchar(255) DEFAULT NULL,
	admin_reg_date datetime DEFAULT CURRENT_TIMESTAMP
);


create table helpdesk(
	helpdesk_id int AUTO_INCREMENT PRIMARY KEY,
	helpdesk_name varchar(50) DEFAULT NULL,
	helpdesk_password varchar(100) DEFAULT NULL,
	helpdesk_email varchar(50) DEFAULT NULL,
	helpdesk_image blob DEFAULT NULL,
	helpdesk_verify_token varchar(255) DEFAULT NULL,
	helpdesk_reg_date datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE task (
    task_id int AUTO_INCREMENT PRIMARY KEY,
    user_id INT DEFAULT NULL,
    task_type enum ('work', 'personal', 'household', 'fitness'),     
    task_title VARCHAR(100) DEFAULT NULL,  
    task_description TEXT DEFAULT NULL,                              
    task_start_date datetime DEFAULT NULL,  
    task_end_date datetime DEFAULT NULL, 
    task_status enum ('in progress', 'done') DEFAULT 'in progress',        
    task_recurring enum ('0', '1', '7', '30') DEFAULT '0',
    task_reminder_time enum ('0', '15', '30', '60') DEFAULT '0',
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

DROP TABLE task;
select * from task;
select * from special_day;
TRUNCATE TABLE task;
TRUNCATE TABLE special_day;

INSERT INTO special_day (special_day_content, special_day_date) VALUES
('New Year Celebration', '2025-02-02 00:00:00'),
('Valentine''s Day', '2025-02-03 00:00:00'),
('Company Anniversary', '2025-03-10 00:00:00'),
('Project Deadline', '2025-04-25 00:00:00'),
('Independence Day', '2025-07-04 00:00:00'),
('Family Gathering', '2025-08-15 00:00:00'),
('Halloween Party', '2025-10-31 00:00:00'),
('Christmas Eve', '2025-12-24 00:00:00'),
('Christmas Day', '2025-12-25 00:00:00'),
('New Year''s Eve', '2025-12-31 00:00:00');

INSERT INTO task (
    user_id, task_type, task_title, task_description, task_start_date, task_end_date, 
    task_status, task_recurring, task_reminder_time
)
VALUES
    (1, 'work', 'Team Meeting', 'Discuss project updates with the team.', '2025-01-28 10:00:00', '2025-01-28 11:00:00', 
     'in progress', 'none', '15'),

    (1, 'household', 'Grocery Shopping', 'Buy vegetables, fruits, and milk.', '2025-01-30 17:00:00', '2025-01-30 18:30:00', 
     'in progress', 'weekly', '0'),

    (1, 'household', 'Laundry', 'Wash and fold clothes.', '2025-01-29 14:00:00', '2025-01-29 16:00:00', 
     'done', 'weekly', '0'),

    (1, 'work', 'Client Meeting', 'Present project updates to the client.', '2025-01-29 15:00:00', '2025-02-02 16:30:00', 
     'in progress', 'none', '30'),

    (2, 'fitness', 'Yoga Session', 'Attend a yoga class at the gym.', '2025-01-28 18:00:00', '2025-01-28 19:00:00', 
     'done', 'none', '30'),

    (2, 'fitness', 'Morning Run', 'Go for a 5km run in the park.', '2025-01-31 06:30:00', '2025-01-31 07:15:00', 
     'done', 'daily', '30'),

    (2, 'personal', 'Call Parents', 'Catch up with parents over a phone call.', '2025-01-30 20:00:00', '2025-01-30 20:30:00', 
     'in progress', 'daily', '15'),

    (2, 'household', 'Fix Leaky Faucet', 'Repair the faucet in the kitchen.', '2025-01-30 10:00:00', '2025-01-30 11:30:00', 
     'done', 'none', '0'),

    (3, 'personal', 'Doctor Appointment', 'Annual health check-up.', '2025-01-29 09:00:00', '2025-01-29 10:00:00', 
     'done', 'none', '15'),

    (3, 'work', 'Submit Report', 'Finalize and submit the quarterly financial report.', '2025-02-01 08:00:00', '2025-02-01 12:00:00', 
     'in progress', 'none', '60'),

    (3, 'fitness', 'Gym Workout', 'Weight training and cardio.', '2025-01-31 18:00:00', '2025-01-31 19:00:00', 
     'in progress', 'none', '30');



SELECT * FROM feedback;

CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    feedback_content TEXT,
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) 
);


CREATE TABLE special_day (
	special_day_id int AUTO_INCREMENT PRIMARY KEY,      
    special_day_content text DEFAULT NULL,
    special_day_date datetime DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE question (
	question_id int AUTO_INCREMENT PRIMARY KEY,      
    question_content text DEFAULT NULL,
    question_date datetime DEFAULT CURRENT_TIMESTAMP
    status enum('done','pending') DEFAULT pending
);

ALTER TABLE question
ADD COLUMN user_id INT,
ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);

-- FAQ 表
CREATE TABLE FAQ (
    faq_id INT AUTO_INCREMENT PRIMARY KEY,
    faq_question TEXT NOT NULL,
    faq_content TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;