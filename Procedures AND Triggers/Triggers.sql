CREATE TRIGGER AutoPlayerStats
ON Player
AFTER INSERT
AS
BEGIN
    INSERT INTO PlayerStats (PlayerID)
    SELECT PlayerID FROM inserted;
END
GO

CREATE TRIGGER NoDupFriends
ON FriendList
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO FriendList (PlayerID, FriendID, FriendSince)
    SELECT I.PlayerID, I.FriendID, I.FriendSince
    FROM inserted I
    WHERE NOT EXISTS (
        SELECT 1 FROM FriendList F
        WHERE (F.PlayerID = I.PlayerID AND F.FriendID = I.FriendID)
           OR (F.PlayerID = I.FriendID AND F.FriendID = I.PlayerID)
    );
END
GO

CREATE TRIGGER MatchLog
ON Match
AFTER INSERT
AS
BEGIN
    PRINT 'New Match Added';
END
GO

CREATE TRIGGER NoNullGameMode
ON GameRequest
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE GameModeID IS NULL)
    ROLLBACK;
END
GO

CREATE TRIGGER InviteLog
ON Invite
AFTER INSERT
AS
BEGIN
    PRINT 'Invite Sent';
END
GO

CREATE TRIGGER trg_NoEmptyPartyName
ON Party
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE PartyName IS NULL OR LTRIM(RTRIM(PartyName)) = ''
    )
    BEGIN
        ROLLBACK;
    END
END
GO

CREATE TRIGGER LobbyMaxPlayers
ON Lobby
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE MaxPlayers > 100
    )
    BEGIN
        ROLLBACK;
    END
END
GO




