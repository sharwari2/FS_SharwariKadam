-- Table for storing student profiles
CREATE TABLE Students (
    id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    locationStartLat FLOAT NOT NULL,
    locationStartLng FLOAT NOT NULL,
    locationEndLat FLOAT NOT NULL,
    locationEndLng FLOAT NOT NULL,
    travelPath JSON,
    isAvailable BOOLEAN DEFAULT TRUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table for storing chat sessions
CREATE TABLE Chats (
    chatId VARCHAR(50) PRIMARY KEY,
    isActive BOOLEAN DEFAULT TRUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table for linking chat participants
CREATE TABLE ChatParticipants (
    chatId VARCHAR(50),
    studentId VARCHAR(50),
    PRIMARY KEY(chatId, studentId),
    FOREIGN KEY(chatId) REFERENCES Chats(chatId),
    FOREIGN KEY(studentId) REFERENCES Students(id)
);

-- Table for storing chat messages
CREATE TABLE Messages (
    messageId VARCHAR(50) PRIMARY KEY,
    chatId VARCHAR(50),
    senderId VARCHAR(50),
    content TEXT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(chatId) REFERENCES Chats(chatId),
    FOREIGN KEY(senderId) REFERENCES Students(id)
);

-- Indexes for faster search
CREATE INDEX idx_students_start ON Students(locationStartLat, locationStartLng);
CREATE INDEX idx_students_end ON Students(locationEndLat, locationEndLng);
CREATE INDEX idx_chats_active ON Chats(isActive);
