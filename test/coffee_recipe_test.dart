import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid coffee recipe', () {
    //make a coffee recipe
    //this variables will be used to pass to the constructor
    String name = "Sweet Maria's";
    int coffeeVolumeGrams = 22;
    String grindSize = "finely ground coffee";
    int waterVolumeGrams = 360;
    String miscDetails = "The original recipe: makes one delicious cup";
    List<RecipeStep> steps = [];

    //pass to constructor
    final coffeeRecipe = CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize, miscDetails, steps);

    //check that the object variables matches the passed variables
    expect(coffeeRecipe.name, name);
    expect(coffeeRecipe.coffeeVolumeGrams, coffeeVolumeGrams);
    expect(coffeeRecipe.grindSize, grindSize);
    expect(coffeeRecipe.waterVolumeGrams, waterVolumeGrams);
    expect(coffeeRecipe.miscDetails, miscDetails);
    expect(coffeeRecipe.steps, steps);
  });

  //tests for waterVolumeGrams

  test('checks correct input for waterVolumeGrams should output 45', () {
    //check that it has the right data
    
    int waterVolumeGrams = CoffeeRecipe.waterGrams(45);
    expect(waterVolumeGrams, 45);
  });

  test('throws argument error on negative number (-17) for waterVolumeGrams', () {
    
    //should throw argument error when neg value inputted
    expect(() => CoffeeRecipe.waterGrams(-17), throwsArgumentError);
    
  });

  test('throws argument error on input zero (0) for waterVolumeGrams', () {
    
    //should throw argument error when zero value inputted
    expect(() => CoffeeRecipe.waterGrams(0), throwsArgumentError);
    
  });

  //Tests for CoffeeVolumeGrams
  
  test('checks correct input for coffeeVolumeGrams should output 300', () {
    
    //check data is correcet
    int coffeeVolumeGrams = CoffeeRecipe.coffeeGrams(300);
    expect(coffeeVolumeGrams, 300);
  });

  test('throws argument error on negative number (-25) for coffeeVolumeGrams', () {
    
    //should throw argument error with neg value 
   expect(() => CoffeeRecipe.coffeeGrams(-25), throwsArgumentError);

  });

  test('throws argument error on input zero (0) for coffeeVolumeGrams', () {
    
    //should throw argument error with zero value
    expect(() => CoffeeRecipe.coffeeGrams(0), throwsArgumentError);
    
  });

}
