class QuestionsForSurvey {
  final qSurvey = [
    {
      /// 1
      "name": "TestSurvey-1QUESTION",
      "number_of_questions": 11,
      "sar_total": 80,
      "target": 1000,
      "level": 10,
      "users_completed": [],
      "list_of_username_answers": [],
      "list_of_usernames_that_gave_answers": [],
      "questions": [
        // {
        //   "title": "When is your birthday?",
        //   "type": "date",
        //   "sar": 35,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
        {
          "title": "Do you love football",
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
        {
          "title": "Choose the right image",
          "is_single": 0,
          "type": "image",
          "sar": 10,
          "is_branching": "",
          "choice_to_exit": "",
          "choices": [
            {"value": "item1", "text": ""},
            {"value": "item2", "text": ""},
            {"value": "item1", "text": ""},
            {"value": "item2", "text": ""},
          ]
        },
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
          "title": "Who is/are your favourite player(s)?",
          "type": "mcq",
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
            {"value": "item1", "text": ""},
            {"value": "item2", "text": ""},
            {"value": "item3", "text": ""},
            {"value": "item4", "text": ""},
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
            {"value": "item1", "text": ""},
            {"value": "item2", "text": ""},
            {"value": "item1", "text": ""},
            {"value": "item2", "text": ""},
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
        // {
        //   "title": "Do you love your job",
        //   "type": "input",
        //   "sar": 10,
        //   "is_branching": "",
        //   "choice_to_exit": "",
        // },
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
        {
          "title": "Do you love your job",
          "type": "input",
          "sar": 10,
          "is_branching": "",
          "choice_to_exit": "",
        },
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
          "is_single": 0,
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
