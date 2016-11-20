
IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail];
END

IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerGamePlayerGameScoringDetails'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [ArrayOfPlayerGamePlayerGameScoringDetails];
END

IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerGamePlayerGame'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [ArrayOfPlayerGamePlayerGame];
END

IF (
	EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerGame'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	DROP TABLE [ArrayOfPlayerGame];
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerGame'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [ArrayOfPlayerGame] (
		jpetl_id int  PRIMARY KEY
	);
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerGamePlayerGame'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [ArrayOfPlayerGamePlayerGame] (
		jpetl_idfk int,
		CONSTRAINT fk_ArrayOfPlayerGamePlayerGame
			FOREIGN KEY (jpetl_idfk)
			REFERENCES [ArrayOfPlayerGame](jpetl_id),
		[GameKey] int,
		[BlockedKickReturnTouchdowns] decimal(2,1),
		[Stadium] varchar(35),
		[FantasyPoints] decimal(3,1),
		[FantasyPosition] varchar(2),
		[FieldGoalPercentage] decimal(4,1),
		[PlayerGameID] int,
		[FumblesOwnRecoveries] decimal(2,1),
		[FumblesOutOfBounds] decimal(2,1),
		[ExtraPointsAttempted] decimal(2,1),
		[FieldGoalReturnTouchdowns] decimal(2,1),
		[Safeties] decimal(2,1),
		[FieldGoalsHadBlocked] decimal(2,1),
		[PuntsHadBlocked] decimal(2,1),
		[ExtraPointsHadBlocked] decimal(2,1),
		[PuntLong] decimal(3,1),
		[PuntLongnil] varchar(4),
		[FieldGoalReturnYards] decimal(2,1),
		[PuntNetAverage] decimal(3,1),
		[KickReturnFairCatches] decimal(2,1),
		[ShortName] varchar(19),
		[Touchdowns] decimal(2,1),
		[SafetiesAllowed] decimal(2,1),
		[TwoPointConversionReceptions] decimal(2,1),
		[BlockedKickReturnYards] decimal(3,1),
		[PuntNetYards] decimal(4,1),
		[SpecialTeamsFumblesForced] decimal(2,1),
		[SpecialTeamsFumblesRecovered] decimal(2,1),
		[MiscFumblesForced] decimal(2,1),
		[FantasyPointsPPR] decimal(3,1),
		[MiscFumblesRecovered] decimal(2,1),
		[ReceptionPercentage] decimal(4,1),
		[ReceivingYardsPerTarget] decimal(3,1),
		[Tackles] decimal(3,1),
		[OffensiveTouchdowns] decimal(2,1),
		[DefensiveTouchdowns] decimal(2,1),
		[SpecialTeamsTouchdowns] decimal(2,1),
		[PuntInside20] decimal(2,1),
		[IsGameOver] varchar(4),
		[PuntReturnFairCatches] decimal(2,1),
		[PlayingSurface] varchar(10),
		[PlayingSurfacenil] varchar(4),
		[DraftKingsPosition] varchar(9),
		[YahooSalary] tinyint,
		[YahooSalarynil] varchar(4),
		[FantasyPointsYahoo] decimal(3,1),
		[InjuryStatus] varchar(9),
		[InjuryBodyPart] varchar(9),
		[InjuryStartDate] varchar(9),
		[InjuryNotes] varchar(9),
		[FanDuelPosition] varchar(9),
		[YahooPosition] varchar(9),
		[FieldGoalsMade50Plus] decimal(2,1),
		[OpponentRank] varchar(2),
		[OpponentRanknil] varchar(4),
		[OpponentPositionRank] varchar(2),
		[OpponentPositionRanknil] varchar(4),
		[InjuryPractice] varchar(100),
		[InjuryPracticenil] varchar(4),
		[InjuryPracticeDescription] varchar(100),
		[InjuryPracticeDescriptionnil] varchar(4),
		[DeclaredInactive] varchar(5),
		[FantasyDraftSalary] varchar(100),
		[FantasyDraftSalarynil] varchar(4),
		[FantasyDraftPosition] varchar(100),
		[FantasyDraftPositionnil] varchar(4),
		[FantasyPointsDraftKings] decimal(3,1),
		[FieldGoalsMade40to49] decimal(2,1),
		[Temperature] tinyint,
		[SpecialTeamsSnapsPlayed] tinyint,
		[SpecialTeamsSnapsPlayednil] varchar(4),
		[Humidity] tinyint,
		[WindSpeed] tinyint,
		[FanDuelSalary] smallint,
		[FanDuelSalarynil] varchar(4),
		[DraftKingsSalary] smallint,
		[DraftKingsSalarynil] varchar(4),
		[FantasyDataSalary] smallint,
		[FantasyDataSalarynil] varchar(4),
		[OffensiveSnapsPlayed] tinyint,
		[OffensiveSnapsPlayednil] varchar(4),
		[DefensiveSnapsPlayed] tinyint,
		[DefensiveSnapsPlayednil] varchar(4),
		[OffensiveTeamSnaps] tinyint,
		[OffensiveTeamSnapsnil] varchar(4),
		[FieldGoalsMade30to39] decimal(2,1),
		[DefensiveTeamSnaps] tinyint,
		[DefensiveTeamSnapsnil] varchar(4),
		[SpecialTeamsTeamSnaps] tinyint,
		[SpecialTeamsTeamSnapsnil] varchar(4),
		[VictivSalary] varchar(100),
		[VictivSalarynil] varchar(4),
		[TwoPointConversionReturns] decimal(2,1),
		[FantasyPointsFanDuel] decimal(3,1),
		[FieldGoalsMade0to19] decimal(2,1),
		[FieldGoalsMade20to29] decimal(2,1),
		[PuntTouchbacks] decimal(2,1),
		[TwoPointConversionRuns] decimal(2,1),
		[PassingCompletions] decimal(3,1),
		[PassingYardsPerCompletion] decimal(3,1),
		[Fumbles] decimal(2,1),
		[PlayerID] smallint,
		[Name] varchar(27),
		[Position] varchar(3),
		[PositionCategory] varchar(3),
		[Activated] tinyint,
		[Played] tinyint,
		[PassingYardsPerAttempt] decimal(3,1),
		[PassingTouchdowns] decimal(2,1),
		[PassingInterceptions] decimal(2,1),
		[PassingRating] decimal(4,1),
		[PassingLong] decimal(4,1),
		[PassingSacks] decimal(3,1),
		[PassingSackYards] decimal(3,1),
		[RushingYards] decimal(4,1),
		[PassingCompletionPercentage] decimal(4,1),
		[Started] tinyint,
		[ReceivingYards] decimal(4,1),
		[Number] tinyint,
		[ReceivingLong] decimal(4,1),
		[TwoPointConversionPasses] decimal(2,1),
		[RushingAttempts] decimal(3,1),
		[RushingYardsPerAttempt] decimal(3,1),
		[RushingTouchdowns] decimal(2,1),
		[RushingLong] decimal(3,1),
		[ReceivingTargets] decimal(3,1),
		[SeasonType] tinyint,
		[Receptions] decimal(3,1),
		[Season] smallint,
		[GameDate] datetime,
		[Week] tinyint,
		[Team] varchar(3),
		[Opponent] varchar(3),
		[HomeOrAway] varchar(4),
		[PassingYards] decimal(4,1),
		[ReceivingTouchdowns] decimal(2,1),
		[PassingAttempts] decimal(3,1),
		[ReceivingYardsPerReception] decimal(3,1),
		[MiscSoloTackles] decimal(2,1),
		[FumbleReturnTouchdowns] decimal(2,1),
		[Interceptions] decimal(2,1),
		[InterceptionReturnYards] decimal(4,1),
		[InterceptionReturnTouchdowns] decimal(2,1),
		[BlockedKicks] decimal(2,1),
		[SpecialTeamsSoloTackles] decimal(2,1),
		[SpecialTeamsAssistedTackles] decimal(2,1),
		[MiscAssistedTackles] decimal(2,1),
		[FumblesRecovered] decimal(2,1),
		[Punts] decimal(3,1),
		[PuntYards] decimal(4,1),
		[PuntAverage] decimal(3,1),
		[FieldGoalsAttempted] decimal(2,1),
		[FieldGoalsMade] decimal(2,1),
		[FieldGoalsLongestMade] decimal(3,1),
		[ExtraPointsMade] decimal(2,1),
		[FumbleReturnYards] decimal(3,1),
		[FumblesForced] decimal(2,1),
		[FumblesLost] decimal(2,1),
		[KickReturnYardsPerAttempt] decimal(4,1),
		[PuntReturns] decimal(2,1),
		[PuntReturnYards] decimal(4,1),
		[PuntReturnYardsPerAttempt] decimal(3,1),
		[PuntReturnTouchdowns] decimal(2,1),
		[PuntReturnLong] decimal(4,1),
		[KickReturns] decimal(2,1),
		[KickReturnYards] decimal(4,1),
		[KickReturnTouchdowns] decimal(2,1),
		[PassesDefended] decimal(2,1),
		[KickReturnLong] decimal(4,1),
		[SoloTackles] decimal(3,1),
		[AssistedTackles] decimal(3,1),
		[TacklesForLoss] decimal(2,1),
		[Sacks] decimal(2,1),
		[SackYards] decimal(3,1),
		[QuarterbackHits] decimal(3,1),
		jpetl_id int  PRIMARY KEY
	);
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerGamePlayerGameScoringDetails'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [ArrayOfPlayerGamePlayerGameScoringDetails] (
		jpetl_idfk int,
		CONSTRAINT fk_ArrayOfPlayerGamePlayerGameScoringDetails
			FOREIGN KEY (jpetl_idfk)
			REFERENCES [ArrayOfPlayerGamePlayerGame](jpetl_id),
		jpetl_id int  PRIMARY KEY
	);
END

IF (
	NOT EXISTS (
		SELECT *
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_NAME = 'ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail'
		-- AND TABLE_SCHEMA = 'dbo'
	)
)
BEGIN
	CREATE TABLE [ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail] (
		jpetl_idfk int,
		CONSTRAINT fk_ArrayOfPlayerGamePlayerGameScoringDetailsScoringDetail
			FOREIGN KEY (jpetl_idfk)
			REFERENCES [ArrayOfPlayerGamePlayerGameScoringDetails](jpetl_id),
		[GameKey] int,
		[SeasonType] tinyint,
		[PlayerID] smallint,
		[Team] varchar(3),
		[Season] smallint,
		[Week] tinyint,
		[ScoringType] varchar(31),
		[Length] tinyint,
		[ScoringDetailID] int,
		[PlayerGameID] int,
		jpetl_id int  PRIMARY KEY
	);
END
