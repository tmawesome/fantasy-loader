
IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerSeasonPlayerSeasonScoringDetailsScoringDetail'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [ArrayOfPlayerSeasonPlayerSeasonScoringDetailsScoringDetail];
END

IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerSeasonPlayerSeasonScoringDetails'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [ArrayOfPlayerSeasonPlayerSeasonScoringDetails];
END

IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerSeasonPlayerSeason'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [ArrayOfPlayerSeasonPlayerSeason];
END

IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerSeason'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [ArrayOfPlayerSeason];
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerSeason'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [ArrayOfPlayerSeason] (
		jpetl_id int  PRIMARY KEY
	);
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerSeasonPlayerSeason'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [ArrayOfPlayerSeasonPlayerSeason] (
		jpetl_idfk int,
		CONSTRAINT fk_ArrayOfPlayerSeasonPlayerSeason
			FOREIGN KEY (jpetl_idfk)
			REFERENCES [ArrayOfPlayerSeason](jpetl_id),
		[PlayerID] smallint,
		[FieldGoalPercentage] decimal(4,1),
		[FieldGoalsHadBlocked] decimal(2,1),
		[Safeties] decimal(2,1),
		[FieldGoalReturnTouchdowns] decimal(2,1),
		[BlockedKickReturnTouchdowns] decimal(2,1),
		[ExtraPointsAttempted] decimal(3,1),
		[PuntNetAverage] decimal(2,1),
		[PuntInside20] decimal(2,1),
		[PuntTouchbacks] decimal(2,1),
		[PuntReturnFairCatches] decimal(3,1),
		[KickReturnFairCatches] decimal(2,1),
		[FumblesOutOfBounds] decimal(2,1),
		[FumblesOwnRecoveries] decimal(2,1),
		[PlayerSeasonID] int,
		[FantasyPosition] varchar(2),
		[ExtraPointsHadBlocked] decimal(2,1),
		[Touchdowns] decimal(3,1),
		[SpecialTeamsTouchdowns] decimal(2,1),
		[DefensiveTouchdowns] decimal(2,1),
		[OffensiveTouchdowns] decimal(3,1),
		[Tackles] decimal(4,1),
		[ReceivingYardsPerTarget] decimal(3,1),
		[ReceptionPercentage] decimal(4,1),
		[FantasyPointsPPR] decimal(4,1),
		[FantasyPoints] decimal(4,1),
		[TwoPointConversionReceptions] decimal(2,1),
		[TwoPointConversionRuns] decimal(2,1),
		[TwoPointConversionPasses] decimal(2,1),
		[ExtraPointsMade] decimal(3,1),
		[FieldGoalsLongestMade] decimal(3,1),
		[PuntsHadBlocked] decimal(2,1),
		[PuntLong] decimal(2,1),
		[FieldGoalsAttempted] decimal(3,1),
		[DefensiveTeamSnaps] smallint,
		[AverageDraftPositionPPR] varchar(100),
		[AverageDraftPositionPPRnil] varchar(4),
		[AverageDraftPosition] varchar(100),
		[AverageDraftPositionnil] varchar(4),
		[FantasyPointsYahoo] decimal(4,1),
		[FantasyPointsDraftKings] decimal(4,1),
		[FieldGoalsMade50Plus] decimal(2,1),
		[FieldGoalsMade40to49] decimal(3,1),
		[FieldGoalsMade30to39] decimal(3,1),
		[FieldGoalsMade20to29] decimal(3,1),
		[FieldGoalsMade0to19] decimal(2,1),
		[FantasyPointsFanDuel] decimal(4,1),
		[TwoPointConversionReturns] decimal(2,1),
		[AuctionValuePPR] varchar(100),
		[AuctionValuePPRnil] varchar(4),
		[AuctionValue] varchar(100),
		[AuctionValuenil] varchar(4),
		[SpecialTeamsTeamSnaps] smallint,
		[OffensiveTeamSnaps] smallint,
		[BlockedKickReturnYards] decimal(2,1),
		[SpecialTeamsSnapsPlayed] tinyint,
		[DefensiveSnapsPlayed] smallint,
		[OffensiveSnapsPlayed] smallint,
		[WindSpeed] tinyint,
		[Humidity] tinyint,
		[Temperature] tinyint,
		[SafetiesAllowed] decimal(2,1),
		[ShortName] varchar(16),
		[MiscFumblesRecovered] decimal(2,1),
		[MiscFumblesForced] decimal(2,1),
		[SpecialTeamsFumblesRecovered] decimal(2,1),
		[SpecialTeamsFumblesForced] decimal(2,1),
		[PuntNetYards] decimal(2,1),
		[FieldGoalReturnYards] decimal(2,1),
		[FieldGoalsMade] decimal(3,1),
		[PuntAverage] decimal(2,1),
		[SeasonType] tinyint,
		[PassingTouchdowns] decimal(3,1),
		[ReceivingYardsPerReception] decimal(3,1),
		[ReceivingYards] decimal(5,1),
		[Receptions] decimal(4,1),
		[ReceivingTargets] decimal(4,1),
		[RushingLong] decimal(3,1),
		[RushingTouchdowns] decimal(3,1),
		[RushingYardsPerAttempt] decimal(3,1),
		[RushingYards] decimal(5,1),
		[RushingAttempts] decimal(4,1),
		[PassingSackYards] decimal(4,1),
		[PassingSacks] decimal(3,1),
		[PassingLong] decimal(4,1),
		[PassingRating] decimal(4,1),
		[PassingInterceptions] decimal(3,1),
		[PassingYardsPerCompletion] decimal(3,1),
		[ReceivingLong] decimal(4,1),
		[PassingYardsPerAttempt] decimal(3,1),
		[PassingCompletionPercentage] decimal(4,1),
		[PassingYards] decimal(5,1),
		[PassingCompletions] decimal(4,1),
		[PassingAttempts] decimal(4,1),
		[Started] tinyint,
		[Played] tinyint,
		[Activated] tinyint,
		[PositionCategory] varchar(3),
		[Position] varchar(3),
		[Name] varchar(18),
		[Number] tinyint,
		[Team] varchar(3),
		[Season] smallint,
		[ReceivingTouchdowns] decimal(3,1),
		[Fumbles] decimal(3,1),
		[PuntYards] decimal(2,1),
		[QuarterbackHits] decimal(3,1),
		[Punts] decimal(2,1),
		[MiscAssistedTackles] decimal(2,1),
		[MiscSoloTackles] decimal(2,1),
		[SpecialTeamsAssistedTackles] decimal(2,1),
		[SpecialTeamsSoloTackles] decimal(2,1),
		[BlockedKicks] decimal(2,1),
		[InterceptionReturnTouchdowns] decimal(2,1),
		[InterceptionReturnYards] decimal(4,1),
		[Interceptions] decimal(2,1),
		[FumbleReturnTouchdowns] decimal(2,1),
		[FumbleReturnYards] decimal(3,1),
		[FumblesRecovered] decimal(2,1),
		[FumblesForced] decimal(2,1),
		[PassesDefended] decimal(3,1),
		[SackYards] decimal(4,1),
		[FumblesLost] decimal(2,1),
		[Sacks] decimal(3,1),
		[TacklesForLoss] decimal(3,1),
		[AssistedTackles] decimal(3,1),
		[SoloTackles] decimal(4,1),
		[KickReturnLong] decimal(4,1),
		[KickReturnTouchdowns] decimal(2,1),
		[KickReturnYardsPerAttempt] decimal(3,1),
		[KickReturnYards] decimal(4,1),
		[KickReturns] decimal(3,1),
		[PuntReturnLong] decimal(3,1),
		[PuntReturnTouchdowns] decimal(2,1),
		[PuntReturnYardsPerAttempt] decimal(3,1),
		[PuntReturnYards] decimal(4,1),
		[PuntReturns] decimal(3,1),
		jpetl_id int  PRIMARY KEY
	);
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerSeasonPlayerSeasonScoringDetails'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [ArrayOfPlayerSeasonPlayerSeasonScoringDetails] (
		jpetl_idfk int,
		CONSTRAINT fk_ArrayOfPlayerSeasonPlayerSeasonScoringDetails
			FOREIGN KEY (jpetl_idfk)
			REFERENCES [ArrayOfPlayerSeasonPlayerSeason](jpetl_id),
		jpetl_id int  PRIMARY KEY
	);
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerSeasonPlayerSeasonScoringDetailsScoringDetail'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [ArrayOfPlayerSeasonPlayerSeasonScoringDetailsScoringDetail] (
		jpetl_idfk int,
		CONSTRAINT fk_ArrayOfPlayerSeasonPlayerSeasonScoringDetailsScoringDetail
			FOREIGN KEY (jpetl_idfk)
			REFERENCES [ArrayOfPlayerSeasonPlayerSeasonScoringDetails](jpetl_id),
		[GameKey] int,
		[SeasonType] tinyint,
		[PlayerID] smallint,
		[Team] varchar(3),
		[Season] smallint,
		[Week] tinyint,
		[ScoringType] varchar(27),
		[Length] tinyint,
		[ScoringDetailID] int,
		[PlayerGameID] int,
		jpetl_id int  PRIMARY KEY
	);
END
