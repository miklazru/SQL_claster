SELECT vf.name
FROM v_persons_female AS vf  

UNION 

SELECT vm.name
FROM v_persons_male AS vm
ORDER BY name ASC