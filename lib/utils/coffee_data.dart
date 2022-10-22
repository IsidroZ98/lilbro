import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Put coffee grounds in a large container", 10),
    RecipeStep("Boil water", 95),
    RecipeStep("Slowly pour water over the grounds", 10),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 10),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Hot-Brewed Coffee",
      38,
      177,
      "coarsly ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeCoffeeAuLait() {
  List<RecipeStep> steps = [
    RecipeStep(
        "Put a generous tablespoon of the coffee-sugar mix into a microwave-safe cup or small bowl",
        10),
    RecipeStep("Pour in about 64 grams of lukewarm milk", 60),
    RecipeStep("Microwave on high", 25),
    RecipeStep("Remove mixture", 20),
    RecipeStep("Stir gently", 30),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Coffee Au Lait",
      13,
      177,
      "coffee sugar mix",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [makeSweetMariasRecipe(), makeTestRecipe(),makeCoffeeAuLait()];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}
