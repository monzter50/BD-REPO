 select jugador.id, jugador.fechanacimiento, persona.nombre, persona.apellido, equipos.nombre from jugador inner join persona on jugador.idpersona = persona.id inner join equipos on jugador.idequipo = equipos.id;
select jugador.id, jugador.fechanacimiento, persona.nombre, persona.apellido, equipos.nombre from jugador inner join persona on jugador.idpersona = persona.id inner join equipos on jugador.idequipo = equipos.id where jugador.idequipo = 2;


SELECT JORNADA.IDLOCAL, EQUIPOS.NOMBRE, SUM(JORNADA.GOLESLOCAL) FROM JORNADA INNER JOIN EQUIPOS ON EQUIPOS.ID = JORNADA.IDLOCAL GROUP BY EQUIPOS.NOMBRE, JORNADA.IDLOCAL;

SELECT JORNADA.IDLOCAL, JORNADA.IDVISITAS, VISITAS.NOMBRE, LOCAL.NOMBRE FROM JORNADA INNER JOIN EQUIPOS AS VISITAS ON VISITAS.ID = JORNADA.IDVISITAS INNER JOIN EQUIPOS AS LOCAL ON LOCAL.ID = JORNADA.IDLOCAL;

SELECT VISITAS.NOMBRE, LOCAL.NOMBRE,SUM(JORNADA.GOLESLOCAL), SUM(JORNADA.GOLESVISITAS) FROM JORNADA INNER JOIN EQUIPOS AS VISITAS ON VISITAS.ID = JORNADA.IDVISITAS INNER JOIN EQUIPOS AS LOCAL ON LOCAL.ID = JORNADA.IDLOCAL GROUP BY VISITAS.NOMBRE,LOCAL.NOMBRE ;

SELECT VISITAS.NOMBRE, LOCAL.NOMBRE,SUM(JORNADA.GOLESLOCAL), SUM(JORNADA.GOLESVISITAS) FROM JORNADA INNER JOIN EQUIPOS AS VISITAS ON VISITAS.ID = JORNADA.IDVISITAS INNER JOIN EQUIPOS AS LOCAL ON LOCAL.ID = JORNADA.IDLOCAL GROUP BY VISITAS.NOMBRE,LOCAL.NOMBRE ;

SELECT VISITAS.NOMBRE, LOCAL.NOMBRE, CANCHA.NOMBRE, JORNADA.FECHA  FROM JORNADA INNER JOIN EQUIPOS AS VISITAS ON VISITAS.ID = JORNADA.IDVISITAS INNER JOIN EQUIPOS AS LOCAL ON LOCAL.ID = JORNADA.IDLOCAL INNER JOIN CANCHA ON CANCHA.ID = JORNADA.IDCANCHA;

-- Sum de todos los goles de todos los equipos

SELECT 
	EQUIPOS.ID,
	EQUIPOS.NOMBRE ,
	SUM(CASE WHEN EQUIPOS.ID=JORNADA.IDLOCAL THEN JORNADA.GOLESLOCAL ELSE 0 END) AS "GOLES LOCALES", 
	SUM(CASE WHEN EQUIPOS.ID=JORNADA.IDVISITAS THEN JORNADA.GOLESVISITAS ELSE 0 END) AS "GOLES VISITAS",
	(SUM(CASE WHEN EQUIPOS.ID=JORNADA.IDLOCAL THEN JORNADA.GOLESLOCAL ELSE 0 END) +
	SUM(CASE WHEN EQUIPOS.ID=JORNADA.IDVISITAS THEN JORNADA.GOLESVISITAS ELSE 0 END) )AS "TOTALES DE GOLES"
FROM EQUIPOS  
	INNER JOIN JORNADA ON JORNADA.IDLOCAL = EQUIPOS.ID OR JORNADA.IDVISITAS = EQUIPOS.ID 
	GROUP BY EQUIPOS.NOMBRE,EQUIPOS.ID 
	ORDER BY EQUIPOS.ID;

-- Sum de todos los goles de cada jugador

    SELECT PERSONA.NOMBRE,PERSONA.APELLIDO, EQUIPOS.NOMBRE ,SUM(PUNTUAJE_POR_JUGADOR.GOLES) 
FROM PUNTUAJE_POR_JUGADOR 
INNER JOIN JUGADOR ON JUGADOR.ID = PUNTUAJE_POR_JUGADOR.IDJUGADOR 
INNER JOIN PERSONA ON PERSONA.ID = JUGADOR.IDPERSONA
INNER JOIN EQUIPOS ON EQUIPOS.ID = JUGADOR.IDEQUIPO
GROUP BY PERSONA.NOMBRE, PERSONA.APELLIDO, EQUIPOS.NOMBRE ORDER BY SUM(PUNTUAJE_POR_JUGADOR.GOLES) DESC;