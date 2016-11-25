<?php

$ScoringTypes = [
	'BlockedFieldGoalReturnTouchdown',
	'BlockedPuntReturnTouchdown',
	'FieldGoalMade',
	'FieldGoalReturnTouchdown',
	'FumbleReturnTouchdown',
	'InterceptionReturnTouchdown',
	'KickoffReturnTouchdown',
	'PassingTouchdown',
	'PuntReturnTouchdown',
	'ReceivingTouchdown',
	'RushingTouchdown',
	'Safety',
];

$aggregates = [
	'COUNT',
	'MIN',
	'MAX',
	'AVG',
	'SUM',
];

$sqlAggregates = "";
foreach($ScoringTypes as $ScoringType){
	$sqlAggregates .= "
	FULL JOIN (
		SELECT jpetl_idfk,";

		foreach($aggregates as $aggregate){
			$columns []= $column = "Scoring$ScoringType$aggregate";
			$sqlAggregates .= "
				$aggregate(Length) AS '$column',
			";
		}

	$sqlAggregates .= "'$ScoringType' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = '$ScoringType'
		GROUP BY jpetl_idfk
	) $ScoringType ON a.jpetl_idfk = $ScoringType.jpetl_idfk
	";
}

$sql = "USE tmawesome
GO
SELECT * INTO viewAggregatePlayerGameStatsByWeek
FROM (
SELECT *, (
	SELECT FantasyPoints
	FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGame] s
	WHERE s.week = p.week + 1
	  AND s.PlayerID = p.PlayerID
) AS 'FantasyPointsNextWeek'
FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGame] p
FULL JOIN (
	SELECT a.jpetl_idfk AS 'jpetl_idfkd',
		ScoringTotalCOUNT,
		ScoringTotalMIN,
		ScoringTotalMAX,
		ScoringTotalAVG,
		ScoringTotalSUM,
";

$columns = implode(",\n\t\t",$columns);

$sql .= "		$columns
	FROM (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringTotalCOUNT',
			MIN(Length)     AS 'ScoringTotalMIN',
			MAX(Length)     AS 'ScoringTotalMAX',
			AVG(Length)     AS 'ScoringTotalAVG',
			SUM(Length)     AS 'ScoringTotalSUM'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		GROUP BY jpetl_idfk
	) a
";

$sql .= $sqlAggregates . "
) d ON p.[jpetl_id] = d.[jpetl_idfkd]
) vw
";

echo $sql;
