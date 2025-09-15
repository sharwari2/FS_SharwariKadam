# FS_SharwariKadam
Student Commute Optimizer
## STEP 1 - USER REGISTRATION
START
User opens the app
User enters starting location and destination

CALL registerStudent(locationStart, locationEnd)
    GENERATE unique ID
    GENERATE anonymous username
    CALCULATE route from locationStart to locationEnd
    STORE student profile in database
RETURN registration success
END

## STEP 2 - FINDING NEARBY STUDENTS
User clicks "Find Nearby Students"

CALL searchNearby(studentId)
    FETCH student profile from database
    FOR each other student in database
        IF student is available AND not the current student THEN
            CALCULATE overlap between travel paths
            IF overlap >= threshold THEN
                ADD student to nearby list
            END IF
        END IF
    END FOR
RETURN list of nearby students
END

## STEP 3 - DISPLAYING MATCHES
FOR each student in nearby list
    DISPLAY student’s icon on the map
END FOR

User clicks on student icon
CALL startChat(currentStudent, selectedStudent)
    OPEN chat window
RETURN chat session started
END

## STEP 4 - CHATTING 
User sends message
Message is transmitted securely
Other student receives message anonymously
Both students can chat without sharing personal details
END

## FUNCTIONS - 
FUNCTION calculateRoute(locationStart, locationEnd)
    CALL map API or algorithm
    RETURN route path
END FUNCTION

FUNCTION calculateOverlap(route1, route2)
    COMPARE paths
    RETURN overlap percentage
END FUNCTION

FUNCTION generateUniqueID()
    RETURN random or sequential unique ID
END FUNCTION

FUNCTION createAnonymousUsername()
    RETURN random username not linked to identity
END FUNCTION
