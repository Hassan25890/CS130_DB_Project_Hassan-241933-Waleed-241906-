-- Platform
INSERT INTO Platform (PlatformName, Manufacturer, ReleaseYear) VALUES ('PC', 'Microsoft', 2000); 
INSERT INTO Platform (PlatformName, Manufacturer, ReleaseYear) VALUES ('Xbox', 'Microsoft', 2005);
INSERT INTO Platform (PlatformName, Manufacturer, ReleaseYear) VALUES ('PlayStation', 'Sony', 2010);
INSERT INTO Platform (PlatformName, Manufacturer, ReleaseYear) VALUES ('Nintendo', 'Nintendo', 2015); 
INSERT INTO Platform (PlatformName, Manufacturer, ReleaseYear) VALUES ('Mobile', 'Samsung', 2020);

-- Player
INSERT INTO Player (Username, Email, PlatformID) VALUES ('Ali Ahmed', 'aliahmed@example.com', 1);
INSERT INTO Player (Username, Email, PlatformID) VALUES ('Emily Davis', 'emilydavis@example.com', 2); 
INSERT INTO Player (Username, Email, PlatformID) VALUES ('Fatima Noor', 'fatimanoor@example.com', 3); 
INSERT INTO Player (Username, Email, PlatformID) VALUES ('Anna Ivanova', 'annaivanova@example.com', 4);
INSERT INTO Player (Username, Email, PlatformID) VALUES ('Zainab Shah', 'zainabshah@example.com', 5);

-- GameMode
INSERT INTO GameMode (ModeName, MaxPlayers) VALUES ('Deathmatch', 10);
INSERT INTO GameMode (ModeName, MaxPlayers) VALUES ('Team Battle', 20);
INSERT INTO GameMode (ModeName, MaxPlayers) VALUES ('Capture the Flag', 12);
INSERT INTO GameMode (ModeName, MaxPlayers) VALUES ('Free for All', 8);
INSERT INTO GameMode (ModeName, MaxPlayers) VALUES ('Survival', 16);

-- Server
INSERT INTO Server (Location, Capacity, Status) VALUES ('Lahore', 300, 'Online'); 
INSERT INTO Server (Location, Capacity, Status) VALUES ('New York', 400, 'Offline'); 
INSERT INTO Server (Location, Capacity, Status) VALUES ('London', 350, 'Maintenance');
INSERT INTO Server (Location, Capacity, Status) VALUES ('Tokyo', 450, 'Online'); 
INSERT INTO Server (Location, Capacity, Status) VALUES ('Dubai', 500, 'Online');

-- Party
INSERT INTO Party (PartyName, Status, LeaderID) VALUES ('Alpha Squad', 'Active', 1);
INSERT INTO Party (PartyName, Status, LeaderID) VALUES ('Bravo Team', 'Waiting', 2);
INSERT INTO Party (PartyName, Status, LeaderID) VALUES ('Charlie Force', 'Full', 3);
INSERT INTO Party (PartyName, Status, LeaderID) VALUES ('Delta Unit', 'Disbanded', 4);
INSERT INTO Party (PartyName, Status, LeaderID) VALUES ('Echo Crew', 'Active', 5);

-- GameRequest
INSERT INTO GameRequest (PlayerID, GameModeID, RequestTime, PartyID) VALUES (1, 2, '2025-05-22 13:30:00', 1);
INSERT INTO GameRequest (PlayerID, GameModeID, RequestTime, PartyID) VALUES (2, 1, '2025-05-22 14:00:00', 2);
INSERT INTO GameRequest (PlayerID, GameModeID, RequestTime, PartyID) VALUES (3, 3, '2025-05-22 14:20:00', 3);
INSERT INTO GameRequest (PlayerID, GameModeID, RequestTime, PartyID) VALUES (4, 2, '2025-05-22 14:45:00', 4);
INSERT INTO GameRequest (PlayerID, GameModeID, RequestTime, PartyID) VALUES (5, 1, '2025-05-22 15:10:00', 5);

-- PartyMembers
INSERT INTO PartyMembers (PartyID, PlayerID) VALUES (1, 2); 
INSERT INTO PartyMembers (PartyID, PlayerID) VALUES (1, 3); 
INSERT INTO PartyMembers (PartyID, PlayerID) VALUES (2, 4); 
INSERT INTO PartyMembers (PartyID, PlayerID) VALUES (2, 5); 

-- Lobby
INSERT INTO Lobby (LobbyName, MaxPlayers, GameModeID, ServerID) VALUES ('Team Alpha', 10, 1, 1);
INSERT INTO Lobby (LobbyName, MaxPlayers, GameModeID, ServerID) VALUES ('Sniper Zone', 8, 2, 2);
INSERT INTO Lobby (LobbyName, MaxPlayers, GameModeID, ServerID) VALUES ('Battle Arena', 16, 3, 1);
INSERT INTO Lobby (LobbyName, MaxPlayers, GameModeID, ServerID) VALUES ('Solo Kings', 1, 4, 3);
INSERT INTO Lobby (LobbyName, MaxPlayers, GameModeID, ServerID) VALUES ('Tactical Ops', 12, 2, 4);

-- Match
INSERT INTO Match (GameModeID, StartTime, ServerID, LobbyID) VALUES (1, '2025-05-23 14:00:00', 1, 1);
INSERT INTO Match (GameModeID, StartTime, ServerID, LobbyID) VALUES (2, '2025-05-24 16:30:00', 2, 2);
INSERT INTO Match (GameModeID, StartTime, ServerID, LobbyID) VALUES (3, '2025-05-25 19:45:00', 1, 3);
INSERT INTO Match (GameModeID, StartTime, ServerID, LobbyID) VALUES (4, '2025-05-26 12:15:00', 3, 4);
INSERT INTO Match (GameModeID, StartTime, ServerID, LobbyID) VALUES (2, '2025-05-27 10:00:00', 4, 5);

-- GameResult
INSERT INTO GameResult (MatchID, PlayerID, Result, Score) VALUES (1, 2, 'Win', 20);
INSERT INTO GameResult (MatchID, PlayerID, Result, Score) VALUES (1, 3, 'Loss', 5);
INSERT INTO GameResult (MatchID, PlayerID, Result, Score) VALUES (2, 4, 'Win', 15);
INSERT INTO GameResult (MatchID, PlayerID, Result, Score) VALUES (3, 5, 'Draw', 10);


-- PlayerStats
INSERT INTO PlayerStats (PlayerID, TotalGamesPlayed, TotalWins, TotalLosses, Rank) VALUES (1, 30, 18, 12, 'Gold');
INSERT INTO PlayerStats (PlayerID, TotalGamesPlayed, TotalWins, TotalLosses, Rank) VALUES (2, 45, 25, 20, 'Platinum');
INSERT INTO PlayerStats (PlayerID, TotalGamesPlayed, TotalWins, TotalLosses, Rank) VALUES (3, 10, 4, 6, 'Silver');
INSERT INTO PlayerStats (PlayerID, TotalGamesPlayed, TotalWins, TotalLosses, Rank) VALUES (4, 60, 40, 20, 'Diamond');
INSERT INTO PlayerStats (PlayerID, TotalGamesPlayed, TotalWins, TotalLosses, Rank) VALUES (5, 25, 10, 15, 'Bronze');

-- Invite
INSERT INTO Invite (SenderID, RecieverID, PartyID, SentAt) VALUES (1, 2, 1, '2025-05-23 14:00:00');
INSERT INTO Invite (SenderID, RecieverID, PartyID, SentAt) VALUES (3, 4, 2, '2025-05-23 14:05:00');
INSERT INTO Invite (SenderID, RecieverID, PartyID, SentAt) VALUES (5, 1, 3, '2025-05-23 14:10:00');
INSERT INTO Invite (SenderID, RecieverID, PartyID, SentAt) VALUES (2, 5, 1, '2025-05-23 14:15:00');
INSERT INTO Invite (SenderID, RecieverID, PartyID, SentAt) VALUES (4, 3, 2, '2025-05-23 14:20:00');

-- FriendList
INSERT INTO FriendList (PlayerID, FriendID, FriendSince) VALUES (1, 2, '2023-01-15'); 
INSERT INTO FriendList (PlayerID, FriendID, FriendSince) VALUES (1, 3, '2024-05-20');
INSERT INTO FriendList (PlayerID, FriendID, FriendSince) VALUES (2, 4, '2022-11-30'); 
INSERT INTO FriendList (PlayerID, FriendID, FriendSince) VALUES (3, 5, '2023-07-10'); 
INSERT INTO FriendList (PlayerID, FriendID, FriendSince) VALUES (4, 1, '2023-12-25');

-- Schedule
INSERT INTO Schedule (MatchID, ScheduledTime) VALUES (1, '2025-06-01 10:00:00');
INSERT INTO Schedule (MatchID, ScheduledTime) VALUES (2, '2025-06-02 14:00:00'); 
INSERT INTO Schedule (MatchID, ScheduledTime) VALUES (3, '2025-06-03 18:00:00'); 
INSERT INTO Schedule (MatchID, ScheduledTime) VALUES (4, '2025-06-04 09:00:00'); 
INSERT INTO Schedule (MatchID, ScheduledTime) VALUES (5, '2025-06-05 15:00:00');
