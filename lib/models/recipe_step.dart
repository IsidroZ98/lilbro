class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    this.text = text;
    this.time = time;
  }

  static String textValue(text){
    //if text is empty string throw argument error
    if(text == ''){

      throw ArgumentError();
    }
    else{
      //if text is not empty then return text
      return text;
    }
  }

  static int timeValue(time){
    //if time is less than or equal to zero throw argument error
    if(time <= 0){

      throw ArgumentError();
    }
    else{
      //else return time
      return time;
    }
  }
}
