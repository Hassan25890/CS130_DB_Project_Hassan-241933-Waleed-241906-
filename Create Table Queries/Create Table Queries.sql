CREATE TABLE Platform (
    PlatformID INT PRIMARY KEY IDENTITY(1,1),
    PlatformName VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50) NULL,
    ReleaseYear INT NULL
);

CREATE TABLE Player (
    PlayerID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PlatformID INT NULL,
    FOREIGN KEY (PlatformID) REFERENCES Platform(PlatformID)
);

CREATE TABLE GameMode (
    GameModeID INT PRIMARY KEY IDENTITY(1,1),
    ModeName VARCHAR(50) NOT NULL,
    MaxPlayers INT NULL
);

CREATE TABLE Server (
    ServerID INT PRIMARY KEY IDENTITY(1,1),
    Location VARCHAR(100) NULL,
    Capacity INT NULL,
    Status VARCHAR(50) NULL
);

CREATE TABLE Party (
    PartyID INT PRIMARY KEY IDENTITY(1,1),
    LeaderID INT NULL,
    Status VARCHAR(30) NULL,
    PartyName VARCHAR(100) NULL,
    FOREIGN KEY (LeaderID) REFERENCES Player(PlayerID)
);

CREATE TABLE PartyMembers (
    PartyID INT NOT NULL,
    PlayerID INT NOT NULL,
    PRIMARY KEY (PartyID, PlayerID),
    FOREIGN KEY (PartyID) REFERENCES Party(PartyID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);

CREATE TABLE FriendList (
    PlayerID INT NOT NULL,
    FriendID INT NOT NULL,
    FriendSince DATE NULL,
    PRIMARY KEY (PlayerID, FriendID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (FriendID) REFERENCES Player(PlayerID)
);

CREATE TABLE GameRequest (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    PlayerID INT NULL,
    PartyID INT NULL,
    GameModeID INT NOT NULL,
    RequestTime DATETIME NULL,
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (PartyID) REFERENCES Party(PartyID),
    FOREIGN KEY (GameModeID) REFERENCES GameMode(GameModeID)
);

CREATE TABLE Lobby (
    LobbyID INT PRIMARY KEY IDENTITY(1,1),
    LobbyName VARCHAR(100) NULL,
    MaxPlayers INT NULL,
    GameModeID INT NULL,
    ServerID INT NULL,
    FOREIGN KEY (GameModeID) REFERENCES GameMode(GameModeID),
    FOREIGN KEY (ServerID) REFERENCES Server(ServerID)
);

CREATE TABLE Match (
    MatchID INT PRIMARY KEY IDENTITY(1,1),
    GameModeID INT NULL,
    ServerID INT NULL,
    StartTime DATETIME NULL,
    LobbyID INT NULL,
    FOREIGN KEY (GameModeID) REFERENCES GameMode(GameModeID),
    FOREIGN KEY (ServerID) REFERENCES Server(ServerID),
    FOREIGN KEY (LobbyID) REFERENCES Lobby(LobbyID)
);

CREATE TABLE GameResult (
    ResultID INT PRIMARY KEY IDENTITY(1,1),
    MatchID INT NULL,
    PlayerID INT NULL,
    Score VARCHAR(50) NULL,
    Result VARCHAR(30) NOT NULL,
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);

CREATE TABLE PlayerStats (
    StatsID INT PRIMARY KEY IDENTITY(1,1),
    PlayerID INT NULL,
    TotalGamesPlayed INT NULL,
    TotalWins INT NULL,
    TotalLosses INT NULL,
    Rank VARCHAR(50) NULL,
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);

CREATE TABLE Invite (
    InviteID INT PRIMARY KEY IDENTITY(1,1),
    SenderID INT NULL,
    RecieverID INT NULL,
    PartyID INT NULL,
    SentAt DATETIME NULL,
    FOREIGN KEY (SenderID) REFERENCES Player(PlayerID),
    FOREIGN KEY (RecieverID) REFERENCES Player(PlayerID),
    FOREIGN KEY (PartyID) REFERENCES Party(PartyID)
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY IDENTITY(1,1),
    MatchID INT NULL,
    ScheduledTime DATETIME NULL,
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID)
);
