COMMENT ON TABLE person_discounts IS 'Хранит информацию о скидках для клиентов в различных пиццериях.';

COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии.';
COMMENT ON COLUMN person_discounts.discount IS 'Процент скидки для клиента в данной пиццерии.';
