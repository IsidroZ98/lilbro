import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step
    
    String text = "Add 360g water";
    int time = 30;

    //pass to constructor 
    final recipeStep = RecipeStep(text, time);
    
    //check that it has the right data matches the passed data
    expect(recipeStep.text, text);
    expect(recipeStep.time, time);
  
  });

  //tests for values of Text
  test('checks correct input for textValue should output "Cover and wait"', () {
    //check that it has the right data
    
    String text = RecipeStep.textValue("Cover and wait");

    expect(text, "Cover and wait");
  });

  test('throws argument error when input is empty string for text', () {
    
    //should throw argument error
    expect(() => RecipeStep.textValue(""), throwsArgumentError);
    
  });


  //tests for values of Time
  test('checks correct input for timeValue should output "30"', () {
    //check that it has the right data
    
    int time = RecipeStep.timeValue(30);

    expect(time, 30);
  });

  test('throws argument error when input is negative value for time (-30)', () {
    
    //should throw argument errro with neg value
    expect(() => RecipeStep.timeValue(-30), throwsArgumentError);
    
  });

  test('throws argument error when input is zero value for time (0)', () {
    
    //should throw argument errro with neg value
    expect(() => RecipeStep.timeValue(0), throwsArgumentError);
    
  });


  
}
