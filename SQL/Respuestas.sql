DROP TABLE IF EXISTS `results`;
CREATE TABLE IF NOT EXISTS `results` (
  	`resultId` 		int(11),
    `raceId` 		int(11),
	`driverId` 		int(11),
    `constructorId` 		int(11),
  	`grid` 	int(11),
    `positionOrder`			int(11),
     `points`			float,
     `laps`			int(11),
     `statusId`			int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	


SET SESSION sql_mode = ''

LOAD DATA INFILE 'd:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\results.csv'
INTO TABLE `results` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


SELECT count(raceId) as Cantidad_de_Carreras, year
FROM races2
group by year
order by 1 desc
limit 1



SELECT r.driverId, driverRef as Piloto, count(positionOrder) as Cantidad_de_Primeros_Puestos
FROM results as r
join drivers as d on r.driverId=d.driverId
where positionOrder = 1
group by r.driverId
order by 1 desc
limit 1


SELECT count(circuitId), circuitId, name
FROM races2
group by circuitId
order by 1 desc
limit 1


SELECT sum(r.points), r.driverId , d.driverRef#,c.nationality
FROM results as r
join drivers as d on r.driverId=d.driverId
join constructors as c on r.constructorId=c.constructorId 
where c.nationality = "British" #or c.nationality ="American"
group by r.driverId
order by 1 desc
limit 1



ALTER TABLE `results` ADD PRIMARY KEY(`resultId`)
ALTER TABLE `results` ADD INDEX(`raceId`)
ALTER TABLE `results` ADD INDEX(`driverId`)
ALTER TABLE `results` ADD INDEX(`constructorId`)
ALTER TABLE `results` ADD INDEX(`statusId`)

ALTER TABLE `races2` ADD PRIMARY KEY(`raceId`)
ALTER TABLE `races2` ADD INDEX(`circuitId`)

ALTER TABLE `drivers` ADD PRIMARY KEY(`driverId`)

ALTER TABLE `constructors` ADD PRIMARY KEY(`constructorId`)

ALTER TABLE `circuits2` ADD PRIMARY KEY(`circuitId`)