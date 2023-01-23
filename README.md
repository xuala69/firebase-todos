# firebase_todo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Firebase hmang tur a step tih ngai te:
1. Firebase project a app register a, project a integrate
2. pub.dev atangin kan mamawh tur package ho lak a project pubspec.yaml a add
    firebase hman dawn hrim2 in firebase core add tel zel tur ani, firebase a module hrang2 hman tlanglawn te leh a hmanna te
    -->Firebase core = Firebase hmang tur a core components ho atan
              https://pub.dev/packages/firebase_core
    -->Cloud firestore = Firebase database thar zawk hman nan 
               https://pub.dev/packages/cloud_firestore
    --> Firebase database = Firebase database hlui zawk hman nan
               https://pub.dev/packages/firebase_database
    --> firebase messaging = Push Notification hman nan
                https://pub.dev/packages/firebase_messaging
    -->Firebase auth = Authentication hman nan
                  https://pub.dev/packages/firebase_auth


### IT Training Test Project 

## Team 1: 
    Members: Joseph + Mathawhtea
    Project: Directory (Phone contact list)

## Team 2:
    Members: Samson + mama
    Project: Dictionary


# Directory app features:
    1. Add new contact to app 
    2. Edit contact
    3. Delete contact
    4. Contact can have profile picture(user tan optional)
    5. Home page ah saved contacts a lang ang (A-Z in)
    6. Sign in ngailo

# Dictionary app features:
    1. Enter/Add word with description and image (image optional)
    2. Edit word/description
    3. Delete word
    4. Homepage ah word add tawh list display tur (A-Z)
    5. Sign in ngailo


# Project requirements for both :
    1. Firebase firestore database ah data(contact or word+description) dah tur
    2. Image upload hi firebase storage ah upload tur
    3. Home page ah Listview ah item ho display tur ani anga, create new item or edit item hi page  thar ah kal tur a siam tur.

# Directory app siamdan steps:
    1. Project thar siam tur (VS Code ah Flutter project)
    2. Firebase console ah "IT Directory" tih project siam thar tur ani a, step 1 a project siam khi register tur.
    3. Fluter project VS Code ami edit dan tur ahnuai ami ang hian
    4. lib Folder chhungah folder thar "model" siam a "contact" tih model siam tur 
        Note: contact model hian variable ah a hnuai ami ang hian data a nei ang
        a) id -> String -> Non Nullable
        b) name -> String -> Non Nullable
        c) phone -> String -> Non Nullable
        d) image -> String -> Nullable
    5. lib Folder chhungah folder thar "ui" tih siam a, achhungah home.dart tih file siam tur
    6. home.dart file chhungah hian Stateful widget in HomePage() tih class siam leh tur (stateful widget ziahdawn in dart file siamthar ah stf tih type in suggestion ah Stateful widget alo lang mai thin)
    7. MyApp chhung a MaterialApp child a home value ah step 6 a kan siam HomePage() khi hman tur
    8. home.dart file edit dan tur a hnuai ami ang hian
    9. build function chhung a return ah Scaffold() return tir tur
    10. Scaffold parameter a appbar ah Appbar() variable pek a, Appbar() hi title ah Text widget in app hming hi ziah tur
    11. Scaffold body ah ListView.builder hmanga item list display tur ani ang(item neih phawt angai dawn a, last a tih ah pawh a fuh zawk maithei)
    12. ui folder chhungah new_contact_page.dart tih siam a, hemi ah hian Stateful widget hmangin CreateContact tih class hman tur (firebase_todos project ui ang deuh khan siam mai ni se duh chuan custom theih tho)
    13. Scaffold parameter a floatingActionButton ah FloatingActionButton() pass a, hemi click hian page thar ah (CreateContact() tih class step 12 a siamsa) kal tir tur(item thar siam tur in).
    14. Listview.builder in item a build pakhat click in (CreateContact() tih class step 12 a siamsa) a kaltir tur, hetah hian edit tur anih vangin list a item an click ber a kha pass tel tur ani ang.
    15. ListView.builder chhung a return ah khan ListTile hman tur
    16. ListTile a trailing ah item in image a neih chuan Image.network() a display tur ani anga, image a neihloh chuan Icons.person hman mai tur
    17. ListTile a title ah Text widget in contact name display tur ani anga, subtitle ah contact phone number display tur
    18. ListTile a trailing parameter ah IconButton() hman tur ani a, IconButton a icon ah hian Icons.delete hman tur ani ang.
    19. ListTile trailing a IconButton click khian dialog in Delete an duh leh duhloh confirm tir leh tur, an confirm hnu ah choh delete tur.


# Dictionary app siamdan steps:
    1. Project thar siam tur (VS Code ah Flutter project)
    2. Firebase console ah "IT Dictionary" tih project siam thar tur ani a, step 1 a project siam khi register tur.
    3. Fluter project VS Code ami edit dan tur ahnuai ami ang hian
    4. lib Folder chhungah folder thar "model" siam a "word" tih model siam tur 
        Note: contact model hian variable ah a hnuai ami ang hian data a nei ang
        a) id -> String -> Non Nullable
        b) title -> String -> Non Nullable
        c) description -> String -> Non Nullable
        d) image -> String -> Nullable
    5. lib Folder chhungah folder thar "ui" tih siam a, achhungah home.dart tih file siam tur
    6. home.dart file chhungah hian Stateful widget in HomePage() tih class siam leh tur (stateful widget ziahdawn in dart file siamthar ah stf tih type in suggestion ah Stateful widget alo lang mai thin)
    7. MyApp chhung a MaterialApp child a home value ah step 6 a kan siam HomePage() khi hman tur
    8. home.dart file edit dan tur a hnuai ami ang hian
    9. build function chhung a return ah Scaffold() return tir tur
    10. Scaffold parameter a appbar ah Appbar() variable pek a, Appbar() hi title ah Text widget in app hming hi ziah tur
    11. Scaffold body ah ListView.builder hmanga item list display tur ani ang(item neih phawt angai dawn a, last a tih ah pawh a fuh zawk maithei)
    12. ui folder chhungah new_word_page.dart tih siam a, hemi ah hian Stateful widget hmangin AddWord tih class hman tur (firebase_todos project ui ang deuh khan siam mai ni se duh chuan custom theih tho)
    13. Scaffold parameter a floatingActionButton ah FloatingActionButton() pass a, hemi click hian page thar ah (AddWord() tih class step 12 a siamsa) kal tir tur(item thar siam tur in).
    14. Listview.builder in item a build pakhat click in (AddWord() tih class step 12 a siamsa) a kaltir tur, hetah hian edit tur anih vangin list a item an click ber a kha pass tel tur ani ang.
    15. ListView.builder chhung a return ah khan ListTile hman tur
    16. ListTile a trailing ah item in image a neih chuan Image.network() a display tur ani anga, image a neihloh chuan Icons.person hman mai tur
    17. ListTile a title ah Text widget in word title display tur ani anga, subtitle ah word description  display tur
    18. ListTile a trailing parameter ah IconButton() hman tur ani a, IconButton a icon ah hian Icons.delete hman tur ani ang.
    19. ListTile trailing a IconButton click khian dialog in Delete an duh leh duhloh confirm tir leh tur, an confirm hnu ah choh delete tur.




### Android app build 
    1. Build modes
        Debug - VS Code atanga debug te nen a inang
        Profile - Release mode mock nan leh test nan
        Release - Store a upload tlak/finished product 
    
    2. Android apk build 
        flutter build apk --release
        heihi apk build na command ani a, "apk" tih keyword khi "appbundle" tih a thlak in playstore file bundle generate theih ani bawk
    
    
### Food Ordering app features
    1. Sign in e-mail/password or guest/anonymous
    2. End user app + Admin app + Restaurant app
    3. Admin app chu Directory nen feature inang deuh vek anga, sign in with email password a awm belh anga, restaurant  list display, add new/edit leh delete a awm bawk ang. hei hian restaurant app user tur a create ang(firebase console atanga user siam in, an uid leh email fill up tur angin).
    4. User app lamah menu list a awm anga, user ten an duh item an order thei anga, category/tag/restaurant hmangin an filter thei bawk ang.
    5. Admin app lamah categories/tag manage na a awm belh anga, categories/tag list an siamsa atangin restaurant app in a menu item atan alo select ang
    6. Restaurant user app (sign in chiah a awm ang) menu/item create/edit/delete a awm anga, home ah item list a in display ang.
    7. item an create/edit dawn ah categories /tag awmsa atangin an select ang.

## Collection structure
    1. restaurants
        id-string
        name-string
        description-string
        images- List<String>
        ownerId-String 
        ownerEmail- string

        menus sub collection a awm ang
            id-string
            name-string
            description-string
            images-List<String> (url of images)
            categories-List<Category>
            tag-List<Tag>
            available-bool
            price-double
        orders sub collection a awm bawk ang
            id-string
            name-string (ordertu name)
            status-string(order confirmed/picked up by courier etc)
            phone-string(ordertu phone)
            totalPayable-double
            items-List of Data
                Data model a field tur te
                    menuId-string (menus subcollection ami)
                    name-string(menus subcollection ami)
                    price-double-(menus subcollection ami)
                    quantity-int(sanpiau 2 )
                    image-(menus subcollection a images list ami pakhat dah)

    2. categories
        id-string
        title-string
        description-string
        image-string
    3. tags
        id-string
        title-string
    4. users
        id-string(id hi authentication atanga an uid neih hman tur)
        name-string
        email-string
        role-string (user/admin/restaurant)


        orders sub collection a awm bawk ang
            id-string
            name-string (ordertu name)
            phone-string(ordertu phone)
            totalPayable-double
            status-string(order confirmed/picked up by courier etc)
            items-List of Data
                Data model a field tur te
                    menuId-string (menus subcollection ami)
                    name-string(menus subcollection ami)
                    price-double-(menus subcollection ami)
                    quantity-int(sanpiau 2 )
                    image-(menus subcollection a images list ami pakhat dah)

## Khawih theih nghal
    1. Admin app - directory app ang anianga, create/edit page ah userId leh userEmail enter na tur dah tel tur (restaurants collection ah write tur)
    2. Admin app ah bawk, category+tag list display page leh CRUD na tur siam.

        
        

    
        



### Assignment Management app features
    1. Sign in email-password vek hman tur ani anga, sign in ngei2 angai ang
    2. End user(students) app + admin app 
    3. Admin app chu contacts app nen feature inang deuh vek anga, sign in with email-passowrd a awm belh anga, items list display, add new/edit leh delete a awm bawk ang.
    4. User app lamah assignment list a awm anga, heihi an current class based a filter sa tur ani ang.
    5. Admin app lamah class/combination manage na a awm belh anga, class/combination list an siamsa atangin assignment an add/edit dawn ah an va select ang.


## Collection structure
    1. assignments
        id-string
        title-string
        description-string
        images- List<String>(url list)
        pdfs-List<String>(url list)
        subject-Map {id:subjId,name:subjName}
        createdAt-Timestamp
        dueAt-Timestamp
        mark- Double
        semester-string
        year-string
        department-string

        submissions Sub collection a nei ang assignments hian
            id-string(from user)
            name-string(from user)
            answerText-string
            image - String?
            pdf-String?
            score-double
            submittedAt-Timestamp

    2. subjects
        id-string
        name-string
        description-string
        year-string
        department-string
        semester-string 

    3. users
        id-string(id hi authentication atanga an uid neih hman tur)
        name-string
        email-string
        currentSem-string
        currentYear-string
        currentDept-string
        

