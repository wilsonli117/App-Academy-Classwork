PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY, 
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    associated_author INTEGER NOT NULL,

    FOREIGN KEY (associated_author) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY, 
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY, 
    body TEXT NOT NULL, 
    subject_question_id INTEGER NOT NULL, 
    author_id INTEGER NOT NULL,
    parent_reply_id INTEGER,

    FOREIGN KEY (subject_question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Nick', 'Draper'),
  ('Wilson', 'Li'),
  ('Alvin', 'Zablan'),
  ('Bruce', 'Banner'),
  ('Tony', 'Stark'),
  ('Bill', 'Clinton'),
  ('Hillary', 'Clinton'),
  ('Avril', 'Lavigne');

INSERT INTO
  questions (title, body, associated_author)
VALUES
  ('How to code?', 'I can''t find my keyboard', (SELECT id FROM users WHERE fname = 'Nick')),
  ('Life', 'What is the meaning of life?', (SELECT id FROM users WHERE fname = 'Wilson')),
  ('Burgers', 'Who has the best burgers?', 2),
  ('Hot Dogs', 'Who has the best hot-dogs?', 1),
  ('Elephants', 'How heavy can elephants get?', 1);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (1, 4),
  (2, 2),
  (2, 3),
  (1, 2),
  (3, 1),
  (3, 2),
  (3, 3),
  (3, 4);


INSERT INTO
    replies (body, subject_question_id, author_id, parent_reply_id)
VALUES
    ('Look down, it should be right there.', 1, 3, NULL),
    ('Hey Programmers! Ruby is the key to life', 2, 3, NULL),
    ('Oh I see it now. Thanks Alvin!', 1, 1, 1);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 4),
  (2, 4),
  (3, 4),
  (4, 4),
  (5, 4),
  (6, 4),
  (7, 4),
  (8, 4),
  (1, 1),
  (2, 1),
  (2, 2),
  (1, 2),
  (8, 2),
  (3, 3);
