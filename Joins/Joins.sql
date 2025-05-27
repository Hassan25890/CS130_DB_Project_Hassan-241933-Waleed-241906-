SELECT P1.Username AS Player, P2.Username AS Friend, F.FriendSince
FROM FriendList F
JOIN Player P1 ON F.PlayerID = P1.PlayerID
JOIN Player P2 ON F.FriendID = P2.PlayerID;

SELECT GR.RequestID, P.Username, PT.PartyName, GM.ModeName, GR.RequestTime
FROM GameRequest GR
LEFT JOIN Player P ON GR.PlayerID = P.PlayerID
LEFT JOIN Party PT ON GR.PartyID = PT.PartyID
LEFT JOIN GameMode GM ON GR.GameModeID = GM.GameModeID;

SELECT GR.ResultID, P.Username, M.MatchID, GR.Score, GR.Result
FROM GameResult GR
INNER JOIN Player P ON GR.PlayerID = P.PlayerID
INNER JOIN Match M ON GR.MatchID = M.MatchID;

SELECT 
    I.InviteID,
    S.Username AS Sender,
    R.Username AS Receiver,
    I.SentAt
FROM Invite I
RIGHT JOIN Player S ON I.SenderID = S.PlayerID
RIGHT JOIN Player R ON I.RecieverID = R.PlayerID;

SELECT L.LobbyName, S.Location
FROM Lobby L
CROSS JOIN Server S;

SELECT P.PlayerID, P.Username, PL.PlatformName, PS.TotalGamesPlayed, PS.Rank
FROM Player P
FULL OUTER JOIN Platform PL ON P.PlatformID = PL.PlatformID
FULL OUTER JOIN PlayerStats PS ON P.PlayerID = PS.PlayerID;

SELECT S.ScheduleID, M.MatchID, GM.ModeName, S.ScheduledTime, M.StartTime
FROM Schedule S
INNER JOIN Match M ON S.MatchID = M.MatchID
INNER JOIN GameMode GM ON M.GameModeID = GM.GameModeID;

