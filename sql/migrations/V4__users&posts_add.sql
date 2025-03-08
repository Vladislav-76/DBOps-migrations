WITH inserted_userd_id AS (
    INSERT INTO
        users (name)
    VALUES
        ('user_1'), ('user_2')
    RETURNING id
)

INSERT INTO
    posts (text, owner_id)
SELECT 
    CONCAT('post_', inserted_userd_id), id
FROM inserted_userd_id;
