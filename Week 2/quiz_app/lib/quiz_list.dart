import 'question.dart';
class QuizList{
  int _questionNumber = 0;
  List<Question> questions = [
    Question("Bananas are curved because they grow upwards towards the sun", true),
    Question("Thomas Edison discovered gravity", false),
    Question("Venus is the hottest planet in the solar system", true),
    Question("An octopus has three hearts", true),
    Question("There are five different blood groups", false),
    Question("There are two parts of the body that can't heal themselves", false),
 ];
  void nextQuestion(){
    if(_questionNumber < questions.length-1){
      _questionNumber++;
    }
  }
    String getText(){
      return questions[_questionNumber].text;
    }
    bool getAnswer(){
      return questions[_questionNumber].answer;
    }
    bool isFinished(){
      if(_questionNumber >= questions.length-1){
        return true;
      }
    return false;
  }
  void reset(){
    _questionNumber = 0;
  }
}