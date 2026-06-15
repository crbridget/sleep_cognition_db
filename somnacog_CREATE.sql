DROP DATABASE IF EXISTS somnacog;
CREATE DATABASE somnacog;
USE somnacog;

DROP TABLE IF EXISTS subject_diagnoses;
DROP TABLE IF EXISTS test_results;
DROP TABLE IF EXISTS sleep_sessions;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS cognitive_tests;
DROP TABLE IF EXISTS sleep_disorders;

-- subjects
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    age INT NOT NULL,
    gender VARCHAR(50),
    occupation VARCHAR(20),
    bmi_category VARCHAR(20),
    systolic INT,
    diastolic INT,
    heart_rate INT,
    daily_steps INT,
    physical_activity_min INT,
    stress_level INT,
    smoking_status VARCHAR(10),
    caffeine_mg INT
);

-- cognitive_tests
CREATE TABLE cognitive_tests (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    test_name VARCHAR(100) NOT NULL UNIQUE,
    cognitive_domain VARCHAR(50) NOT NULL,
    score_range_min INT NOT NULL,
    score_range_max INT NOT NULL,
    description VARCHAR(255)
);

-- sleep_disorders
CREATE TABLE sleep_disorders (
    disorder_id INT PRIMARY KEY AUTO_INCREMENT,
    disorder_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

-- sleep_sessions
CREATE TABLE sleep_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    session_date DATE NOT NULL,
    bedtime TIME,
    wakeup_time TIME,
    total_sleep_hrs DECIMAL(4,2) NOT NULL,
    sleep_quality_score INT,
    sleep_efficiency DECIMAL(5,2),
    rem_pct DECIMAL(5,2),
    deep_sleep_pct DECIMAL(5,2),
    light_sleep_pct DECIMAL(5,2),
    awakenings INT,
    subject_id INT NOT NULL,
    CONSTRAINT session_subject_fk
        FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id)
);

-- test_results
CREATE TABLE test_results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    score DECIMAL(6,2) NOT NULL,
    test_date DATE NOT NULL,
    subject_id INT NOT NULL,
    test_id INT NOT NULL,
    CONSTRAINT result_subject_fk
        FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id),
    CONSTRAINT result_test_fk
        FOREIGN KEY (test_id)
        REFERENCES cognitive_tests (test_id)
);

-- subject_diagnoses
CREATE TABLE subject_diagnoses (
    diagnosis_id INT PRIMARY KEY AUTO_INCREMENT,
    diagnosis_date DATE,
    severity VARCHAR(20),
    subject_id INT NOT NULL,
    disorder_id INT NOT NULL,
    CONSTRAINT diagnosis_subject_fk
        FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id),
    CONSTRAINT diagnosis_disorder_fk
        FOREIGN KEY (disorder_id)
        REFERENCES sleep_disorders (disorder_id),
    CONSTRAINT uq_subject_disorder UNIQUE (subject_id, disorder_id)
);

-- subjects
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (58, 'Male', 'Nurse', 'Overweight', 115, 74, 63, 14066, 23, 9, 'Never', 200);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (45, 'Male', 'Nurse', 'Underweight', 113, 74, 87, 11863, 13, 9, 'Never', 300);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (59, 'Non-binary', 'Retired', 'Obese', 114, 88, 92, 6557, 113, 1, 'Never', 300);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (45, 'Female', 'Lawyer', 'Normal', 113, 81, 61, 3519, 58, 2, 'Former', 400);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (40, 'Non-binary', 'Lawyer', 'Underweight', 146, 89, 89, 4045, 58, 2, 'Current', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (71, 'Non-binary', 'Freelancer', 'Overweight', 136, 72, 100, 3139, 15, 4, 'Former', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (72, 'Male', 'Engineer', 'Obese', 117, 89, 95, 7977, 30, 6, 'Former', 50);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (60, 'Female', 'Engineer', 'Normal', 134, 75, 65, 9573, 58, 5, 'Current', 300);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (53, 'Male', 'Student', 'Underweight', 114, 62, 75, 8572, 44, 2, 'Never', 200);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (74, 'Non-binary', 'Student', 'Normal', 141, 91, 80, 12532, 68, 3, 'Former', 50);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (33, 'Non-binary', 'Retired', 'Overweight', 147, 97, 82, 11560, 61, 6, 'Never', 50);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (50, 'Female', 'Engineer', 'Underweight', 155, 67, 64, 12280, 30, 7, 'Current', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (42, 'Female', 'Freelancer', 'Obese', 133, 76, 90, 2188, 97, 2, 'Current', 200);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (66, 'Female', 'Student', 'Underweight', 118, 87, 65, 9433, 10, 5, 'Current', 400);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (29, 'Non-binary', 'Engineer', 'Overweight', 153, 100, 87, 11977, 35, 3, 'Former', 400);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (28, 'Non-binary', 'Retired', 'Underweight', 138, 80, 86, 2319, 24, 6, 'Former', 50);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (21, 'Male', 'Freelancer', 'Underweight', 105, 91, 59, 14461, 78, 3, 'Never', 300);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (48, 'Non-binary', 'Teacher', 'Overweight', 133, 98, 82, 5470, 79, 4, 'Current', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (43, 'Non-binary', 'Student', 'Obese', 157, 93, 83, 3982, 41, 4, 'Never', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (19, 'Non-binary', 'Retired', 'Normal', 137, 74, 55, 3163, 100, 1, 'Never', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (75, 'Male', 'Student', 'Underweight', 132, 75, 72, 12960, 72, 4, 'Current', 50);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (64, 'Non-binary', 'Freelancer', 'Obese', 115, 90, 81, 5119, 22, 2, 'Current', 150);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (40, 'Female', 'Manager', 'Obese', 155, 63, 98, 12706, 92, 2, 'Never', 150);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (64, 'Female', 'Engineer', 'Normal', 112, 72, 89, 9350, 27, 7, 'Never', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (47, 'Male', 'Engineer', 'Obese', 151, 95, 61, 2828, 93, 9, 'Never', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (66, 'Male', 'Teacher', 'Obese', 131, 90, 68, 8570, 17, 3, 'Former', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (42, 'Female', 'Driver', 'Overweight', 127, 95, 97, 13770, 72, 3, 'Never', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (31, 'Male', 'Freelancer', 'Underweight', 147, 80, 58, 2821, 84, 8, 'Current', 400);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (51, 'Male', 'Nurse', 'Underweight', 154, 71, 59, 11749, 18, 4, 'Former', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (74, 'Non-binary', 'Doctor', 'Underweight', 139, 65, 81, 12770, 84, 10, 'Current', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (34, 'Male', 'Student', 'Normal', 116, 85, 63, 13004, 92, 5, 'Former', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (66, 'Male', 'Nurse', 'Obese', 139, 96, 61, 3200, 78, 4, 'Current', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (26, 'Female', 'Engineer', 'Normal', 123, 78, 65, 9179, 116, 9, 'Current', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (57, 'Non-binary', 'Retired', 'Underweight', 142, 95, 74, 12868, 23, 3, 'Former', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (74, 'Male', 'Retired', 'Normal', 117, 78, 93, 5450, 101, 6, 'Never', 300);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (58, 'Female', 'Retired', 'Obese', 116, 63, 60, 12392, 64, 5, 'Never', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (39, 'Male', 'Lawyer', 'Normal', 147, 88, 90, 13561, 64, 9, 'Never', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (22, 'Non-binary', 'Teacher', 'Underweight', 153, 83, 92, 11052, 28, 7, 'Never', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (37, 'Female', 'Nurse', 'Overweight', 113, 75, 97, 3684, 55, 9, 'Former', 200);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (65, 'Male', 'Doctor', 'Normal', 151, 71, 81, 2406, 32, 6, 'Former', 400);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (60, 'Non-binary', 'Doctor', 'Overweight', 110, 66, 79, 2634, 119, 8, 'Never', 50);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (70, 'Female', 'Student', 'Overweight', 152, 74, 69, 2387, 94, 4, 'Former', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (35, 'Male', 'Lawyer', 'Overweight', 141, 92, 80, 13133, 117, 9, 'Former', 0);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (25, 'Female', 'Teacher', 'Overweight', 102, 66, 93, 9119, 54, 6, 'Former', 200);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (50, 'Male', 'Manager', 'Normal', 116, 62, 100, 9144, 10, 9, 'Current', 300);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (64, 'Non-binary', 'Doctor', 'Overweight', 127, 64, 97, 7409, 89, 6, 'Current', 400);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (25, 'Non-binary', 'Lawyer', 'Overweight', 142, 86, 75, 8592, 99, 5, 'Current', 50);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (30, 'Female', 'Manager', 'Normal', 139, 96, 74, 8653, 80, 1, 'Former', 100);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (31, 'Female', 'Freelancer', 'Overweight', 129, 88, 83, 13069, 37, 9, 'Former', 400);
INSERT INTO subjects (age, gender, occupation, bmi_category, systolic, diastolic, heart_rate, daily_steps, physical_activity_min, stress_level, smoking_status, caffeine_mg) VALUES (75, 'Non-binary', 'Teacher', 'Underweight', 118, 92, 97, 12370, 89, 6, 'Never', 400);

-- cognitive_tests
INSERT INTO cognitive_tests (test_name, cognitive_domain, score_range_min, score_range_max, description) VALUES ('Word Recall Test', 'Memory', 0, 100, 'Measures memory performance');
INSERT INTO cognitive_tests (test_name, cognitive_domain, score_range_min, score_range_max, description) VALUES ('Sustained Attention Test', 'Attention', 0, 100, 'Measures attention performance');
INSERT INTO cognitive_tests (test_name, cognitive_domain, score_range_min, score_range_max, description) VALUES ('Psychomotor Vigilance Test', 'Reaction Time', 100, 500, 'Measures reaction time performance');
INSERT INTO cognitive_tests (test_name, cognitive_domain, score_range_min, score_range_max, description) VALUES ('Trail Making Test', 'Executive Function', 0, 100, 'Measures executive function performance');
INSERT INTO cognitive_tests (test_name, cognitive_domain, score_range_min, score_range_max, description) VALUES ('N-Back Test', 'Working Memory', 0, 100, 'Measures working memory performance');
INSERT INTO cognitive_tests (test_name, cognitive_domain, score_range_min, score_range_max, description) VALUES ('Pattern Recognition Test', 'Visual Learning', 0, 100, 'Measures visual learning performance');

-- sleep_disorders
INSERT INTO sleep_disorders (disorder_name, category, description) VALUES ('Insomnia', 'Dyssomnias', 'Difficulty falling or staying asleep');
INSERT INTO sleep_disorders (disorder_name, category, description) VALUES ('Obstructive Sleep Apnea', 'Breathing-Related', 'Repeated upper airway obstruction during sleep');
INSERT INTO sleep_disorders (disorder_name, category, description) VALUES ('Narcolepsy', 'Hypersomnolence', 'Excessive daytime sleepiness with sudden sleep attacks');
INSERT INTO sleep_disorders (disorder_name, category, description) VALUES ('Restless Leg Syndrome', 'Movement-Related', 'Uncomfortable sensations in legs causing urge to move');
INSERT INTO sleep_disorders (disorder_name, category, description) VALUES ('Circadian Rhythm Disorder', 'Circadian', 'Misalignment between internal clock and external environment');

-- sleep_sessions
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-07', '22:15:00', '04:00:00', 3.5, 2, 80.97, 14.11, 18.79, 56.34, 6, 1);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-10', '00:15:00', '06:00:00', 7.12, 6, 81.36, 9.38, 17.56, 61.1, 7, 1);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-12', '22:00:00', '06:15:00', 6.46, 6, 74.22, 21.5, 18.87, 48.5, 8, 2);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-06', '00:15:00', '08:45:00', 4.02, 4, 80.87, 12.93, 14.9, 64.42, 1, 2);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-30', '23:30:00', '06:00:00', 4.27, 5, 86.55, 3.78, 15.61, 70.18, 6, 3);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-01', '22:45:00', '06:00:00', 7.51, 6, 59.23, 9.54, 20.8, 56.13, 6, 3);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-02', '22:45:00', '04:30:00', 5.61, 6, 85.49, 10.59, 11.98, 67.76, 2, 3);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-20', '21:00:00', '05:15:00', 7.2, 7, 70.77, 9.09, 14.06, 63.05, 4, 4);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-03', '23:00:00', '07:00:00', 6.67, 8, 66.74, 1.37, 23.36, 69.87, 0, 4);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-12', '21:15:00', '03:15:00', 6.18, 7, 76.14, 12.62, 14.53, 61.79, 1, 5);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-24', '23:00:00', '08:00:00', 8.23, 8, 72.64, 26.33, 11.97, 50.78, 3, 5);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-03', '21:00:00', '04:45:00', 7.08, 8, 56.49, 18.4, 15.35, 56.91, 5, 6);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-23', '22:45:00', '04:30:00', 6.87, 6, 74.13, 26.51, 16.89, 48.38, 3, 6);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-22', '00:15:00', '08:45:00', 5.29, 5, 73.01, 15.85, 10.88, 65.47, 4, 7);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-11', '21:15:00', '02:15:00', 7.02, 7, 80.93, 21.67, 14.36, 51.04, 1, 7);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-23', '00:15:00', '07:30:00', 5.38, 5, 84.09, 9.12, 18.04, 65.13, 4, 8);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-28', '21:15:00', '04:00:00', 6.59, 5, 62.47, 17.27, 11.65, 60.18, 8, 8);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-24', '21:15:00', '04:15:00', 4.87, 5, 59.94, 3.41, 8.32, 80.35, 2, 8);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-22', '21:30:00', '05:45:00', 5.78, 5, 94.7, 14.55, 21.33, 55.11, 1, 9);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-22', '21:15:00', '03:30:00', 4.18, 4, 74.23, 16.92, 18.28, 52.04, 6, 9);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-18', '00:30:00', '09:45:00', 5.17, 5, 86.86, 23.95, 12.12, 56.82, 1, 9);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-02', '22:00:00', '04:00:00', 5.91, 5, 58.27, 14.51, 12.74, 59.15, 1, 10);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-29', '23:15:00', '07:00:00', 6.53, 6, 89.24, 10.18, 10.99, 70.75, 4, 10);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-04', '00:30:00', '08:30:00', 6.03, 5, 55.55, 17.39, 11.83, 63.28, 1, 11);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-27', '21:30:00', '06:00:00', 7.21, 7, 71.25, 14.31, 21.95, 54.38, 7, 11);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-16', '00:30:00', '08:30:00', 5.22, 5, 70.05, 18.66, 16.94, 55.4, 8, 11);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-20', '21:30:00', '04:30:00', 4.32, 4, 85.17, 10.02, 19.54, 60.82, 0, 12);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-06', '23:45:00', '07:00:00', 4.72, 5, 70.09, 23.97, 8.32, 52.98, 3, 12);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-08', '21:45:00', '02:15:00', 8.27, 7, 62.58, 21.64, 16.48, 49.71, 8, 13);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-19', '00:45:00', '08:15:00', 5.86, 6, 81.38, 19.93, 11.05, 63.32, 6, 13);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-16', '23:00:00', '06:30:00', 6.77, 6, 88.75, 8.93, 14.77, 67.98, 8, 14);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-12', '00:30:00', '06:15:00', 5.57, 6, 56.7, 14.89, 18.08, 53.92, 6, 14);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-18', '00:00:00', '06:30:00', 6.91, 6, 75.51, 9.14, 18.34, 63.42, 2, 14);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-28', '23:30:00', '08:45:00', 6.12, 5, 90.51, 7.6, 13.25, 66.96, 7, 15);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-04', '21:00:00', '03:30:00', 7.69, 7, 60.84, 12.67, 21.59, 56.3, 4, 15);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-24', '23:00:00', '06:30:00', 5.46, 6, 76.07, 24.6, 9.55, 60.06, 6, 16);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-03', '00:15:00', '06:45:00', 6.65, 6, 89.06, 18.06, 11.31, 60.16, 1, 16);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-25', '23:45:00', '06:45:00', 7.25, 7, 75.85, 7.24, 17.08, 64.93, 4, 17);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-12', '00:30:00', '05:00:00', 7.55, 7, 92.21, 18.01, 11.95, 57.02, 3, 17);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-07', '23:15:00', '04:00:00', 4.84, 5, 85.56, 4.3, 12.93, 70.3, 2, 17);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-08', '23:30:00', '05:30:00', 7.96, 7, 67.51, 24.91, 20.06, 45.35, 1, 18);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-13', '22:45:00', '07:30:00', 4.26, 4, 60.82, 14.87, 19.24, 58.27, 6, 18);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-25', '22:45:00', '03:30:00', 7.97, 8, 88.13, 25.69, 12.53, 52.7, 2, 19);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-24', '21:30:00', '05:00:00', 4.29, 3, 73.69, 20.91, 19.15, 45.48, 6, 19);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-27', '22:45:00', '03:45:00', 6.62, 5, 82.92, 11.85, 14.67, 66.12, 5, 19);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-07', '23:00:00', '07:30:00', 5.25, 6, 76.73, 23.26, 19.13, 46.64, 0, 20);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-26', '23:15:00', '05:15:00', 4.71, 3, 67.42, 27.39, 14.43, 51.7, 0, 20);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-15', '22:30:00', '04:00:00', 6.95, 7, 86.81, 13.51, 12.86, 66.89, 0, 21);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-05', '00:00:00', '05:45:00', 5.99, 6, 73.63, 13.18, 17.23, 57.32, 8, 21);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-03', '00:00:00', '05:45:00', 7.79, 7, 83.78, 17.62, 21.49, 52.67, 2, 21);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-05', '23:30:00', '07:30:00', 5.97, 5, 85.37, 23.31, 18.76, 45.24, 3, 22);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-08', '00:15:00', '08:30:00', 7.65, 8, 70.19, 12.5, 12.82, 60.14, 7, 22);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-16', '21:00:00', '05:00:00', 7.28, 7, 60.34, 25.38, 17.43, 45.49, 6, 23);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-30', '00:00:00', '07:30:00', 5.51, 5, 83.61, 10.73, 10.62, 65.2, 5, 23);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-22', '22:45:00', '07:00:00', 6.29, 6, 54.13, 12.97, 17.94, 54.87, 5, 24);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-04', '22:15:00', '07:45:00', 3.86, 3, 56.58, 18.11, 12.14, 60.21, 2, 24);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-08', '23:00:00', '04:15:00', 4.31, 4, 61.61, 23.24, 12.78, 54.56, 4, 25);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-20', '21:30:00', '05:00:00', 4.87, 4, 77.02, 10.91, 11.43, 66.67, 0, 25);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-14', '23:15:00', '05:30:00', 4.9, 5, 67.8, 12.58, 13.49, 66.63, 8, 25);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-06', '00:00:00', '08:00:00', 6.27, 6, 73.74, 18.09, 18.1, 55.91, 6, 26);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-11', '23:15:00', '08:45:00', 7.94, 6, 89.93, 14.87, 17.33, 57.56, 6, 26);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-07', '23:15:00', '06:15:00', 4.54, 4, 64.56, 25.52, 13.77, 46.13, 2, 26);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-22', '22:30:00', '04:15:00', 6.66, 6, 63.91, 22.96, 15.91, 48.59, 7, 27);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-16', '23:30:00', '05:45:00', 4.26, 4, 67.71, 8.62, 16.11, 67.17, 7, 27);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-30', '23:30:00', '04:00:00', 5.47, 5, 73.62, 15.84, 19.44, 55.22, 3, 28);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-13', '00:15:00', '05:45:00', 3.5, 2, 79.86, 10.09, 8.59, 73.84, 7, 28);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-25', '22:30:00', '05:30:00', 5.84, 5, 58.04, 22.62, 13.02, 56.06, 8, 29);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-16', '23:30:00', '08:15:00', 5.6, 5, 69.64, 29.35, 18.48, 43.25, 1, 29);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-07', '00:30:00', '06:00:00', 7.01, 7, 70.14, 13.61, 11.21, 60.7, 7, 29);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-25', '22:15:00', '03:30:00', 7.05, 8, 82.57, 25.17, 5.57, 60.89, 2, 30);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-11', '22:15:00', '04:15:00', 6.5, 7, 78.06, 26.89, 14.16, 46.43, 7, 30);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-30', '22:30:00', '06:15:00', 5.41, 5, 73.01, 13.14, 13.23, 63.36, 2, 31);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-12', '22:30:00', '03:45:00', 7.68, 7, 87.99, 24.52, 11.78, 51.07, 4, 31);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-19', '22:45:00', '03:15:00', 7.53, 7, 72.18, 15.43, 13.61, 62.1, 1, 32);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-10', '22:00:00', '05:00:00', 7.63, 7, 61.37, 13.24, 20.45, 54.35, 2, 32);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-28', '00:00:00', '05:00:00', 5.0, 4, 84.36, 18.06, 9.67, 64.39, 4, 32);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-25', '22:45:00', '07:45:00', 3.63, 2, 71.91, 20.14, 14.13, 53.54, 4, 33);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-07', '21:30:00', '03:45:00', 4.19, 3, 65.06, 26.57, 13.66, 46.91, 8, 33);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-18', '00:00:00', '08:30:00', 5.34, 6, 70.45, 24.66, 17.92, 44.7, 5, 34);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-09', '21:30:00', '06:30:00', 7.86, 8, 75.12, 23.91, 17.98, 45.0, 1, 34);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-19', '23:15:00', '04:15:00', 7.14, 7, 69.53, 18.81, 14.1, 61.72, 3, 35);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-26', '23:00:00', '06:30:00', 3.71, 4, 82.99, 20.39, 12.8, 52.07, 7, 35);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-11', '23:30:00', '04:45:00', 3.51, 3, 75.27, 8.92, 8.2, 71.27, 4, 35);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-06', '22:45:00', '05:45:00', 4.19, 3, 93.93, 15.49, 22.2, 47.83, 1, 36);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-26', '23:15:00', '04:15:00', 7.82, 7, 59.92, 14.72, 17.18, 59.48, 0, 36);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-19', '00:30:00', '07:45:00', 7.43, 7, 70.52, 22.99, 11.24, 59.64, 2, 36);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-22', '00:00:00', '07:30:00', 6.77, 7, 78.07, 29.97, 8.5, 55.17, 1, 37);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-19', '22:45:00', '03:30:00', 6.61, 6, 62.32, 16.0, 7.86, 64.04, 2, 37);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-04', '22:00:00', '04:15:00', 4.67, 4, 73.32, 19.35, 20.25, 54.1, 1, 37);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-07', '00:45:00', '09:45:00', 7.26, 6, 90.92, 22.85, 13.25, 52.1, 5, 38);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-06', '22:15:00', '06:00:00', 7.54, 7, 59.32, 28.69, 9.88, 46.96, 8, 38);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-10', '23:15:00', '08:30:00', 3.66, 4, 70.6, 8.37, 19.62, 65.47, 5, 39);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-15', '21:00:00', '02:00:00', 7.37, 6, 59.22, 16.44, 14.77, 63.49, 8, 39);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-28', '23:45:00', '05:45:00', 4.44, 4, 68.14, 14.69, 8.56, 65.68, 5, 39);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-25', '00:15:00', '07:00:00', 4.34, 4, 63.67, 1.94, 11.35, 77.87, 6, 40);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-07', '22:30:00', '07:30:00', 3.75, 4, 72.21, 17.58, 14.46, 62.06, 6, 40);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-15', '00:15:00', '06:30:00', 3.5, 4, 86.87, 13.45, 11.29, 70.18, 1, 40);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-09', '23:30:00', '07:30:00', 3.78, 4, 66.14, 14.52, 11.8, 64.18, 8, 41);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-23', '21:15:00', '02:45:00', 5.25, 4, 66.26, 11.64, 15.04, 64.31, 0, 41);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-24', '21:15:00', '04:45:00', 5.91, 7, 57.45, 27.38, 10.78, 52.91, 4, 41);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-16', '00:30:00', '08:00:00', 5.51, 5, 78.76, 23.44, 18.88, 45.8, 0, 42);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-30', '23:15:00', '04:45:00', 4.62, 4, 88.81, 10.46, 18.21, 66.01, 1, 42);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-07', '21:45:00', '04:45:00', 4.53, 4, 86.22, 25.91, 21.09, 40.64, 0, 42);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-22', '22:30:00', '06:45:00', 5.01, 6, 64.35, 17.09, 17.08, 53.62, 4, 43);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-04', '22:15:00', '05:30:00', 4.61, 3, 62.27, 14.15, 16.07, 61.61, 5, 43);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-27', '21:45:00', '05:30:00', 7.7, 6, 65.22, 19.28, 12.2, 59.1, 4, 44);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-09-02', '22:15:00', '07:30:00', 7.6, 6, 78.01, 16.74, 10.64, 60.92, 8, 44);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-25', '22:00:00', '03:45:00', 4.89, 5, 59.36, 24.29, 21.67, 47.46, 7, 44);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-12', '23:30:00', '06:00:00', 6.94, 7, 71.87, 16.96, 19.55, 49.36, 2, 45);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-01', '22:00:00', '06:45:00', 3.69, 3, 62.29, 3.25, 9.98, 75.74, 5, 45);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-25', '00:45:00', '06:45:00', 4.08, 3, 79.51, 15.47, 16.28, 63.11, 5, 45);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-10-17', '22:15:00', '07:45:00', 6.62, 6, 80.1, 3.7, 9.11, 78.95, 3, 46);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-01-04', '23:45:00', '05:45:00', 6.29, 5, 82.19, 0.23, 16.81, 71.03, 0, 46);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-01', '00:30:00', '06:45:00', 5.99, 5, 84.02, 13.81, 16.58, 55.2, 5, 46);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-22', '22:45:00', '04:45:00', 7.24, 6, 76.42, 18.17, 15.56, 54.63, 3, 47);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-06', '21:45:00', '06:30:00', 4.23, 3, 76.36, 18.86, 16.09, 58.55, 5, 47);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-02-29', '22:45:00', '03:45:00', 7.79, 7, 76.82, 8.65, 16.44, 61.84, 0, 48);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-07-21', '23:00:00', '05:00:00', 4.35, 4, 97.77, 26.19, 10.54, 48.93, 0, 48);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-05-26', '00:15:00', '06:45:00', 5.84, 5, 94.77, 15.05, 10.7, 59.61, 8, 48);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-06-27', '21:15:00', '06:45:00', 4.98, 4, 51.14, 0.45, 9.98, 77.84, 8, 49);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-08-05', '00:15:00', '06:45:00', 4.16, 5, 79.28, 2.26, 17.64, 70.91, 0, 49);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-04-15', '21:00:00', '06:00:00', 4.91, 4, 63.54, 0.88, 13.58, 75.14, 0, 50);
INSERT INTO sleep_sessions (session_date, bedtime, wakeup_time, total_sleep_hrs, sleep_quality_score, sleep_efficiency, rem_pct, deep_sleep_pct, light_sleep_pct, awakenings, subject_id) VALUES ('2024-03-12', '23:15:00', '08:30:00', 5.5, 5, 63.24, 17.53, 21.79, 50.47, 6, 50);

-- test_results
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (443.63, '2024-09-11', 1, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-09-11', 1, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (72.74, '2024-09-11', 1, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (58.72, '2024-09-11', 1, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (2.55, '2024-08-07', 2, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (7.69, '2024-10-13', 2, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (330.22, '2024-10-13', 2, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (58.52, '2024-10-13', 2, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (23.86, '2024-05-01', 3, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (31.72, '2024-05-01', 3, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (85.0, '2024-02-02', 3, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (10.32, '2024-10-03', 3, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (58.63, '2024-07-21', 4, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (432.09, '2024-07-21', 4, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (70.42, '2024-07-21', 4, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (23.06, '2024-04-13', 5, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (458.62, '2024-04-13', 5, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (71.22, '2024-03-25', 5, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (86.3, '2024-04-13', 5, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (36.26, '2024-08-24', 6, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (29.76, '2024-08-24', 6, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (343.84, '2024-08-24', 6, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (43.94, '2024-08-24', 6, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (1.11, '2024-05-23', 7, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (432.38, '2024-05-23', 7, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (20.47, '2024-10-12', 7, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (23.57, '2024-05-23', 7, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (43.56, '2024-05-25', 8, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (24.38, '2024-04-29', 8, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (80.99, '2024-05-25', 8, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (60.56, '2024-04-29', 8, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (14.6, '2024-08-19', 9, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (316.49, '2024-08-19', 9, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (91.13, '2024-02-23', 9, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (40.12, '2024-05-03', 10, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (9.12, '2024-05-03', 10, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (3.82, '2024-04-30', 10, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (40.91, '2024-03-05', 11, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (44.9, '2024-04-28', 11, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-02-17', 11, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (426.66, '2024-02-17', 11, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (5.63, '2024-08-21', 12, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (43.19, '2024-08-21', 12, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (13.27, '2024-04-07', 12, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (69.37, '2024-04-07', 12, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (52.85, '2024-06-09', 13, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (259.99, '2024-06-09', 13, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (60.84, '2024-06-09', 13, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (10.42, '2024-05-20', 13, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-09-17', 14, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-07-13', 14, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (50.04, '2024-07-13', 14, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (369.76, '2024-09-17', 14, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (20.4, '2024-08-29', 15, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (57.6, '2024-10-05', 15, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (76.94, '2024-08-29', 15, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (386.11, '2024-05-04', 16, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (80.6, '2024-05-04', 16, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (11.62, '2024-01-25', 16, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (66.0, '2024-06-26', 17, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (69.14, '2024-04-08', 17, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (397.25, '2024-04-08', 17, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (65.09, '2024-01-13', 17, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (75.48, '2024-03-14', 18, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (54.47, '2024-03-14', 18, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (87.2, '2024-03-14', 18, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (44.15, '2024-01-25', 19, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (355.91, '2024-01-25', 19, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (38.87, '2024-10-28', 19, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (72.18, '2024-07-08', 20, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (32.12, '2024-01-27', 20, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (373.5, '2024-07-08', 20, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (74.57, '2024-01-27', 20, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (41.03, '2024-03-06', 21, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (10.2, '2024-03-16', 21, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (17.87, '2024-03-06', 21, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (51.13, '2024-06-04', 21, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (52.88, '2024-08-09', 22, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (80.73, '2024-03-06', 22, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (29.27, '2024-08-09', 22, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (73.13, '2024-03-06', 22, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (15.5, '2024-07-01', 23, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (27.16, '2024-02-17', 23, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (8.69, '2024-07-01', 23, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (26.5, '2024-05-23', 24, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (436.27, '2024-01-05', 24, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (47.44, '2024-05-23', 24, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (35.21, '2024-05-23', 24, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (26.19, '2024-04-21', 25, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (31.62, '2024-04-21', 25, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (484.64, '2024-04-15', 25, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (79.68, '2024-06-09', 25, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (274.25, '2024-01-12', 26, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (91.19, '2024-01-12', 26, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (70.14, '2024-06-08', 26, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (48.19, '2024-06-08', 26, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (424.95, '2024-10-17', 27, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (34.85, '2024-02-23', 27, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (55.3, '2024-02-23', 27, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (25.46, '2024-06-14', 28, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (60.82, '2024-01-31', 28, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (59.71, '2024-06-14', 28, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (61.28, '2024-06-08', 29, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (316.94, '2024-07-17', 29, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (8.66, '2024-06-08', 29, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (45.13, '2024-07-17', 29, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (68.6, '2024-04-26', 30, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-04-26', 30, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (447.28, '2024-07-12', 30, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (2.97, '2024-04-26', 30, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (229.58, '2024-10-01', 31, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (43.96, '2024-10-01', 31, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (38.12, '2024-04-13', 31, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (39.68, '2024-10-01', 31, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (37.44, '2024-09-20', 32, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (10.45, '2024-08-29', 32, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (12.75, '2024-07-11', 32, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (30.88, '2024-09-20', 32, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (456.6, '2024-08-08', 33, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (18.7, '2024-08-08', 33, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-01-26', 33, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-08-08', 33, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (50.44, '2024-07-19', 34, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (33.79, '2024-03-10', 34, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (90.26, '2024-07-19', 34, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (51.16, '2024-05-27', 35, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-09-12', 35, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (71.48, '2024-05-27', 35, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (387.66, '2024-05-27', 35, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (25.05, '2024-03-20', 36, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (72.79, '2024-08-07', 36, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (51.96, '2024-03-20', 36, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (377.27, '2024-08-20', 37, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (52.36, '2024-08-20', 37, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (39.49, '2024-07-05', 37, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (6.28, '2024-03-07', 38, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (72.1, '2024-06-08', 38, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (69.24, '2024-03-07', 38, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (495.6, '2024-06-08', 38, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (331.61, '2024-02-11', 39, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (21.6, '2024-02-11', 39, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (33.97, '2024-10-16', 39, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (6.72, '2024-09-16', 40, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (38.36, '2024-09-16', 40, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (73.76, '2024-06-26', 40, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (9.84, '2024-05-24', 41, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (415.82, '2024-05-24', 41, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (78.67, '2024-05-24', 41, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (36.82, '2024-08-31', 42, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (37.41, '2024-08-31', 42, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (43.98, '2024-09-17', 42, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (16.74, '2024-09-05', 43, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (290.46, '2024-09-05', 43, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (42.91, '2024-09-05', 43, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (63.76, '2024-09-03', 44, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (42.78, '2024-05-28', 44, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (438.0, '2024-09-03', 44, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (12.79, '2024-04-13', 45, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (26.48, '2024-08-02', 45, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (63.6, '2024-04-13', 45, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (42.91, '2024-01-05', 46, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (67.49, '2024-03-02', 46, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (46.95, '2024-10-18', 46, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (394.85, '2024-10-18', 46, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (46.91, '2024-04-23', 47, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (28.13, '2024-05-07', 47, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (286.8, '2024-05-07', 47, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (95.32, '2024-05-27', 48, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (17.42, '2024-03-01', 48, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (28.47, '2024-05-27', 48, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (35.97, '2024-08-06', 49, 2);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (40.5, '2024-08-06', 49, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (24.68, '2024-06-28', 49, 5);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (20.26, '2024-08-06', 49, 1);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (0, '2024-04-16', 50, 4);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (55.78, '2024-03-13', 50, 6);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (400.45, '2024-03-13', 50, 3);
INSERT INTO test_results (score, test_date, subject_id, test_id) VALUES (66.51, '2024-03-13', 50, 5);

-- subject_diagnoses
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-05-18', 'Moderate', 1, 2);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-05-26', 'Moderate', 1, 4);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-01-24', 'Mild', 3, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-11-17', 'Moderate', 3, 1);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-08-22', 'Mild', 4, 4);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-05-09', 'Mild', 10, 1);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-07-10', 'Severe', 10, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-08-08', 'Severe', 12, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-02-16', 'Severe', 12, 2);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-02-09', 'Mild', 13, 4);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-12-22', 'Mild', 17, 1);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-09-02', 'Mild', 17, 4);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-02-22', 'Moderate', 18, 1);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-03-10', 'Severe', 19, 2);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-12-13', 'Mild', 19, 4);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-11-29', 'Mild', 20, 5);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-04-22', 'Mild', 24, 5);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-02-21', 'Mild', 24, 4);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-05-07', 'Moderate', 27, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-11-27', 'Mild', 27, 2);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-04-16', 'Severe', 28, 1);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-11-07', 'Severe', 28, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-05-03', 'Moderate', 29, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-07-17', 'Mild', 29, 1);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-01-07', 'Moderate', 30, 5);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-08-30', 'Mild', 32, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-01-09', 'Severe', 32, 2);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-01-31', 'Moderate', 33, 2);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-09-17', 'Moderate', 33, 1);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-02-12', 'Moderate', 38, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-10-02', 'Moderate', 39, 2);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-12-24', 'Moderate', 40, 3);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-03-01', 'Moderate', 43, 4);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-01-07', 'Severe', 45, 1);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-09-12', 'Moderate', 46, 2);
INSERT INTO subject_diagnoses (diagnosis_date, severity, subject_id, disorder_id) VALUES ('2023-03-02', 'Mild', 50, 3);

-- subjects: occupation and age are filtered/grouped in queries
CREATE INDEX idx_subjects_occupation ON subjects (occupation);
CREATE INDEX idx_subjects_age ON subjects (age);

-- sleep_sessions: subject_id joins to subjects on every query
CREATE INDEX idx_sleep_sessions_subject_id ON sleep_sessions (subject_id);
-- session_date: correlates sleep nights with cognitive test dates
CREATE INDEX idx_sleep_sessions_date ON sleep_sessions (session_date);
-- total_sleep_hrs: query 1 filters on sleep duration thresholds
CREATE INDEX idx_sleep_sessions_total_sleep ON sleep_sessions (total_sleep_hrs);
-- rem_pct: query 3 filters on top/bottom REM percentages
CREATE INDEX idx_sleep_sessions_rem ON sleep_sessions (rem_pct);

-- test_results: subject_id and test_id hit on every cognition query
CREATE INDEX idx_test_results_subject_id ON test_results (subject_id);
CREATE INDEX idx_test_results_test_id ON test_results (test_id);
-- test_date: used to correlate results with nearby sleep sessions
CREATE INDEX idx_test_results_date ON test_results (test_date);

-- subject_diagnoses: subject_id and disorder_id indexes are created
-- automatically by the UNIQUE constraint, no additional indexes needed