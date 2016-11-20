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
		ScoringCountsAll,
		ScoringLenAvgAll,
		ScoringLenMinAll,
		ScoringLenMaxAll,
		ScoringCountsRushingTouchdown,
		ScoringLenAvgRushingTouchdown,
		ScoringLenMinRushingTouchdown,
		ScoringLenMaxRushingTouchdown,
		ScoringCountsBlockedFieldGoalReturnTouchdown,
		ScoringLenAvgBlockedFieldGoalReturnTouchdown,
		ScoringLenMinBlockedFieldGoalReturnTouchdown,
		ScoringLenMaxBlockedFieldGoalReturnTouchdown,
		ScoringCountsBlockedPuntReturnTouchdown,
		ScoringLenAvgBlockedPuntReturnTouchdown,
		ScoringLenMinBlockedPuntReturnTouchdown,
		ScoringLenMaxBlockedPuntReturnTouchdown,
		ScoringCountsSafety,
		ScoringLenAvgSafety,
		ScoringLenMinSafety,
		ScoringLenMaxSafety,
		ScoringCountsFumbleReturnTouchdown,
		ScoringLenAvgFumbleReturnTouchdown,
		ScoringLenMinFumbleReturnTouchdown,
		ScoringLenMaxFumbleReturnTouchdown,
		ScoringCountsFieldGoalMissed,
		ScoringLenAvgFieldGoalMissed,
		ScoringLenMinFieldGoalMissed,
		ScoringLenMaxFieldGoalMissed,
		ScoringCountsExtraPointReturn,
		ScoringLenAvgExtraPointReturn,
		ScoringLenMinExtraPointReturn,
		ScoringLenMaxExtraPointReturn,
		ScoringCountsKickoffReturnTouchdown,
		ScoringLenAvgKickoffReturnTouchdown,
		ScoringLenMinKickoffReturnTouchdown,
		ScoringLenMaxKickoffReturnTouchdown,
		ScoringCountsPassingTouchdown,
		ScoringLenAvgPassingTouchdown,
		ScoringLenMinPassingTouchdown,
		ScoringLenMaxPassingTouchdown,
		ScoringCountsInterceptionReturnTouchdown,
		ScoringLenAvgInterceptionReturnTouchdown,
		ScoringLenMinInterceptionReturnTouchdown,
		ScoringLenMaxInterceptionReturnTouchdown,
		ScoringCountsReceivingTouchdown,
		ScoringLenAvgReceivingTouchdown,
		ScoringLenMinReceivingTouchdown,
		ScoringLenMaxReceivingTouchdown,
		ScoringCountsFieldGoalMade,
		ScoringLenAvgFieldGoalMade,
		ScoringLenMinFieldGoalMade,
		ScoringLenMaxFieldGoalMade,
		ScoringCountsPuntReturnTouchdown,
		ScoringLenAvgPuntReturnTouchdown,
		ScoringLenMinPuntReturnTouchdown,
		ScoringLenMaxPuntReturnTouchdown
	FROM (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsAll',
			AVG(Length)     AS 'ScoringLenAvgAll',
			MIN(Length)     AS 'ScoringLenMinAll',
			MAX(Length)     AS 'ScoringLenMaxAll'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		GROUP BY jpetl_idfk
	) a
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsRushingTouchdown',
			AVG(Length)     AS 'ScoringLenAvgRushingTouchdown',
			MIN(Length)     AS 'ScoringLenMinRushingTouchdown',
			MAX(Length)     AS 'ScoringLenMaxRushingTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'RushingTouchdown'
		GROUP BY jpetl_idfk
	) RushingTouchdown ON a.jpetl_idfk = RushingTouchdown.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsBlockedFieldGoalReturnTouchdown',
			AVG(Length)     AS 'ScoringLenAvgBlockedFieldGoalReturnTouchdown',
			MIN(Length)     AS 'ScoringLenMinBlockedFieldGoalReturnTouchdown',
			MAX(Length)     AS 'ScoringLenMaxBlockedFieldGoalReturnTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'BlockedFieldGoalReturnTouchdown'
		GROUP BY jpetl_idfk
	) BlockedFieldGoalReturnTouchdown ON a.jpetl_idfk = BlockedFieldGoalReturnTouchdown.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsBlockedPuntReturnTouchdown',
			AVG(Length)     AS 'ScoringLenAvgBlockedPuntReturnTouchdown',
			MIN(Length)     AS 'ScoringLenMinBlockedPuntReturnTouchdown',
			MAX(Length)     AS 'ScoringLenMaxBlockedPuntReturnTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'BlockedPuntReturnTouchdown'
		GROUP BY jpetl_idfk
	) BlockedPuntReturnTouchdown ON a.jpetl_idfk = BlockedPuntReturnTouchdown.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsSafety',
			AVG(Length)     AS 'ScoringLenAvgSafety',
			MIN(Length)     AS 'ScoringLenMinSafety',
			MAX(Length)     AS 'ScoringLenMaxSafety'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'Safety'
		GROUP BY jpetl_idfk
	) Safety ON a.jpetl_idfk = Safety.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsFumbleReturnTouchdown',
			AVG(Length)     AS 'ScoringLenAvgFumbleReturnTouchdown',
			MIN(Length)     AS 'ScoringLenMinFumbleReturnTouchdown',
			MAX(Length)     AS 'ScoringLenMaxFumbleReturnTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'FumbleReturnTouchdown'
		GROUP BY jpetl_idfk
	) FumbleReturnTouchdown ON a.jpetl_idfk = FumbleReturnTouchdown.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsFieldGoalMissed',
			AVG(Length)     AS 'ScoringLenAvgFieldGoalMissed',
			MIN(Length)     AS 'ScoringLenMinFieldGoalMissed',
			MAX(Length)     AS 'ScoringLenMaxFieldGoalMissed'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'FieldGoalMissed'
		GROUP BY jpetl_idfk
	) FieldGoalMissed ON a.jpetl_idfk = FieldGoalMissed.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsExtraPointReturn',
			AVG(Length)     AS 'ScoringLenAvgExtraPointReturn',
			MIN(Length)     AS 'ScoringLenMinExtraPointReturn',
			MAX(Length)     AS 'ScoringLenMaxExtraPointReturn'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'ExtraPointReturn'
		GROUP BY jpetl_idfk
	) ExtraPointReturn ON a.jpetl_idfk = ExtraPointReturn.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsKickoffReturnTouchdown',
			AVG(Length)     AS 'ScoringLenAvgKickoffReturnTouchdown',
			MIN(Length)     AS 'ScoringLenMinKickoffReturnTouchdown',
			MAX(Length)     AS 'ScoringLenMaxKickoffReturnTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'KickoffReturnTouchdown'
		GROUP BY jpetl_idfk
	) KickoffReturnTouchdown ON a.jpetl_idfk = KickoffReturnTouchdown.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsPassingTouchdown',
			AVG(Length)     AS 'ScoringLenAvgPassingTouchdown',
			MIN(Length)     AS 'ScoringLenMinPassingTouchdown',
			MAX(Length)     AS 'ScoringLenMaxPassingTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'PassingTouchdown'
		GROUP BY jpetl_idfk
	) PassingTouchdown ON a.jpetl_idfk = PassingTouchdown.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsInterceptionReturnTouchdown',
			AVG(Length)     AS 'ScoringLenAvgInterceptionReturnTouchdown',
			MIN(Length)     AS 'ScoringLenMinInterceptionReturnTouchdown',
			MAX(Length)     AS 'ScoringLenMaxInterceptionReturnTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'InterceptionReturnTouchdown'
		GROUP BY jpetl_idfk
	) InterceptionReturnTouchdown ON a.jpetl_idfk = InterceptionReturnTouchdown.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsReceivingTouchdown',
			AVG(Length)     AS 'ScoringLenAvgReceivingTouchdown',
			MIN(Length)     AS 'ScoringLenMinReceivingTouchdown',
			MAX(Length)     AS 'ScoringLenMaxReceivingTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'ReceivingTouchdown'
		GROUP BY jpetl_idfk
	) ReceivingTouchdown ON a.jpetl_idfk = ReceivingTouchdown.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsFieldGoalMade',
			AVG(Length)     AS 'ScoringLenAvgFieldGoalMade',
			MIN(Length)     AS 'ScoringLenMinFieldGoalMade',
			MAX(Length)     AS 'ScoringLenMaxFieldGoalMade'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'FieldGoalMade'
		GROUP BY jpetl_idfk
	) FieldGoalMade ON a.jpetl_idfk = FieldGoalMade.jpetl_idfk
	FULL JOIN (
		SELECT jpetl_idfk,
			COUNT(jpetl_id) AS 'ScoringCountsPuntReturnTouchdown',
			AVG(Length)     AS 'ScoringLenAvgPuntReturnTouchdown',
			MIN(Length)     AS 'ScoringLenMinPuntReturnTouchdown',
			MAX(Length)     AS 'ScoringLenMaxPuntReturnTouchdown'
		FROM tmawesome.[dbo].[ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail]
		WHERE ScoringType = 'PuntReturnTouchdown'
		GROUP BY jpetl_idfk
	) PuntReturnTouchdown ON a.jpetl_idfk = PuntReturnTouchdown.jpetl_idfk
) d ON p.[jpetl_id] = d.[jpetl_idfkd]
) vw
