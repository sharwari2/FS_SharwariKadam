DATABASE DESIGN – Student Commute Optimizer

COLLECTION Students
    DOCUMENT student
        id: unique identifier (string)
        username: anonymous username (string)
        locationStart: { latitude, longitude }
        locationEnd: { latitude, longitude }
        travelPath: array of route points
        isAvailable: boolean
        createdAt: timestamp
    END DOCUMENT
END COLLECTION

COLLECTION Chats
    DOCUMENT chat
        chatId: unique identifier (string)
        participants: list of student IDs
        messages: array of message objects
            messageId: unique ID
            senderId: student ID
            content: text message
            timestamp: message time
        isActive: boolean
    END DOCUMENT
END COLLECTION

FUNCTION saveStudent(student)
    INSERT student into Students
    RETURN "Student registered successfully"
END FUNCTION

FUNCTION getAvailableStudents()
    QUERY Students where isAvailable == TRUE
    RETURN list of students
END FUNCTION

FUNCTION updateAvailability(studentId, status)
    FIND student by id
    SET isAvailable = status
    SAVE changes
    RETURN "Status updated"
END FUNCTION

FUNCTION createChatSession(studentAId, studentBId)
    GENERATE unique chatId
    CREATE chat with participants = [studentAId, studentBId]
    SET isActive = TRUE
    INSERT into Chats
    RETURN chatId
END FUNCTION

FUNCTION saveMessage(chatId, senderId, content)
    FIND chat by chatId
    CREATE message with unique ID and timestamp
    ADD message to chat’s messages
    SAVE chat
    RETURN "Message sent"
END FUNCTION

SECURITY MEASURES
    - No personal information stored
    - Messages encrypted during transfer
    - Index Students by locationStart and locationEnd for fast search
    - Index Chats by chatId and participants
END SECURITY
