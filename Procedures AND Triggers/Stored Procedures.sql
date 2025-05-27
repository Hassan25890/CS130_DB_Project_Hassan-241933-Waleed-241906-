CREATE PROCEDURE AddFriend
    @PlayerID INT,
    @FriendID INT,
    @FriendSince DATE
AS
BEGIN
    INSERT INTO FriendList (PlayerID, FriendID, FriendSince)
    VALUES (@PlayerID, @FriendID, @FriendSince);
END

CREATE PROCEDURE CreateParty
    @LeaderID INT,
    @PartyName VARCHAR(100)
AS
BEGIN
    INSERT INTO Party (LeaderID, Status, PartyName)
    VALUES (@LeaderID, 'Active', @PartyName);

    DECLARE @PartyID INT = SCOPE_IDENTITY();

    INSERT INTO PartyMembers (PartyID, PlayerID)
    VALUES (@PartyID, @LeaderID);
END

CREATE PROCEDURE JoinParty
    @PartyID INT,
    @PlayerID INT
AS
BEGIN
    INSERT INTO PartyMembers (PartyID, PlayerID)
    VALUES (@PartyID, @PlayerID);
END

CREATE PROCEDURE SendInvite
    @SenderID INT,
    @ReceiverID INT,
    @PartyID INT
AS
BEGIN
    INSERT INTO Invite (SenderID, RecieverID, PartyID, SentAt)
    VALUES (@SenderID, @ReceiverID, @PartyID, GETDATE());
END

CREATE PROCEDURE MakeGameRequest
    @PlayerID INT = NULL,
    @PartyID INT = NULL,
    @GameModeID INT
AS
BEGIN
    INSERT INTO GameRequest (PlayerID, PartyID, GameModeID, RequestTime)
    VALUES (@PlayerID, @PartyID, @GameModeID, GETDATE());
END

CREATE PROCEDURE ScheduleMatch
    @GameModeID INT,
    @ServerID INT,
    @LobbyID INT,
    @ScheduledTime DATETIME
AS
BEGIN
    INSERT INTO Match (GameModeID, ServerID, StartTime, LobbyID)
    VALUES (@GameModeID, @ServerID, @ScheduledTime, @LobbyID);

    DECLARE @MatchID INT = SCOPE_IDENTITY();

    INSERT INTO Schedule (MatchID, ScheduledTime)
    VALUES (@MatchID, @ScheduledTime);
END

CREATE PROCEDURE RecordGameResult
    @MatchID INT,
    @PlayerID INT,
    @Score VARCHAR(50),
    @Result VARCHAR(30)
AS
BEGIN
    INSERT INTO GameResult (MatchID, PlayerID, Score, Result)
    VALUES (@MatchID, @PlayerID, @Score, @Result);
END

