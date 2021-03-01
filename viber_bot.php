<?php
/**
 * 
 * 
 * A Viber Bot server side implementation for presenting the timetable of the
 * Political Science Department Semester Timetable at AUTh
 * 
 * Developed By: Konstantinos Chertouras
 * 
 * 
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);
date_default_timezone_set('Europe/Athens');

setlocale(LC_TIME, 'el_GR.UTF-8');

$request = file_get_contents("php://input");
$input = json_decode($request, true);
$event_received = $input['event'];

switch ($event_received) {
    case 'webhook':
        $webhook_response['status'] = 0;
        $webhook_response['status_message'] = "ok";
        echo json_encode($webhook_response);
        die;
        break;
    case 'subscribed':
        header('HTTP/1.1 200 OK');
        $sender_ID = $input['sender']['id']; //unique viber id of user who sent the message
        $sender_name = $input['sender']['name'];
        $data['receiver'] = $sender_ID;
        $data['text'] = "Subscribed to Polsci Bot";
        $data['type'] = 'text';
        echo json_encode($data);
        break;
    
    case "conversation_started":
        
        $data['sender'] = array("name" => "Polsci Bot");
        $data['text'] = "Καλώς ήρθατε στο bot (Ανεπίσημο) προβολής προγράμματος του τμήματος Πολιτικών Επιστημών του ΑΠΘ. Παρακαλώ στείλτε τη λέξη menu στο bot για να συνδεθείτε.";

        $data['type'] = 'text';
        echo json_encode($data);
        break;
    case "message":
        header('HTTP/1.1 200 OK');
        handleMessage($input);
        //handleMessageOUT($input); Comment out to put the bot into a maintenance mode
        //Do not forget to comment out in this case the handleMessage($input);
      
	break;

    default:
        echo $event_received;
        break;
}

//The function implementing the connection to the Database containing the Timetable

function connectToDB()
{
      $servername = "xxxxxxxxxxxxxxxxxxxxxxx";
    $username = "xxxxxxxxxxxxxxxxxxxxxxx";
    $password = "xxxxxxxxxxxxxxxxxxxxx";
    $dbname = "polsci_timetable";
    $conn = new mysqli($servername, $username, $password, $dbname);
    $conn->set_charset('utf8');
    return $conn;

}


/***************************************************************************** */
//Function implenting the weekday program presentation
/***************************************************************************** */
function sendDayProgram($weekday)
{

    $conn = connectToDB();

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT classes.description , classes.code , classes.virtualClass , days.greekName, hours.hoursStart , place.placeName ,
	teachers.surname , classes.mandatory , semesters.semesterName, timetable.comments
  FROM classes , days , hours , place , teachers ,
	semesters, timetable where classes.mandatory IN (0,1)
	and days.englishName= ? and days.daysID = timetable.daysID and classes.semesterID=semesters.semesterID
	and timetable.classID=classes.classID and timetable.daysID=days.daysID and timetable.hoursID=hours.hoursID
	and timetable.placeID=place.placeID and timetable.teacherID=teachers.teacherID";

    if ($stmt = $conn->prepare($sql)) {

        $stmt->bind_param("s", $weekday);
        $status = $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows === 0) {
            $message = 'Δεν βρέθηκαν στοιχεία προγράμματος για τον συνδιασμό εξαμήνου/Ημέρας που επιλέξατε...';
            return $message;
        }
        $result_array = [];
        while ($row = $result->fetch_assoc()) {

            $greekName = $row['greekName'];
            $hourStart = $row['hoursStart'];
            $description = $row['description'];
            $classCode = $row['code'];
            $place = $row['placeName'];
            $teacherName = $row['surname'];
            $mandatory = $row['mandatory'];
            $semesterName = $row['semesterName'];
            $comments = $row['comments'];
            $virtualClass = $row['virtualClass'];
            if (!strlen($comments)) {
                $comments = 'Δεν υπάρχουν πρόσθετες πληροφορίες';
            }

            if ($mandatory == 1) {
                $print_status = "Υποχρεωτικό";
                $lex = 'Εξάμηνο:';
            } else { $print_status = "";
                $semesterName = 'Επιλογής - Χωρίς Εξάμηνο';
                $lex = '';}

            $result_to_send = '📅' . $greekName . chr(10) . '⌚' . $hourStart . ':00' . chr(10) . '📜'
            . $description . chr(10) . '📇' . $classCode . chr(10) . '👨‍🏫' . $teacherName . chr(10) . '🎓Αίθουσα: ' . $place . chr(10) .
            $print_status . chr(10) . $lex . $semesterName . chr(10) . '🔗' . $virtualClass . chr(10) . '💬' . $comments . chr(10) . chr(10);
            $result_array[] = $result_to_send;

        }
        $stmt->close();
        return $result_array;

    } else {
        $error = $conn->errno . ' ' . $conn->error;
        echo $error;
    }

}

/***************************************************************************** */
//The implementation of the keyboard presenting a so called carousel containing the teachers names.
/***************************************************************************** */
function createTeachersCarousel($parts)
{
    header('HTTP/1.1 200 OK');

    $teacher_keyboard_array = [];
    $teacher_keyboard_array['Type'] = 'rich_media';
    $teacher_keyboard_array['ButtonsGroupColumns'] = 3;
    $teacher_keyboard_array['ButtonsGroupRows'] = 4;
    $teacher_keyboard_array['BgColor'] = "#FFFFFF"; 
    $carousel = $teacher_keyboard_array;
    $teacher_details = [];

    $conn = connectToDB();

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM `teachers` WHERE surname >= '$parts[0]' and surname <='$parts[1]' and  teachers.isTeaching=1 ORDER BY `teachers`.`surname` ASC ";
    $result = $conn->query($sql);
    $carousel_size = ($result->num_rows);
    
    if ($result->num_rows > 0) {
        // output data of each row

        $teacher_details = $result->fetch_all(MYSQLI_ASSOC);

    } else {
        echo "0 results";
    }

    $conn->close();
    
    $carousel__components = ["Columns", "Rows", "BgColor", "TextVAlign", "TextHAlign", "Text", "TextSize", "ActionType", "ActionBody"];

    
    for ($i = 0; $i < $carousel_size; $i++) {
        $value = rand_color_viber();
        $text = $teacher_details[$i]['surname'] . ' ';
        $action = 'action_' . $teacher_details[$i]['teacherID']; 
        $values_to_combine = array('3', '2', $value, 'center', 'center', $text, 'regular', 'reply', $action);
        $carousel['Buttons'][] = array_combine($carousel__components, $values_to_combine);

    }

    
    return $carousel;
}

/***************************************************************************** */
//The initial teachers menu containing the name ranges 
/***************************************************************************** */
function createTeachersMenu()
{
    header('HTTP/1.1 200 OK');

    $teacher_details = [];
    //A VERY CRITICAL VALUE.
    //By changing CAROUSEL_SIZE you define the number of teacher names in the carousel
    $CAROUSEL_SIZE = 6;

    $conn = connectToDB();

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = 'Select * from teachers where isTeaching=1 order by surname ASC';

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        

        $result_array = $result->fetch_all(MYSQLI_ASSOC);
        $chunks[] = array_chunk($result_array, $CAROUSEL_SIZE);
        $teacher_details = $chunks;

    } else {
        echo

            "0 results";
    }

    $conn->close();

    $keyboard_array['Type'] = 'keyboard';
    $keyboard_array['DefaultHeight'] = false;
    $keyboard_array['BgColor'] = "#FFFFFF"; //#6495ED
    $keyboard = $keyboard_array;

    $chunks[] = $teacher_details[0]; 
    $menu_items = count($chunks[0]);

    $surname_limits = [];

    //create surname table

    for ($i = 0; $i < $menu_items; $i++) {
        $limit = count($chunks[0][$i]);

        for ($j = 0; $j < $limit; $j++) {

            $mytext = ($chunks[0][$i][$j]['surname']);
            $surname_limits[] = $mytext; 
        }
    }

    $chunks_surnames[] = array_chunk($surname_limits, $CAROUSEL_SIZE);
    $surname_limits = count($chunks_surnames[0]);

    for ($j = 0; $j < $surname_limits; $j++) {

        $first = reset($chunks_surnames[0][$j]);
        $last = end($chunks_surnames[0][$j]);
        $buttons[] = array($first, $last);

    }

    for ($j = 0; $j < count($buttons); $j++) {
        $teacher_names_title[$j] = $buttons[$j][0] . ' - ' . $buttons[$j][1];

    }
    $teacher_names_values = $teacher_names_title;

//Add a pointer to weekdays menu

    $teacher_names_title[] = 'Ωρολόγιο Πρόγραμμα';
    $teacher_names_values[] = 'menu';
    $keyboard_components = ["Columns", "Rows", "BgColor", "TextVAlign", "TextHAlign", "TextOpacity", "Text", "TextSize", "ActionType", "ActionBody"];

    for ($i = 0; $i < count($teacher_names_title); $i++) {

        if ($i == (count($teacher_names_title) - 1)) //change button color
        {
            $values_to_combine = array('2', '1', "#e3242b", 'center', 'center', '100', $teacher_names_title[$i], 'regular', 'reply', $teacher_names_values[$i]);
        } else {
            $values_to_combine = array('2', '1', "#2db9b9", 'center', 'center', '100', $teacher_names_title[$i], 'regular', 'reply', 'teachers_' . $teacher_names_values[$i]);
        }

        $keyboard['Buttons'][] = array_combine($keyboard_components, $values_to_combine);

    }
    
    return $keyboard;

}

/***************************************************************************** */
//The program of each teacher 
/***************************************************************************** */
function getTeachersProgram($teacherID)
{

    $conn = connectToDB();
    $teacher_courses = [];
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT * FROM (SELECT classes.description , classes.code ,
    days.greekName, days.daysID , hours.hoursStart , place.placeName , teachers.surname , classes.mandatory , semesters.semesterName ,
    timetable.comments ,classes.virtualClass
    FROM classes , days , hours , place , teachers , semesters, timetable where teachers.teacherId=?
    and timetable.hoursID=hours.hoursID and days.daysID = timetable.daysID
    and classes.semesterID=semesters.semesterID and timetable.classID=classes.classID
    and timetable.daysID=days.daysID and timetable.hoursID=hours.hoursID
    and timetable.placeID=place.placeID and timetable.teacherID=teachers.teacherID
    union
        SELECT classes.description , classes.code , days.greekName,  days.daysID ,hours.hoursStart , place.placeName ,
        teachers.surname , classes.mandatory , semesters.semesterName , timetable.comments ,classes.virtualClass
        FROM classes , days , hours , place , teachers ,
        semesters, timetable,coteaching where coteaching.teacherId=? and coteaching.teacherId=teachers.teacherID
        and timetable.classID=coteaching.classID
        and timetable.hoursID=hours.hoursID
        and days.daysID = timetable.daysID
        and classes.semesterID=semesters.semesterID
        and timetable.classID=coteaching.classID
        and timetable.classID = classes.classID
        and timetable.placeID=place.placeID )  results
    ORDER BY `results`.daysID  ASC";

    if ($stmt = $conn->prepare($sql)) {

        $stmt->bind_param("ii", $teacherID, $teacherID);
        $status = $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 0) {
            $teacher_courses[] = 'Δεν υπάρχουν ενεργές αναθέσεις για τον διδάσκοντα';
        }
        while ($row = $result->fetch_assoc()) {
            
            $greekName = $row['greekName'];
            $hourStart = $row['hoursStart'];
            $description = $row['description'];
            $classCode = $row['code'];
            $place = $row['placeName'];
            $teacherName = $row['surname'];
            $mandatory = $row['mandatory'];
            $semesterName = $row['semesterName'];
            $comments = $row['comments'];
            $virtualClass = $row['virtualClass'];

            if (!strlen($comments)) {
                $comments = 'Δεν υπάρχουν πρόσθετες πληροφορίες';}

            if ($mandatory == 1) {
                $print_status = "Υποχρεωτικό";
                $lex = 'Εξάμηνο:';
            } else {
                $print_status = "";
                $semesterName = 'Επιλογής - Χωρίς Εξάμηνο';
                $lex = '';
            }

            $result_to_send = '📅' . $greekName . chr(10) . '⌚' . $hourStart . ':00' . chr(10) . '📜'
            . $description . chr(10) . '📇' . $classCode . chr(10) . '👨‍🏫' . $teacherName . chr(10) . '🎓Αίθουσα: ' . $place . chr(10) .
            $print_status . chr(10) . $lex . $semesterName . chr(10) . '🔗' . $virtualClass . chr(10) . '💬' . $comments . chr(10) . chr(10);

            $teacher_courses[] = $result_to_send;

        }

        $sql = "Select timesCooperation as times , placeCooperation as place   from teachers where teacherID=$teacherID";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // output data of each row
            while ($row = $result->fetch_assoc()) {
                $result_to_send = 'Ώρες Συνεργασίας: ' . $row['times'] . chr(10) . 'Link / Τόπος Συνεργασίας: ' . $row['place'] . chr(10) . chr(10);
                $teacher_courses[] = $result_to_send;

            }
        } else {
            echo "0 results";
        }

        $stmt->close();
        
        return $teacher_courses;
    }
}



/***************************************************************************** */
//A Temporary function like a site maintenance equivalent
/***************************************************************************** */
function handleMessageOUT($input)
{
    $type = $input['message']['type']; //type of message received (text/picture)
    $text = $input['message']['text']; //actual message the user has sent
    $sender_ID = $input['sender']['id']; //unique viber id of user who sent the message
    $sender_name = $input['sender']['name']; //name of the user who sent the message
    $data['receiver'] = $sender_ID;
    $data['type'] = 'text';
 $data['text'] ='Σας ενημερώνουμε οτι το χειμερινό εξάμηνο 2020-2021 έληξε και δεν γίνονται μαθήματα αυτή την περίοδο';
    send_to_viber($data);
	
$data['text'] ='To bot θα επαναλειτουγήσει με την ανακοίνωση του προγράμματος του εαρινού εξαμήνου και την ενημέρωση της βάσης δεδομένων';
    send_to_viber($data);

$data['text'] ='Μείνετε συντονισμένες και συντονισμένοι! 24/01/2021 -Κ.Χερτούρας (chertour@gmail.com)';
    send_to_viber($data);

}
/***************************************************************************** */
//Main function implementing the parsing of the user command
/***************************************************************************** */
function handleMessage($input)
{
    
    $last_update = 'Τελευταία ενημέρωση στοιχείων προγράμματος: 28/02/2021';

/* when a user message is received */
    $type = $input['message']['type']; //type of message received (text/picture)
    $text = $input['message']['text']; //actual message the user has sent
    $sender_ID = $input['sender']['id']; //unique viber id of user who sent the message
    $sender_name = $input['sender']['name']; //name of the user who sent the message

    $days_array = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday'];
    $semesters_array = ['semester_a', 'semester_b', 'semester_c', 'semester_d', 'semester_e', 'semester_f', 'semester_z', 'semester_h'];
    $data = [];
    if (in_array($text, $days_array)) {
        $result_array = sendDayProgram($text);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = implode(chr(10), $result_array);
        $data['keyboard'] = createWeekdayMenu();

        send_to_viber($data);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = $last_update;

        send_to_viber($data);

    } elseif ($text == 'menu' || $text == 'Menu' || $text == 'Μενου'
        || $text == 'μενου' || $text == 'Μενού' || $text == 'μενού') {
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = "Παρακαλώ επιλέξτε από το παρακάτω μενού:";
        $data['keyboard'] = createWeekdayMenu();

        send_to_viber($data);

    } elseif ($text == 'courses_now') {

        $result_array = getCoursesNow();
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = implode(chr(10), $result_array);
        $data['keyboard'] = createWeekdayMenu();
        send_to_viber($data);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = $last_update;

        send_to_viber($data);

    } elseif ($text == 'courses_today_semester_compulsory') {

        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = 'Παρακαλώ επιλέξτε εξάμηνο. Θα εμφανιστούν μόνον τα υποχρεωτικά μαθήματα';
        $data['keyboard'] = createCoursesperSemesterCompulsoryKeyboard();
        send_to_viber($data);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = $last_update;

        send_to_viber($data);

    } elseif ($text == 'courses_today_semester_elective') {

        $decision=1; //Sql will return tne elective courses today 
        $result_array = getSemesterCompulsoryProgram(null, $decision);// no need for semester
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = implode(chr(10), $result_array);
        $data['keyboard'] = createCoursesperSemesterCompulsoryKeyboard();

        send_to_viber($data);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = $last_update;

        send_to_viber($data);

    } elseif ($text == 'teachers_menu') {

        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = 'Παρακαλώ επιλέξτε από τα προτεινόμενα ονόματα:';
        $data['keyboard'] = createTeachersMenu();

        send_to_viber($data);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = $last_update;

        send_to_viber($data);

    } elseif (in_array($text, $semesters_array)) {
        $decision=0; //Sql will return tne Compulsory of the semester
        $result_array = getSemesterCompulsoryProgram($text, $decision);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = implode(chr(10), $result_array);
        $data['keyboard'] = createCoursesperSemesterCompulsoryKeyboard();

        send_to_viber($data);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = $last_update;

        send_to_viber($data);

    } //if in_array

    elseif (substr($text, 0, 9) === "teachers_") {

        $clean_string = substr($text, strlen("teachers_"));
        $parts = explode(' - ', $clean_string);
        $result = createTeachersCarousel($parts);
        $data['receiver'] = $sender_ID;
        $data['type'] = 'rich_media';
        $data['min_api_version'] = 7;
        $data['rich_media'] = $result;
        send_to_viber($data);
        $data = [];
        $data['receiver'] = $sender_ID;
        $data['keyboard'] = createTeachersMenu();
        send_to_viber($data);

    } elseif (substr($text, 0, 7) === "action_") {

        $clean_string = intval(substr($text, strlen("action_")));
        $result_array = getTeachersProgram($clean_string);
        $data = [];
        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = implode(chr(10), $result_array);
        $data['keyboard'] = createTeachersMenu();
        send_to_viber($data);

    }  else {
        $data = [];

        $data['receiver'] = $sender_ID;
        $data['type'] = 'text';
        $data['text'] = "Η λέξη που στάλθηκε ως μήνυμα δεν αναγνωρίζεται! Παρακαλώ πληκτρολογήστε τη λέξη menu ";

        send_to_viber($data);

    }

}

/***************************************************************************** */
//The sending to viber implementation
/***************************************************************************** */
function send_to_viber($response)
{

    $ch = curl_init("https://chatapi.viber.com/pa/send_message");
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($response));
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json', 'charset=utf-8', 'X-Viber-Auth-Token:xxxxxxx-xxxxxxx-xxxxxxxxxxxx']);
    $result = curl_exec($ch);

    curl_close($ch);
}



/***************************************************************************** */
// The function implementing the presentation of the compulsory courses/semester message
/***************************************************************************** */
function getSemesterCompulsoryProgram($semester,$decision)
{
    $today = getdate();

    $day_of_week = $today['weekday'];
    $hours_now = $today['hours'];
    echo $semester;
    $conn = connectToDB();

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if ($decision==0){
    
    $sql = "SELECT classes.description , classes.code ,classes.virtualClass ,
    days.greekName, hours.hoursStart , place.placeName , teachers.surname , classes.mandatory , semesters.semesterName ,
     timetable.comments FROM classes , days , hours , place , teachers , semesters, timetable
     where days.englishName='$day_of_week' and days.daysID = timetable.daysID and classes.semesterID=semesters.semesterID
     and timetable.classID=classes.classID and timetable.daysID=days.daysID and timetable.hoursID=hours.hoursID
     and timetable.placeID=place.placeID and timetable.teacherID=teachers.teacherID
     and semesters.semesterMsgName='$semester'";
     }
     else 
     {
        $sql = "SELECT classes.description , classes.code ,classes.virtualClass ,
        days.greekName, hours.hoursStart , place.placeName , teachers.surname , classes.mandatory , semesters.semesterName ,
         timetable.comments FROM classes , days , hours , place , teachers , semesters, timetable
         where days.englishName='$day_of_week' and days.daysID = timetable.daysID and classes.semesterID=semesters.semesterID
         and timetable.classID=classes.classID and timetable.daysID=days.daysID and timetable.hoursID=hours.hoursID
         and timetable.placeID=place.placeID and timetable.teacherID=teachers.teacherID and classes.mandatory=0";

     }
    $result = $conn->query($sql);

    if ($result->num_rows === 0) {
       
     
         $message_about_semester_courses_now[] = 'Δεν βρέθηκαν μαθήματα για το εξαμηνό σας που να διεξάγονται σήμερα: ' . date("d/m/Y") ;
        return $message_about_semester_courses_now;

    }
    while ($row = $result->fetch_assoc()) {

        $greekName = $row['greekName'];
        $hourStart = $row['hoursStart'];
        $description = $row['description'];
        $classCode = $row['code'];
        $place = $row['placeName'];
        $teacherName = $row['surname'];
        $mandatory = $row['mandatory'];
        $semesterName = $row['semesterName'];
        $comments = $row['comments'];
        $virtualClass = $row['virtualClass'];
        if ($mandatory == 1) {$print_status = "Υποχρεωτικό";
            $lex = 'Εξάμηνο:';
        } else { $print_status = "";
            $semesterName = 'Επιλογής - Χωρίς Εξάμηνο';
            $lex = '';}
        if (!strlen($comments)) {
            $comments = 'Δεν υπάρχουν πρόσθετες πληροφορίες';
        }

        $result_to_send = '📅' . $greekName . chr(10) . '⌚' . $hourStart . ':00' . chr(10) . '📜'
        . $description . chr(10) . '📇' . $classCode . chr(10) . '👨‍🏫' . $teacherName . chr(10) . '🎓Αίθουσα: ' . $place . chr(10) .
        $print_status . chr(10) . $lex . $semesterName . chr(10) . '🔗' . $virtualClass . chr(10) . '💬' . $comments . chr(10) . chr(10);
        $result_array[] = $result_to_send;

    }
    $conn->close();
    return $result_array;

}
/***************************************************************************** */
//The viber keyboard containing the days for the initial screen
/***************************************************************************** */
function createWeekdayMenu()
{
    $keyboard_array['Type'] = 'keyboard';
    $keyboard_array['DefaultHeight'] = false;
    $keyboard_array['BgColor'] = "#FFFFFF";
    $keyboard = $keyboard_array;
    $weekdays_title = ['Δευτέρα', 'Τρίτη', 'Τετάρτη', 'Πέμπτη', 'Παρασκευή', 'Μαθήματα τώρα', "Μαθήματα σήμερα ανά εξάμηνο", 'Διδάσκοντες'];
    $weekdays_payload = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'courses_now', "courses_today_semester_compulsory", 'teachers_menu'];
    $keyboard_components = ["Columns", "Rows", "BgColor", "TextVAlign", "TextHAlign", "TextOpacity", "Text", "TextSize", "ActionType", "ActionBody"];

    for ($i = 0; $i < count($weekdays_title); $i++) {

        if ($i == (count($weekdays_title) - 1)) //change button color
        {
            $values_to_combine = array('2', '1', "#e3242b", 'center', 'center', '100', $weekdays_title[$i], 'regular', 'reply', $weekdays_payload[$i]);
        } else {
            $values_to_combine = array('2', '1', "#2db9b9", 'center', 'center', '100', $weekdays_title[$i], 'regular', 'reply', $weekdays_payload[$i]);
        }

        $keyboard['Buttons'][] = array_combine($keyboard_components, $values_to_combine);

    }

    return $keyboard;

}
//*************************************************************************** */
//The Viber keyboard that contain each semester name drawn from the database
/***************************************************************************** */
function createCoursesperSemesterCompulsoryKeyboard()
{
    $keyboard_array['Type'] = 'keyboard';
    $keyboard_array['DefaultHeight'] = false;
    $keyboard_array['BgColor'] = "#FFFFFF";
    $keyboard = $keyboard_array;

    $conn = connectToDB();

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT * FROM semesters where isRunning=1 ORDER BY semesterMsgName ASC";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_assoc()) {
            $semesters_title[] = $row['semesterName'] . '\' Εξάμηνο';
            $semesters_payload[] = $row['semesterMsgName'];

        }
    }
    $semesters_title[] = 'Σημερινά Μαθηματά Επιλογής';
    $semesters_payload[] = 'courses_today_semester_elective';
    $semesters_title[] = 'Επιστροφή';
    $semesters_payload[] = 'menu';

    $keyboard_components = ["Columns", "Rows", "BgColor", "TextVAlign", "TextHAlign", "TextOpacity", "Text", "TextSize", "ActionType", "ActionBody"];
    for ($i = 0; $i < count($semesters_title); $i++) {

        if ($i == (count($semesters_title) - 1)) //change button color
        {
            $values_to_combine = array('2', '1', "#e3242b", 'center', 'center', '100', $semesters_title[$i], 'regular', 'reply', $semesters_payload[$i]);
        } else {
            $values_to_combine = array('2', '1', "#2db9b9", 'center', 'center', '100', $semesters_title[$i], 'regular', 'reply', $semesters_payload[$i]);
        }

        $keyboard['Buttons'][] = array_combine($keyboard_components, $values_to_combine);

    }
    return $keyboard;
}

//*************************************************************************** */
//The function selecting a random color
/***************************************************************************** */
function rand_color_viber()
{

    $colors = array("#6c7a89", "#babcc9", "#c9bac0", "#e2f7c5", "#af851a", "#d5d5f0", "#aa8f00", "#cce5e4",
        "#807d67", "#856514", "#aa6b51", "#d47500", "#16a085", "#5d995d", "#019875", "#e26a6a", "#b381b3", "#3498db", "#638bb3", "#dedede", "#dcdae2", "#81e8ee", "#d5eef0");

    return $colors[array_rand($colors)];
}

function getCoursesNow()
{

    $today = getdate();

    $day_of_week = $today['weekday'];
    $hours_now = $today['hours'];

    $conn = connectToDB();

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT classes.description , classes.code ,classes.virtualClass , days.greekName, hours.hoursStart , place.placeName ,
teachers.surname , classes.mandatory , semesters.semesterName , timetable.comments FROM classes , days , hours , place , teachers ,
semesters, timetable where days.englishName= ? and timetable.hoursID=hours.hoursID and ?>= hours.hoursStart and ?< hours.hoursEnd   and days.daysID = timetable.daysID and classes.semesterID=semesters.semesterID
and timetable.classID=classes.classID and timetable.daysID=days.daysID and timetable.hoursID=hours.hoursID
and timetable.placeID=place.placeID and timetable.teacherID=teachers.teacherID";

    if ($stmt = $conn->prepare($sql)) {

        $stmt->bind_param("sii", $day_of_week, $hours_now, $hours_now);
        $status = $stmt->execute();
        $result = $stmt->get_result();

        $time_now = date("H:i:s");

        if ($result->num_rows === 0) {

            $message_with_hours[] = 'Δεν βρέθηκαν μαθήματα που διεξάγονται αυτή την ώρα: ' . $time_now;
            echo $message_with_hours;
            return $message_with_hours;

        }
        while ($row = $result->fetch_assoc()) {

            $greekName = $row['greekName'];
            $hourStart = $row['hoursStart'];
            $description = $row['description'];
            $classCode = $row['code'];
            $place = $row['placeName'];
            $teacherName = $row['surname'];
            $mandatory = $row['mandatory'];
            $semesterName = $row['semesterName'];
            $comments = $row['comments'];
            $virtualClass = $row['virtualClass'];
            if ($mandatory == 1) {$print_status = "Υποχρεωτικό";
                $lex = 'Εξάμηνο:';
            } else { $print_status = "";
                $semesterName = 'Επιλογής - Χωρίς Εξάμηνο';
                $lex = '';}
            if (!strlen($comments)) {
                $comments = 'Δεν υπάρχουν πρόσθετες πληροφορίες';
            }

            $result_to_send = '📅' . $greekName . chr(10) . '⌚' . $hourStart . ':00' . chr(10) . '📜'
            . $description . chr(10) . '📇' . $classCode . chr(10) . '👨‍🏫' . $teacherName . chr(10) . '🎓Αίθουσα: ' . $place . chr(10) .
            $print_status . chr(10) . $lex . $semesterName . chr(10) . '🔗' . $virtualClass . chr(10) . '💬' . $comments . chr(10) . chr(10);

            $result_array[] = $result_to_send;

        }
        $stmt->close();
        return $result_array;

    } else {

        echo ' Συνέβει κάποιο σφάλμα στην Βάση Δεδομένων';
    }
}
