CREATE TABLE Snap_Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255),
    Full_Name VARCHAR(255),
    Bitmoji VARCHAR(255),
    Registration_Date DATE
);

CREATE TABLE Snap (
    SnapID INT PRIMARY KEY,
    UserID INT,
    Media_Type VARCHAR(50),
    Snap_Content VARCHAR(255),
    Snap_Date TIMESTAMP,
    FilterID INT,
    FOREIGN KEY (UserID) REFERENCES Snap_Users(UserID),
    FOREIGN KEY (FilterID) REFERENCES Filters(FilterID)
);

CREATE TABLE Story (
    StoryID INT PRIMARY KEY,
    UserID INT,
    Story_Content TEXT,
    Story_Date TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Snap_Users(UserID)
);
DROP TABLE Chat;

CREATE TABLE Comment (
    CommentID INT PRIMARY KEY,
    SnapID INT,
    UserID INT,
    Text TEXT,
    Comment_Date TIMESTAMP,
    FOREIGN KEY (SnapID) REFERENCES Snap(SnapID),
    FOREIGN KEY (UserID) REFERENCES Snap_Users(UserID)
);

CREATE TABLE Inbox (
    InboxID INT PRIMARY KEY,
    UserID INT,
    Unread_Count INT,
    Last_Message TEXT,
    Last_Message_Date TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Snap_Users(UserID)
);

CREATE TABLE Friend (
    FriendshipID INT PRIMARY KEY,
    UserID INT,
    FriendID INT,
    Friendship_Date DATE,
    FOREIGN KEY (UserID) REFERENCES Snap_Users(UserID),
    FOREIGN KEY (FriendID) REFERENCES Snap_Users(UserID)
);

CREATE TABLE Filters (
    FilterID INT PRIMARY KEY,
    Filter_Name VARCHAR(255),
    Filter_Type VARCHAR(50),
    Filter_Content VARCHAR(255),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Snap_Users(UserID)
);
