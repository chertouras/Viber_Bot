# Ένα bot στην πλατφόρμα Viber για την προβολή του ωρολογίου προγράμματος ενός εκπαιδευτικού ιδρύματος 
## A Viber Bot for presenting the timetable of a University Department 
Η παρούσα εφαρμογή δημιουργήθηκε με σκοπό την παροχή πληροφόρησης - με έναν εναλλακτικό τρόπο πέραν της ιστοσελίδας του κάθε τμήματος ΑΕΙ - σχετικά με το ωρολόγιο πρόγραμμα των μαθημάτων. 

Η συγκεκριμένη εφαρμογή προβάλει στο Viber :
 - Το ωρολογίο προγράμμα ανά ημέρα και ανα εξάμηνο σπουδών
 - Λεπτομέρειες για τις ώρες συνεργασίας των καθηγητών
 - Προβολή των μαθημάτων που διεξάγωνται αυτή την στιγμή


# Σύντομα σχόλια υλοποίησης
Η εφαρμογή είναι γραμμένη σε PHP και αποτελεί ουσιαστικά το server side κομμάτι που απαιτείται για το χειρισμό των web callbacks του Viber.

Η αρχιτεκτονική λειτουργίας συνοψίζεται στα εξής:
 - **Σημαντικό:** Είναι απολύτως απαραίτητη η μελέτη του Viber REST API Developers Documentation που είναι διαθέσιμο **[εδώ](https://developers.viber.com/docs/api/rest-bot-api/)**. 
 - Ως πρώτο βήμα απαιτείται η δημιουργία ενός Developer Account στο Viber όπου και δημιουργείται η εφαρμογή ως project στο viber και παρέχεται και το ειδικό κλειδί **token** με το οποίο θα γίνονται οι κλήσεις για service στην πλατφόρμα του Viber.
 <br/>Ενδεικτικά :
 ![Screenshot περιβάλλοντος Viber Developer](http://chertour.sites.sch.gr/viber_bot/github_documentation_images/viber_admin.png) 
 
 - Eγκαθίσταται ο Server Side κώδικας του Bot σε οποιονδήποτε webserver υποστηρίζει το πρωτόκολλο https. Στην περίπτωση του συγκεκριμένου bot, 
 αυτό εγκαταστάθηκε στις υποδομές του https://webhost.sch.gr, στο καινούργιο περιβάλλον του ΠΣΔ, 
 όπου υποστηρίζεται πλέον η παροχή SSL/TLS δωρεάν πιστοποιητικού μέσα από το control panel του χρήστη.
 
 - To Viber ενημερώνεται με μια κλήση HTTP POST για την ύπαρξη της εφαρμογής και την ακριβή τοποθεσία του κώδικα του bot. 
 Το συγκεκριμένο καθήκον μπορεί να γίνει με το εργαλείο [POSTMAN](https://www.postman.com/downloads/)** και η κλήση HTTP POST πρέπει να έχει τα εξής στοιχεία  :**
     - Έναν **HTTP Header** της μορφής: **X-Viber-Auth-Token** με τιμή το κλειδί **(token)** του χρήστη που υπάρχει στον developer account που δημιουργείται στο https://partners.viber.com
     - To εξής **raw** κομμάτι στο Body του **POST request** : 
     ```
     {
   "url":"https://xxxxxxxxxxxxxxxx.php",
    "event_types":["subscribed", "delivered","conversation_started"]
    } 
    ```
	Ενδεικτικά η κλήση μέσα από το περιβάλλον του **[POSTMAN](https://www.postman.com/downloads/) εμφανίζεται στις δύο παρακάτω οθόνες: 
	- ![Screenshot εισαγωγής του X-Viber-Auth-Token](http://chertour.sites.sch.gr/viber_bot/github_documentation_images/x_auth.png) 
	και	
	- ![!Screenshot αποστολής του url του Bot](http://chertour.sites.sch.gr/viber_bot/github_documentation_images/url.png)  
	
Όπου **'xxxxxxxxxxxxxxxx.php'** η ακριβής διεύθυνση της θέσης οπου βρίσκεται ο κώδικας του Bot.
     Για τα event_types που εμφανίζονται στο παραπάνω json απόσπασμα υπάρχουν λεπτομέρειες στο documentation του Viber.


 - Αφού ενημερωθεί η πλατφόρμα του Viber για το που βρίσκεται ο κώδικας που θα εξυπηρετεί τα http callbacks, o χρήστης προσθέτει το bot στο κινητό του τηλέφωνο **ως μια επαφή του Viber**, με σκοπό να γίνει subscribed στο bot. 
 - Για να προστεθεί ως επαφή του Viber o χρήστης θα πρέπει να κάνει προσθήκη επαφής με τη φωτογράφηση του QR CODE που αντιστοιχεί στην εφαρμογή και παρέχεται από το Viber. 
 <br/><center>![QR CODE](http://chertour.sites.sch.gr/viber_bot/github_documentation_images/qr_code.png)  </center>
 
 - **ΠΡΟΣΟΧΗ - ΠΡΟΣΟΧΗ** : Το συγκεκριμένο QR Code αφορά την δική μου DEMO εφαρμογή και έχει ώς σκοπό να μπορέσει ο κάθε ενδιαφερόμενος να δει απλά ένα σενάριο λειτουργίας. Μπορεί και να αφαιρεθεί στο μέλλον.
 - Στην συνέχεια και αφού o χρήστης γίνει subscribed στο bot, το bot αποστέλλει έτοιμα "πληκτρολόγια" ωστε να μην υπάρχει ανάγκη πληκτρολόγησης 
 για εντολές στο chat αλλά να γίνεται δυνατή η χρήση μέσω έτοιμων **menu**. 
 - Υποστηρίζεται φυσικά η εντολή **menu** όπου φέρνει στον χρήστη το αρχικό πληκτρολόγιο της εφαρμογής.
 


# Διαγραφή - Unsubscribe από το BOT:

Ο κάθε χρήστης μπορεί να γίνει unsubscribed σβήνοντας απλά την επαφή του ΒOT που πρόσθεσε στο Viber. <br/>
**ΠΡΟΣΟΧΗ -  Αν ο διαχειριστής σβήσει την επαφή, 
το Viber πιθανά να σβήσει και την εφαρμογή από το περιβάλλον του, μιας δεν εμφανίζεται ποια κανένας administator για την εφαρμογή.**


# Απαραίτητες ρυθμίσεις στον κώδικα: 

#### Τοποθέτηση των προσωποποιημένων παραμέτρων που αφορούν τη βάση δεδομένων και το token από το Developer Account του Viber

- Στον κώδικα του bot εμφανίζεται η παρακάτω ρουτίνα :
```function connectToDB()
{
    $servername = "xxxxxxxxxxxx";
    $username = "xxxxxxxxxxxxxx";
    $password = "xxxxxxxxxxxxx";
    $dbname = "polsci_timetable";
    $conn = new mysqli($servername, $username, $password, $dbname);
    $conn->set_charset('utf8');
    return $conn;

}
```
Στα στοιχεία που είναι σημειωμένα με **'xxxxxxxxxx'**  θα πρέπει να εισάγουμε τα στοιχεία σύνδεσης του εξυπηρετητή της βάσης δεδομένων. 
Αυτά παρέχονται πάντα από τον πάροχο και στο σχολικό δίκτυο είναι στις πληροφορίες σύνδεσης. 
Να σημειώσω οτι στην δική μου περίπτωση το όνομα της βάσης δεδομένων είναι **polsci_timetable**. 
Προφανώς μπορεί πολύ εύκολα να αλλάξει. 


- Όμοια στην ρουτίνα που υλοποιεί την κλήση στο ΑPI του Viber:
```
function send_to_viber($response)
{

    $ch = curl_init("https://chatapi.viber.com/pa/send_message");
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($response));
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json', 'charset=utf-8', 'X-Viber-Auth-Token:xxxxxxx-xxxxxxx-xxxxxxxxxxxx']);
    $result = curl_exec($ch);

    curl_close($ch);
}
```

στην παράμετρο **X-Viber-Auth-Token** τοποθετούμε το κλειδί που μας έχει χορηγηθεί από το περιβάλλον του https://partners.viber.com

##### Σχετικά με το Schema της βάσης δεδομένων

Η βάση δεδομένων, ως σχήμα, απο την οποία αντλεί τα στοιχεία του προγράμματος η εφαρμογή παρέχεται μαζί με το πρόγραμμα. 
Είναι προσυμπληρωμένη με τα στοιχεία του ωρολογίου προγράμματος του τμήματος Πολιτικών Επιστημών του ΑΠΘ. 
Μπορεί όμως εύκολα να προσαρμοστεί για τις ανάγκες των σχολείων της Α'θμιας και Β'θμιας Εκπαίδευσης. 

Υπάρχουν οι εξής πίνακες: 
 - **classes** - που περιλαμβάνει τα χαρακτηριστικά του κάθε μαθήματος (τίτλο , κωδικό , κλπ)
 - **coteaching** - όπου ορίζονται οι συνδιδασκαλίες
 - **days** - δηλώνονται οι ημέρες της εβδομάδας
 - **hours** - οι ώρες των μαθημάτων
 - **place** - o χωρος που γίνεται η διάλεξη
 - **semester** - τα εξάμηνα σπουδων και η λεκτική περιγραφή τους (**περιλαμβάνει και το πολύ σημαντικό flag isRunning για το ποια εξάμηνα να εμφανίζονται ως επιλογές στο bot**)
 - **teachers** - οι διδάσκοντες ( **περιλαμβάνονται και στοιχεία όπως η ψηφιακή τους τάξη και το αν διδάσκουν isteaching - boolean - ή όχι**)
 - **timetable** - το ωρολόγιο πρόγραμμα
 
 Υπάρχει πλήθος foreign keys ώστε να μην εμφανίζονται ασυνέπειες (όσες τουλάχιστον μπόρεσα να φανταστώ).
 
Δυστυχώς δεν υπάρχει χρόνος για εκτενέστερο documentation.
Ελπίζω έστω και μια / ένας να επωφεληθεί.

**Ερωτήσεις - απορίες: chertour@sch.gr**

**Ο κώδικας έχει άδεια GPL 3.0 και είναι πλήρως ελεύθερος.**

**Δεν δίνεται καμία εγγύηση και δεν φέρεται καμία ευθύνη από την μεριά μου για ότι προκύψει από τη χρήση της εφαρμογής.**

**Τελευταία Ενημέρωση : 10/3/2021**
