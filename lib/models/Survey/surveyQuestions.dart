class SurveyQuestionModel {
  final String choiceToExit, title;
  final List<dynamic> choices, listOfUsername;
  final int isBranching, sar;

  SurveyQuestionModel(
      {this.sar,
      this.choices,
      this.choiceToExit,
      this.isBranching,
      this.listOfUsername,
      this.title});


   factory SurveyQuestionModel.fromDocument(List<dynamic> doc) {
     return SurveyQuestionModel(
         choiceToExit: doc[2],
         choices: doc[4],
         isBranching: doc[0],
         listOfUsername: doc[1],
         sar: doc[3],
         title: doc[5],
     );
   }
}
