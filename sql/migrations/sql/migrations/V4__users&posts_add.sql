WITH inserted_userd_id AS (
    INSERT INTO
        users ('name', 'email')
    VALUES
        ('user_1', 'email_1'),
        ('user_2', 'email_2')
    RETURNING id
)

INSERT INTO
    posts (text, owner_id)
SELECT id,
    (CONCAT('post_', inserted_userd_id), id),
FROM inserted_userd_id;
