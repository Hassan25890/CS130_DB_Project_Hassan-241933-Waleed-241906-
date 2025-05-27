UPDATE Player SET Username = 'DroopyBear'
WHERE PlayerID = 2;

UPDATE GameMode SET MaxPlayers = 10
WHERE ModeName = 'Death Match';

UPDATE SERVER SET Status = 'Under Maintainance'
WHERE ServerID = 3;

UPDATE PlayerStats SET RANK = 'Platinum'
WHERE PlayerID = 4;

UPDATE Party SET PartyName = 'Elite Squad'
WHERE PartyID = 1;

UPDATE Lobby SET MaxPlayers = 12 WHERE
LobbyName = 'Desert Battle';

UPDATE FriendList SET FriendSince = '2023-10-01'
WHERE PlayerID = 1 AND FriendID = 3;

UPDATE Match Set StartTime = '2025-06-01 
14:00:00' WHERE MatchID = 4;

UPDATE GameResult SET Score = '18 Kills'
WHERE ResultID = 4;