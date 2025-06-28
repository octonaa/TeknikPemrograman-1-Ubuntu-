CREATE DATABASE test_db;
CREATE USER 'test_user'@'localhost' IDENTIFIED BY 'testpass';
GRANT ALL PRIVILEGES ON test_db.* TO 'test_user'@'localhost';
FLUSH PRIVILEGES;
