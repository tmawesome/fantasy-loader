USE tmawesome
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
		ScoringBlockedFieldGoalReturnTouchdownCOUNT,
		ScoringBlockedFieldGoalReturnTouchdownMIN,
		ScoringBlockedFieldGoalReturnTouchdownMAX,
		ScoringBlockedFieldGoalReturnTouchdownAVG,
		ScoringBlockedFieldGoalReturnTouchdownSUM,
		ScoringBlockedPuntReturnTouchdownCOUNT,
		ScoringBlockedPuntReturnTouchdownMIN,
		ScoringBlockedPuntReturnTouchdownMAX,
		ScoringBlockedPuntReturnTouchdownAVG,
		ScoringBlockedPuntReturnTouchdownSUM,
		ScoringFieldGoalMadeCOUNT,
		ScoringFieldGoalMadeMIN,
		ScoringFieldGoalMadeMAX,
		ScoringFieldGoalMadeAVG,
		ScoringFieldGoalMadeSUM,
		ScoringFieldGoalReturnTouchdownCOUNT,
		ScoringFieldGoalReturnTouchdownMIN,
		ScoringFieldGoalReturnTouchdownMAX,
		ScoringFieldGoalReturnTouchdownAVG,
		ScoringFieldGoalReturnTouchdownSUM,
		ScoringFumbleReturnTouchdownCOUNT,
		ScoringFumbleReturnTouchdownMIN,
		ScoringFumbleReturnTouchdownMAX,
		ScoringFumbleReturnTouchdownAVG,
		ScoringFumbleReturnTouchdownSUM,
		ScoringInterceptionReturnTouchdownCOUNT,
		ScoringInterceptionReturnTouchdownMIN,
		ScoringInterceptionReturnTouchdownMAX,
		ScoringInterceptionReturnTouchdownAVG,
		ScoringInterceptionReturnTouchdownSUM,
		ScoringKickoffReturnTouchdownCOUNT,
		ScoringKickoffReturnTouchdownMIN,
		ScoringKickoffReturnTouchdownMAX,
		ScoringKickoffReturnTouchdownAVG,
		ScoringKickoffReturnTouchdownSUM,
		ScoringPassingTouchdownCOUNT,
		ScoringPassingTouchdownMIN,
		ScoringPassingTouchdownMAX,
		ScoringPassingTouchdownAVG,
		ScoringPassingTouchdownSUM,
		ScoringPuntReturnTouchdownCOUNT,
		ScoringPuntReturnTouchdownMIN,
		ScoringPuntReturnTouchdownMAX,
		ScoringPuntReturnTouchdownAVG,
		ScoringPuntReturnTouchdownSUM,
		ScoringReceivingTouchdownCOUNT,
		ScoringReceivingTouchdownMIN,
		ScoringReceivingTouchdownMAX,
		ScoringReceivingTouchdownAVG,
		ScoringReceivingTouchdownSUM,
		ScoringRushingTouchdownCOUNT,
		ScoringRushingTouchdownMIN,
		ScoringRushingTouchdownMAX,
		ScoringRushingTouchdownAVG,
		ScoringRushingTouchdownSUM,
		ScoringSafetyCOUNT,
		ScoringSafetyMIN,
		ScoringSafetyMAX,
		ScoringSafetyAVG,
		ScoringSafetySUM
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

	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringBlockedFieldGoalReturnTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringBlockedFieldGoalReturnTouchdownMIN',
			
				MAX(Length) AS 'ScoringBlockedFieldGoalReturnTouchdownMAX',
			
				AVG(Length) AS 'ScoringBlockedFieldGoalReturnTouchdownAVG',
			
				SUM(Length) AS 'ScoringBlockedFieldGoalReturnTouchdownSUM',
			'BlockedFieldGoalReturnTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'BlockedFieldGoalReturnTouchdown'
		GROUP BY jpetl_idfk
	) BlockedFieldGoalReturnTouchdown ON a.jpetl_idfk = BlockedFieldGoalReturnTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringBlockedPuntReturnTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringBlockedPuntReturnTouchdownMIN',
			
				MAX(Length) AS 'ScoringBlockedPuntReturnTouchdownMAX',
			
				AVG(Length) AS 'ScoringBlockedPuntReturnTouchdownAVG',
			
				SUM(Length) AS 'ScoringBlockedPuntReturnTouchdownSUM',
			'BlockedPuntReturnTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'BlockedPuntReturnTouchdown'
		GROUP BY jpetl_idfk
	) BlockedPuntReturnTouchdown ON a.jpetl_idfk = BlockedPuntReturnTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringFieldGoalMadeCOUNT',
			
				MIN(Length) AS 'ScoringFieldGoalMadeMIN',
			
				MAX(Length) AS 'ScoringFieldGoalMadeMAX',
			
				AVG(Length) AS 'ScoringFieldGoalMadeAVG',
			
				SUM(Length) AS 'ScoringFieldGoalMadeSUM',
			'FieldGoalMade' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'FieldGoalMade'
		GROUP BY jpetl_idfk
	) FieldGoalMade ON a.jpetl_idfk = FieldGoalMade.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringFieldGoalReturnTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringFieldGoalReturnTouchdownMIN',
			
				MAX(Length) AS 'ScoringFieldGoalReturnTouchdownMAX',
			
				AVG(Length) AS 'ScoringFieldGoalReturnTouchdownAVG',
			
				SUM(Length) AS 'ScoringFieldGoalReturnTouchdownSUM',
			'FieldGoalReturnTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'FieldGoalReturnTouchdown'
		GROUP BY jpetl_idfk
	) FieldGoalReturnTouchdown ON a.jpetl_idfk = FieldGoalReturnTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringFumbleReturnTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringFumbleReturnTouchdownMIN',
			
				MAX(Length) AS 'ScoringFumbleReturnTouchdownMAX',
			
				AVG(Length) AS 'ScoringFumbleReturnTouchdownAVG',
			
				SUM(Length) AS 'ScoringFumbleReturnTouchdownSUM',
			'FumbleReturnTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'FumbleReturnTouchdown'
		GROUP BY jpetl_idfk
	) FumbleReturnTouchdown ON a.jpetl_idfk = FumbleReturnTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringInterceptionReturnTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringInterceptionReturnTouchdownMIN',
			
				MAX(Length) AS 'ScoringInterceptionReturnTouchdownMAX',
			
				AVG(Length) AS 'ScoringInterceptionReturnTouchdownAVG',
			
				SUM(Length) AS 'ScoringInterceptionReturnTouchdownSUM',
			'InterceptionReturnTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'InterceptionReturnTouchdown'
		GROUP BY jpetl_idfk
	) InterceptionReturnTouchdown ON a.jpetl_idfk = InterceptionReturnTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringKickoffReturnTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringKickoffReturnTouchdownMIN',
			
				MAX(Length) AS 'ScoringKickoffReturnTouchdownMAX',
			
				AVG(Length) AS 'ScoringKickoffReturnTouchdownAVG',
			
				SUM(Length) AS 'ScoringKickoffReturnTouchdownSUM',
			'KickoffReturnTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'KickoffReturnTouchdown'
		GROUP BY jpetl_idfk
	) KickoffReturnTouchdown ON a.jpetl_idfk = KickoffReturnTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringPassingTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringPassingTouchdownMIN',
			
				MAX(Length) AS 'ScoringPassingTouchdownMAX',
			
				AVG(Length) AS 'ScoringPassingTouchdownAVG',
			
				SUM(Length) AS 'ScoringPassingTouchdownSUM',
			'PassingTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'PassingTouchdown'
		GROUP BY jpetl_idfk
	) PassingTouchdown ON a.jpetl_idfk = PassingTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringPuntReturnTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringPuntReturnTouchdownMIN',
			
				MAX(Length) AS 'ScoringPuntReturnTouchdownMAX',
			
				AVG(Length) AS 'ScoringPuntReturnTouchdownAVG',
			
				SUM(Length) AS 'ScoringPuntReturnTouchdownSUM',
			'PuntReturnTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'PuntReturnTouchdown'
		GROUP BY jpetl_idfk
	) PuntReturnTouchdown ON a.jpetl_idfk = PuntReturnTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringReceivingTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringReceivingTouchdownMIN',
			
				MAX(Length) AS 'ScoringReceivingTouchdownMAX',
			
				AVG(Length) AS 'ScoringReceivingTouchdownAVG',
			
				SUM(Length) AS 'ScoringReceivingTouchdownSUM',
			'ReceivingTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'ReceivingTouchdown'
		GROUP BY jpetl_idfk
	) ReceivingTouchdown ON a.jpetl_idfk = ReceivingTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringRushingTouchdownCOUNT',
			
				MIN(Length) AS 'ScoringRushingTouchdownMIN',
			
				MAX(Length) AS 'ScoringRushingTouchdownMAX',
			
				AVG(Length) AS 'ScoringRushingTouchdownAVG',
			
				SUM(Length) AS 'ScoringRushingTouchdownSUM',
			'RushingTouchdown' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'RushingTouchdown'
		GROUP BY jpetl_idfk
	) RushingTouchdown ON a.jpetl_idfk = RushingTouchdown.jpetl_idfk
	
	FULL JOIN (
		SELECT jpetl_idfk,
				COUNT(Length) AS 'ScoringSafetyCOUNT',
			
				MIN(Length) AS 'ScoringSafetyMIN',
			
				MAX(Length) AS 'ScoringSafetyMAX',
			
				AVG(Length) AS 'ScoringSafetyAVG',
			
				SUM(Length) AS 'ScoringSafetySUM',
			'Safety' as 'ScoringType'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		-- group by player-week
		WHERE ScoringType = 'Safety'
		GROUP BY jpetl_idfk
	) Safety ON a.jpetl_idfk = Safety.jpetl_idfk
	
) d ON p.[jpetl_id] = d.[jpetl_idfkd]
) vw
