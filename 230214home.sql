/*Описание занятия: Задача
    - загрузить мои чаты (я - user_id=1)
    - поля
        -- мой собеседник (имя)
        -- посл/сообщ (текст)*/

SELECT c.topic, u.fullname AS partner, m2.max_created_at, m.text
FROM chats c
LEFT JOIN users u ON CASE WHEN c.user1_id = 1 THEN c.user2_id ELSE c.user1_id END = u.user_id

-- for normal case should be MAX(created_at), but here we have the same time
LEFT JOIN (
    SELECT chat_id, MAX(message_id) AS max_created_at
    FROM messages
    GROUP BY chat_id
) m2 ON c.chat_id = m2.chat_id

-- for normal case, but here we have the same time
--LEFT JOIN messages m ON m.chat_id = m2.chat_id AND m.created_at = m2.max_created_at
LEFT JOIN messages m ON m.chat_id = m2.chat_id AND m.message_id = m2.max_created_at

WHERE c.user1_id = 1 OR c.user2_id = 1
ORDER BY m.created_at DESC
;
