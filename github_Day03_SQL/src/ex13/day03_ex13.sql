#у меня только так удаляется 

DELETE FROM person_visits
WHERE visit_date = '2022-02-25';

DELETE FROM person_order
WHERE menu_id = 19;

DELETE FROM menu
WHERE pizza_name = 'greek pizza';