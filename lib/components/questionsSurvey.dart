class QuestionsForSurvey {
  final qSurvey = [
    {
      "name": "Dropdown Survey",
      "number_of_questions": 14,
      "sar_total": 80,
      "target": 1000,
      "level": 5,
      "users_completed": [],
      "list_of_username_answers": [],
      "list_of_usernames_that_gave_answers": [],
      "questions": [
        {
          "title": "When is your birthday?",
          "type": "date",
          "subtype": "all",
          "sar": 35,
          "is_branching": "",
          "choice_to_exit": "",
        },
        {
          "title": "What is your favourite day number?",
          "type": "date",
          "subtype": "day",
          "sar": 35,
          "is_branching": "",
          "choice_to_exit": "",
        },
        {
          "title": "What is your favourite month?",
          "type": "date",
          "subtype": "month",
          "sar": 35,
          "is_branching": "",
          "choice_to_exit": "",
        },
        {
          "title": "When is your birthday year?",
          "type": "date",
          "subtype": "year",
          "sar": 35,
          "is_branching": "",
          "choice_to_exit": "",
        },
        {
          "title": "Choose best Manchester United player",
          "type": "dropdown",
          "sar":20,
          "is_branching":"",
          "choice_to_exit":"",
          "choices":[
            {"value":"item1", "text":"Rashword"},
            {"value":"item2", "text":"Matic"},
            {"value":"item3", "text":"Pogba"},
            {"value":"item4", "text":"Martial"},
          ]
        },
        {
          "title": "Choose best Juventus player",
          "type": "dropdown",
          "sar":20,
          "is_branching":"",
          "choice_to_exit":"",
          "choices":[
            {"value":"item1", "text":"Ronaldo"},
            {"value":"item2", "text":"Buffon"},
            {"value":"item3", "text":"Dybala"},
            {"value":"item4", "text":"Costa"},
          ]
        },
        // {
        //   "title": "Do you love football",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
          {
          "title": "Do you love basketball",
          "type": "yesno",
          "sar": 10,
          "is_branching": "",
          "choice_to_exit": "",
          "choices": [
            {"value": "item1", "text": "Yes"},
            {"value": "item2", "text": "No"},
          ]
        },
        // {
        //   "title": "Choose the right image",
        //   "is_single": 0,
        //   "type": "image",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": ""},
        //     {"value": "item2", "text": ""},
        //     {"value": "item1", "text": ""},
        //     {"value": "item2", "text": ""},
        //   ]
        // },
        {
          "title": "Do you love beer",
          "type": "yesno",
          "sar": 10,
          "is_branching": "",
          "choice_to_exit": "",
          "choices": [
            {"value": "item1", "text": "Yes"},
            {"value": "item2", "text": "No"},
          ]
        },
        {
          "title": "Order players!?",
          "type": "order",
          "is_single": 1,
          "sar": 15,
          "is_branching": "",
          "choice_to_exit": "",
          "choices": [
            {"value": "item1", "text": "Cristiano Ronaldo"},
            {"value": "item2", "text": "Lionel Messi"},
            {"value": "item3", "text": "Mohamed Salah"},
            {"value": "item4", "text": "Edin Džeko"},
          ]
        },
        // {
        //   "title": "Do you love your job",
        //   "type": "input",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        //  {
        //   "title": "Do you love your mother",
        //   "type": "input",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        {
          "title": "Choose the appropriate image",
          "type": "image",
          "sar": 10,
          "is_single": 1,
          "is_branching": "",
          "choice_to_exit": "",
          "choices": [
            {"value": "Image 1", "text": "https://firebasestorage.googleapis.com/v0/b/fill-c371b.appspot.com/o/1200px-React-icon.svg.png?alt=media&token=79bdda5b-c4fe-4146-848f-a11e7d3d10d0"},
            {"value": "Image 2", "text": "https://firebasestorage.googleapis.com/v0/b/fill-c371b.appspot.com/o/355-3557482_flutter-logo-png-transparent-png.png?alt=media&token=df4781a8-1177-48eb-9bad-70d2ba2e43a6"},
            {"value": "Image 3", "text": "https://firebasestorage.googleapis.com/v0/b/fill-c371b.appspot.com/o/6980741_preview.png?alt=media&token=2c40096b-4e2d-402e-bee2-493e7f6566e3"},
            {"value": "Image 4", "text": "https://firebasestorage.googleapis.com/v0/b/fill-c371b.appspot.com/o/Android_robot.png?alt=media&token=5a6ed677-7014-4d0c-af56-00807ef2b289"},
          ]
        },
        // {
        //   "title": "Do you love flutter",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
        // {
        //   "title": "Do you love your job",
        //   "type": "input",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        // {
        //   "title": "What is your favourite club?",
        //   "type": "mcq",
        //   "is_single": 1,
        //   "sar": 5,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Real Madrid"},
        //     {"value": "item2", "text": "Liverpool"},
        //     {"value": "item3", "text": "PSG"},
        //   ]
        // },
        // {
        //   "title": "Who is/are your favourite player(s)?",
        //   "type": "mcq",
        //   "is_single": 0,
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Cristiano Ronaldo"},
        //     {"value": "item2", "text": "Lionel Messi"},
        //     {"value": "item3", "text": "Mohamed Salah"},
        //     {"value": "item4", "text": "Edin Džeko"},
        //   ]
        // },
        // {
        //   "title": "Who is/are your favourite player(s)?",
        //   "type": "mcq",
        //   "is_single": 1,
        //   "sar": 15,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Cristiano Ronaldo"},
        //     {"value": "item2", "text": "Lionel Messi"},
        //     {"value": "item3", "text": "Mohamed Salah"},
        //     {"value": "item4", "text": "Edin Džeko"},
        //   ]
        // },
        // {
        //   "title": "What is your favourite club?",
        //   "type": "mcq",
        //   "is_single": 0,
        //   "sar": 20,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Real Madrid"},
        //     {"value": "item2", "text": "Liverpool"},
        //     {"value": "item3", "text": "PSG"},
        //   ]
        // },
        // ///2
        //  {
        //   "title": "When is your anniversary with your girlfriend/wife?",
        //   "type": "date",
        //   "sar": 35,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        // {
        //   "title": "Do you have corona virus?",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
        {
          "title": "Select appropriate image",
          "is_single": 0,
          "type": "image",
          "sar": 10,
          "is_branching": "",
          "choice_to_exit": "",
          "choices": [
            {"value": "Image 1", "text": "https://firebasestorage.googleapis.com/v0/b/fill-c371b.appspot.com/o/1200px-React-icon.svg.png?alt=media&token=79bdda5b-c4fe-4146-848f-a11e7d3d10d0"},
            {"value": "Image 2", "text": "https://firebasestorage.googleapis.com/v0/b/fill-c371b.appspot.com/o/355-3557482_flutter-logo-png-transparent-png.png?alt=media&token=df4781a8-1177-48eb-9bad-70d2ba2e43a6"},
            {"value": "Image 3", "text": "https://firebasestorage.googleapis.com/v0/b/fill-c371b.appspot.com/o/6980741_preview.png?alt=media&token=2c40096b-4e2d-402e-bee2-493e7f6566e3"},
            {"value": "Image 4", "text": "https://firebasestorage.googleapis.com/v0/b/fill-c371b.appspot.com/o/Android_robot.png?alt=media&token=5a6ed677-7014-4d0c-af56-00807ef2b289"},
          ]
        },
        // {
        //   "title": "Do you love chocolate milk?",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
        // {
        //   "title": "Write your full name",
        //   "type": "input",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        // {
        //   "title": "Select picture",
        //   "type": "image",
        //   "sar": 10,
        //   "is_single": 1,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": ""},
        //     {"value": "item2", "text": ""},
        //     {"value": "item3", "text": ""},
        //     {"value": "item4", "text": ""},
        //   ]
        // },
        // {
        //   "title": "Do you care about planet?",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
        // {
        //   "title": "What is the name of capital city of Bulgaria?",
        //   "type": "input",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        // {
        //   "title": "What is your favourite thing about corona virus?",
        //   "type": "mcq",
        //   "is_single": 1,
        //   "sar": 5,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Remote work"},
        //     {"value": "item2", "text": "People are scared"},
        //     {"value": "item3", "text": "Washing your hands"},
        //   ]
        // },
        // {
        //   "title": "Who is/are your favourite player(s)?",
        //   "type": "mcq",
        //   "is_single": 0,
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Cristiano Ronaldo"},
        //     {"value": "item2", "text": "Lionel Messi"},
        //     {"value": "item3", "text": "Mohamed Salah"},
        //     {"value": "item4", "text": "Edin Džeko"},
        //   ]
        // },
        // {
        //   "title": "Who is/are your favourite player(s)?",
        //   "type": "mcq",
        //   "is_single": 1,
        //   "sar": 15,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Cristiano Ronaldo"},
        //     {"value": "item2", "text": "Lionel Messi"},
        //     {"value": "item3", "text": "Mohamed Salah"},
        //     {"value": "item4", "text": "Edin Džeko"},
        //   ]
        // },
        // {
        //   "title": "What is your favourite club?",
        //   "type": "mcq",
        //   "is_single": 0,
        //   "sar": 20,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Real Madrid"},
        //     {"value": "item2", "text": "Liverpool"},
        //     {"value": "item3", "text": "PSG"},
        //   ]
        // },
        //  {
        //   "title": "When is your birthday?",
        //   "type": "date",
        //   "sar": 35,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        // {
        //   "title": "Do you love football",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
        // {
        //   "title": "Choose the right image",
        //   "is_single": 0,
        //   "type": "image",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": ""},
        //     {"value": "item2", "text": ""},
        //     {"value": "item1", "text": ""},
        //     {"value": "item2", "text": ""},
        //   ]
        // },
        // {
        //   "title": "Do you love beer",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
        {
          "title": "Who is/are your favourite player(s)?",
          "type": "mcq",
          "is_single": 0,
          "sar": 10,
          "is_branching": "",
          "choice_to_exit": "",
          "choices": [
            {"value": "item1", "text": "Cristiano Ronaldo"},
            {"value": "item2", "text": "Lionel Messi"},
            {"value": "item3", "text": "Mohamed Salah"},
            {"value": "item4", "text": "Edin Džeko"},
          ]
        },
        {
          "title": "Do you love your job",
          "type": "input",
          "sar": 10,
          "is_branching": "",
          "choice_to_exit": "",
        },
        // {
        //   "title": "Choose the appropriate image",
        //   "type": "image",
        //   "sar": 10,
        //   "is_single": 1,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": ""},
        //     {"value": "item2", "text": ""},
        //     {"value": "item3", "text": ""},
        //     {"value": "item4", "text": ""},
        //   ]
        // },
        // {
        //   "title": "Do you love flutter",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
        //  {
        //   "title": "Do you love chinese food",
        //   "type": "yesno",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Yes"},
        //     {"value": "item2", "text": "No"},
        //   ]
        // },
        // {
        //   "title": "What is your favourite band?",
        //   "type": "input",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        // {
        //   "title": "What is your favourite club?",
        //   "type": "mcq",
        //   "is_single": 1,
        //   "sar": 5,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        //   "choices": [
        //     {"value": "item1", "text": "Real Madrid"},
        //     {"value": "item2", "text": "Liverpool"},
        //     {"value": "item3", "text": "PSG"},
        //   ]
        // },
        
        {
          "title": "What is your favourite club?",
          "type": "mcq",
          "is_single": 1,
          "sar": 20,
          "is_branching": "",
          "choice_to_exit": "",
          "choices": [
            {"value": "item1", "text": "Real Madrid"},
            {"value": "item2", "text": "Liverpool"},
            {"value": "item3", "text": "PSG"},
          ]
        },
      ]
    },
  ];
}
