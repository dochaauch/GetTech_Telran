-- домашнее задание
-- кто больше сделал донатов
/*Задача (1)	
- вывести ТОП-1 юзеров по сумме донатов 		
(КТО БОЛЬШЕ ПОЖЕРТВОВАЛ ДОНАТОВ)			
- поля		
- имя_юзера		
- сумма донатов*/	
SELECT u.fullname, sum(amount) as sum
FROM donations d
LEFT JOIN users u ON u.user_id=d.donator_id
GROUP BY u.fullname
ORDER BY sum desc
limit 1;

--топ 3 по сумме собранных донатов
/*ЗАДАЧА (2)	
- вывести ТОП-3 юзеров по сумме собранных донатов			
- поля		
- имя_юзера		
- сумма_собранных_донатов*/
SELECT u.fullname, sum(amount) as sum
FROM donations d
LEFT JOIN streams s ON s.stream_id = d.stream_id
LEFT JOIN users u ON u.user_id = s.user_id
GROUP BY u.fullname
ORDER BY sum desc
limit 3;






create database if not exists onlinechat;
use onlinechat;

create table if not exists users(
    user_id integer PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(64) NOT NULL,
    is_blocked BOOLEAN DEFAULT false,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

create table if not exists  reaction_types(
    type_id integer PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50),
    type_memo VARCHAR(256),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

create table if not exists chats(
    chat_id int PRIMARY KEY AUTO_INCREMENT,
    chat_title VARCHAR(256),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

create table if not exists messages(
    message_id int PRIMARY KEY AUTO_INCREMENT,
    chat_id int,
    user_id int,
    message VARCHAR(256),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(chat_id) REFERENCES chats(chat_id),
    Foreign Key (user_id) REFERENCES users(user_id)
);



create table if not exists reactions(
    reaction_id integer PRIMARY KEY AUTO_INCREMENT,
    reaction_type integer,
    message_id integer,
    user_id integer,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reaction_type) REFERENCES reaction_types(type_id),
    FOREIGN KEY (message_id) REFERENCES messages(message_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    UNIQUE (message_id, user_id)
);



START TRANSACTION;


INSERT INTO users (fullname, email)
VALUES ('John Doe', 'johndoe@example.com');

INSERT INTO reaction_types (type, type_memo)
VALUES ('Like', 'Positive reaction');

INSERT INTO chats (chat_title)
VALUES ('General');

INSERT INTO messages (chat_id, user_id, message)
VALUES (1, LAST_INSERT_ID(), 'Hello everyone!');

INSERT INTO reactions (reaction_type, message_id, user_id)
VALUES (LAST_INSERT_ID(), LAST_INSERT_ID(), LAST_INSERT_ID());

COMMIT;
