import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;

  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    this.name = name;
    this.coffeeVolumeGrams = coffeeVolumeGrams;
    this.waterVolumeGrams = waterVolumeGrams;
    this.grindSize = grindSize;
    this.miscDetails = miscDetails;
    this.steps = steps;
  }

  static int waterGrams(int waterVolumeGrams){
    if (waterVolumeGrams <= 0){
      throw ArgumentError();
    }
    else{
      return waterVolumeGrams;
    }
  }

  static int coffeeGrams(int coffeeVolumeGrams){
    if (coffeeVolumeGrams <= 0){
      throw ArgumentError();
    }
    else{
      return coffeeVolumeGrams;
    }
  }


}
