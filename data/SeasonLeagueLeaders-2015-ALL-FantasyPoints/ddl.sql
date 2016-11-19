
IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'rootScoringDetailsScoringDetails'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [rootScoringDetailsScoringDetails];
END

IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'rootScoringDetails'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [rootScoringDetails];
END

IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'root'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [root];
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'root'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [root] (
		[PlayerID] smallint,
		[PassingYardsPerAttempt] decimal(2,1),
		[Season] smallint,
		[Team] varchar(3),
		[Number] tinyint,
		[Name] varchar(10),
		[Position] varchar(2),
		[PositionCategory] varchar(3),
		[Activated] tinyint,
		[Played] tinyint,
		[Started] tinyint,
		[PassingAttempts] decimal(4,1),
		[PassingCompletions] decimal(4,1),
		[PassingYards] decimal(5,1),
		[PassingCompletionPercentage] decimal(3,1),
		[ReceivingLong] tinyint,
		[Fumbles] decimal(2,1),
		[PassingYardsPerCompletion] decimal(3,1),
		[PassingInterceptions] decimal(3,1),
		[PassingRating] tinyint,
		[PassingLong] decimal(3,1),
		[PassingSacks] decimal(3,1),
		[PassingSackYards] decimal(4,1),
		[RushingAttempts] decimal(4,1),
		[RushingYards] decimal(4,1),
		[RushingYardsPerAttempt] decimal(2,1),
		[RushingTouchdowns] decimal(3,1),
		[RushingLong] tinyint,
		[ReceivingTargets] tinyint,
		[Receptions] tinyint,
		[ReceivingYards] tinyint,
		[ReceivingTouchdowns] tinyint,
		[PuntYards] tinyint,
		[PassingTouchdowns] decimal(3,1),
		[FumblesLost] decimal(2,1),
		[PuntReturns] tinyint,
		[PuntReturnYards] tinyint,
		[PuntReturnYardsPerAttempt] tinyint,
		[PuntReturnTouchdowns] tinyint,
		[PuntReturnLong] tinyint,
		[KickReturns] tinyint,
		[KickReturnYards] tinyint,
		[KickReturnYardsPerAttempt] tinyint,
		[KickReturnTouchdowns] tinyint,
		[KickReturnLong] tinyint,
		[SoloTackles] tinyint,
		[AssistedTackles] tinyint,
		[TacklesForLoss] tinyint,
		[Sacks] tinyint,
		[SackYards] tinyint,
		[QuarterbackHits] tinyint,
		[PassesDefended] tinyint,
		[FumblesForced] tinyint,
		[FumblesRecovered] tinyint,
		[FumbleReturnYards] tinyint,
		[FumbleReturnTouchdowns] tinyint,
		[Interceptions] tinyint,
		[InterceptionReturnYards] tinyint,
		[InterceptionReturnTouchdowns] tinyint,
		[BlockedKicks] tinyint,
		[SpecialTeamsSoloTackles] tinyint,
		[SpecialTeamsAssistedTackles] tinyint,
		[MiscSoloTackles] decimal(2,1),
		[MiscAssistedTackles] tinyint,
		[Punts] tinyint,
		[ReceivingYardsPerReception] tinyint,
		[SeasonType] tinyint,
		[FieldGoalPercentage] tinyint,
		[Touchdowns] decimal(3,1),
		[PuntsHadBlocked] tinyint,
		[FieldGoalsLongestMade] tinyint,
		[ExtraPointsMade] tinyint,
		[TwoPointConversionPasses] tinyint,
		[TwoPointConversionRuns] tinyint,
		[TwoPointConversionReceptions] tinyint,
		[FantasyPoints] decimal(4,1),
		[FantasyPointsPPR] decimal(4,1),
		[ReceptionPercentage] tinyint,
		[ReceivingYardsPerTarget] tinyint,
		[Tackles] tinyint,
		[OffensiveTouchdowns] decimal(3,1),
		[DefensiveTouchdowns] tinyint,
		[SpecialTeamsTouchdowns] tinyint,
		[ExtraPointsHadBlocked] tinyint,
		[FieldGoalsAttempted] tinyint,
		[FantasyPosition] varchar(2),
		[PlayerSeasonID] int,
		[FumblesOwnRecoveries] decimal(2,1),
		[FumblesOutOfBounds] tinyint,
		[KickReturnFairCatches] tinyint,
		[PuntReturnFairCatches] tinyint,
		[PuntTouchbacks] tinyint,
		[PuntInside20] tinyint,
		[PuntNetAverage] tinyint,
		[ExtraPointsAttempted] tinyint,
		[BlockedKickReturnTouchdowns] tinyint,
		[FieldGoalReturnTouchdowns] tinyint,
		[Safeties] tinyint,
		[FieldGoalsHadBlocked] tinyint,
		[PuntLong] tinyint,
		[DefensiveTeamSnaps] smallint,
		[PuntAverage] tinyint,
		[SpecialTeamsSnapsPlayed] tinyint,
		[FieldGoalsMade] tinyint,
		[FieldGoalReturnYards] tinyint,
		[PuntNetYards] tinyint,
		[SpecialTeamsFumblesForced] tinyint,
		[SpecialTeamsFumblesRecovered] tinyint,
		[MiscFumblesForced] tinyint,
		[MiscFumblesRecovered] decimal(2,1),
		[ShortName] varchar(8),
		[SafetiesAllowed] tinyint,
		[Temperature] tinyint,
		[Humidity] tinyint,
		[WindSpeed] tinyint,
		[OffensiveSnapsPlayed] smallint,
		[DefensiveSnapsPlayed] tinyint,
		[BlockedKickReturnYards] tinyint,
		[AverageDraftPositionPPR] varchar(100),
		[OffensiveTeamSnaps] smallint,
		[SpecialTeamsTeamSnaps] smallint,
		[AuctionValue] varchar(100),
		[AuctionValuePPR] varchar(100),
		[TwoPointConversionReturns] tinyint,
		[FantasyPointsFanDuel] decimal(4,1),
		[FieldGoalsMade0to19] tinyint,
		[FieldGoalsMade20to29] tinyint,
		[FieldGoalsMade30to39] tinyint,
		[FieldGoalsMade40to49] tinyint,
		[FieldGoalsMade50Plus] tinyint,
		[FantasyPointsDraftKings] smallint,
		[FantasyPointsYahoo] decimal(4,1),
		[AverageDraftPosition] varchar(100),
		jpetl_id int  PRIMARY KEY
	);
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'rootScoringDetails'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [rootScoringDetails] (
		jpetl_idfk int,
		CONSTRAINT fk_rootScoringDetails
			FOREIGN KEY (jpetl_idfk)
			REFERENCES [root](jpetl_id),
		jpetl_id int  PRIMARY KEY
	);
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'rootScoringDetailsScoringDetails'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [rootScoringDetailsScoringDetails] (
		jpetl_idfk int,
		CONSTRAINT fk_rootScoringDetailsScoringDetails
			FOREIGN KEY (jpetl_idfk)
			REFERENCES [rootScoringDetails](jpetl_id),
		[GameKey] int,
		[SeasonType] tinyint,
		[PlayerID] smallint,
		[Team] varchar(3),
		[Season] smallint,
		[Week] tinyint,
		[ScoringType] varchar(16),
		[Length] tinyint,
		[ScoringDetailID] int,
		[PlayerGameID] int,
		jpetl_id int  PRIMARY KEY
	);
END
