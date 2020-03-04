# fill
Fill is a mobile application that allows users to earn money by answering various questions from queries and surveys.
In order for a user to be able to make money and use the application properly, he must be registered in the database.
There is a possibility that the user will skip registration, which allows him only to see questions and surveys. Without the ability to make money.

# Prerequisites
In order to run the application on emulator or on device (so far, it is runnable from IDE only), following is required:<br/>
•	Download Git and run Git Bash<br/>
•	Download Flutter and run flutter_console.bot<br/>
•	Download Andorid Studio for emulator<br/>
•	Copy path of bin folder (from Flutter installation folder) into system paths

# Installing
Get the project files, open the project from the IDE. After the device/emulator is connected, in order to run the application, type in terminal:
		flutter run
After some time, the application will be built on the device/emulator connected and it will be usasble on the device.

# Changes
**•	V1 – Sprint 1<br/>**
  	User story 1 - planning project, we have planned 
   planning of project architecture and structure.
   Arranging naming convention, code refactoring, class names, and class architectures.<br/>*
   	User Story 2 – Create a registry screen, which consists of multiple sub-screens. On this screen, we need to pick up a set of information that is relevant to the user’s use of the application itself.
Creating user registration using sms code and verifying the code itself.
If all the prerequisites and / or all fields are filled in, the user can successfully use the application and earn money.<br/>*
   	User Story 3 - Creating an login screen, which checks and validates user credentials. If everything is valid the user can successfully use the application.
The user has the forget password option, which sends him a mail request to reset the password.

Update(14.2)
The team successfully coded user story 2. During this period we had some changes from the investor design-wise. We have successfully adjusted designs and we are moving on to user story 3.
Only problem that we have was on verifyPin page validation-vise.

Update(17.2)
The team successfully coded user story 3. During this period we had some changes from the investor design-wise. We have successfully adjusted designs and we are moving on to the next sprint planning. We added our own reset password screen and figured out all that process with our own solutions. 
Very proud on team 2.

**•	V2 – Sprint 2<br/>**
  	User story 1 - fixing bugs from previous sprint<br/>
	The bugs were on the SIGN UP screen and they are: Error text, Text repeat and verify PIN.<br/>*
  	User story 2 - As a USER I want to HAVE FLASH QUESTIONS so that I CAN EASILY EARN SOME MONEY FROM TAB 1 IN FILL APP<br/>
	The user story was about to create Tab 1 screen on which flash questions are listed. Here, users are getting questions according to their level and every user can answer a question only once. Also, every question has its own target number which represents the maximum number of answers and a SAR value which is added to users cash balance (implemented as US 3). Questions may be of two types: Yes/No questions and MCQ. After a user answers a question, the answer gets recorder in database. Part of bottom navigation bar is implemented.<br/>*
	User story 3 - As a USER I want to HAVE MY CASH BALANCE so that I CAN EASILY PREVIEW MONEY FROM TAB 1 IN FILL APP<br/>
	Firstly, when user registers to the app and login for the first time, 5 SAR gets added to his/her cash balance, so every registered user begins with 5 SAR. Every time users answers a question, the question's SAR value is added to users cash balance and it is displayed all the time on Tab 1.<br/>*
	User story 4 - As a ANONYM USER I want to SKIP SIGN UP IN FILL APP so that I CAN EXPLORE FLASH QUESTION IN APP BEFORE REGISTRATION<br/>
	Anonymus user is authenticated by clicking on SKIP. The user is able to answer questions and collect cash as he/she is a registered user. The difference is that anonymus user will not be able to make cash transfers (will be implemented later).
