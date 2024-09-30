WITH points AS ( SELECT DISTINCT tours.point1 AS pnt1, tours1.point1 AS pnt2, tours2.point1 AS pnt3, tours3.point1 AS pnt4, tours4.point1 AS pnt5 FROM tours
CROSS JOIN (SELECT point1 FROM tours) AS tours1
CROSS JOIN (SELECT point1 FROM tours) AS tours2
CROSS JOIN (SELECT point1 FROM tours) AS tours3
CROSS JOIN (SELECT point1 FROM tours) AS tours4

WHERE tours.point1 = 'a' AND tours4.point1 = 'a' AND tours1.point1 != 'a' AND tours2.point1 !='a' AND tours3.point1 != 'a'
AND tours1.point1 != tours2.point1 AND tours1.point1 != tours3.point1 AND tours2.point1 != tours3.point1
ORDER BY tours.point1, tours1.point1, tours2.point1, tours2.point1, tours3.point1
), total_costt AS (

SELECT pnt1, pnt2, pnt3, pnt4, pnt5, (SELECT cost FROM tours WHERE point1 = pnt1 AND point2 = pnt2) +
          (SELECT cost FROM tours WHERE point1 = pnt2 AND point2 = pnt3) +
          (SELECT cost FROM tours WHERE point1 = pnt3 AND point2 = pnt4) +
          (SELECT cost FROM tours WHERE point1 = pnt4 AND point2 = pnt5) AS cost FROM points
)

SELECT cost AS total_cost, CONCAT('{',pnt1,',',pnt2,',',pnt3,',',pnt4,',',pnt5,'}') AS tour FROM total_costt
WHERE cost = (SELECT MIN(cost) FROM total_costt) OR cost = (SELECT MAX(cost) FROM total_costt)
ORDER BY total_cost, tour