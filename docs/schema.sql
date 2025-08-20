CREATE DATABASE IF NOT EXISTS discuss DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE discuss;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  address VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  category_id INT NOT NULL,
  user_id INT NOT NULL,
  INDEX (category_id),
  INDEX (user_id),
  CONSTRAINT fk_questions_category FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE,
  CONSTRAINT fk_questions_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS answers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  answer TEXT NOT NULL,
  question_id INT NOT NULL,
  user_id INT NOT NULL,
  INDEX (question_id),
  INDEX (user_id),
  CONSTRAINT fk_answers_question FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
  CONSTRAINT fk_answers_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

