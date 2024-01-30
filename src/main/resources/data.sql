-- Вставка данных в таблицу `users`
INSERT INTO demo.users (id, dob, dt, email, fio, phone, status) VALUES
    (1, '2024-01-10', '2024-01-10', 'test@mail.ru', 'VASILIY IVANOV', '998901234567', 1) on conflict do nothing;

-- Вставка данных в таблицу `cards`
INSERT INTO demo.cards (id, user_id, balance, card_expire, card_name, card_number, dt, status) VALUES
    (1, 1, 5000, '07/26', 'test', '86005004232', '2024-01-10 10:56:29', 1) on conflict do nothing;

-- Вставка данных в таблицу `cards_transactions`
INSERT INTO demo.cards_transactions (id, user_id, card_id, amount, dt, new_balance, old_balance, type) VALUES
    (1, 1, 1, 100, '2024-01-10 10:57:21', 5000, 5100, 'debit') on conflict do nothing;

-- Предположим, что есть еще один пользователь и его данные для вложенности
-- Вставка второго пользователя в `users`
INSERT INTO demo.users (id, dob, dt, email, fio, phone, status) VALUES
    (2, '2024-01-11', '2024-01-11', 'example@mail.com', 'ANNA PETROVA', '998901234568', 1) on conflict do nothing;

-- Вставка данных второй карты для второго пользователя в `cards`
INSERT INTO demo.cards (id, user_id, balance, card_expire, card_name, card_number, dt, status) VALUES
    (2, 2, 3000, '08/29', 'main', '86005004233', '2024-01-11 11:00:00', 1) on conflict do nothing;

-- Вставка транзакции для второй карты второго пользователя в `cards_transactions`
INSERT INTO demo.cards_transactions (id, user_id, card_id, amount, dt, new_balance, old_balance, type) VALUES
    (2, 2, 2, 150, '2024-01-11 11:02:00', 3150, 3000, 'credit') on conflict do nothing;
