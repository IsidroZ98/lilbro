import 'dart:core';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

class RecipeDetailScreen extends StatelessWidget {
  final CoffeeRecipe recipe;
  RecipeDetailScreen(this.recipe);

String TimeChange(Duration duration){
  return '${duration.inMinutes}: ${duration.inSeconds%60}';

}
  @override
  Widget build(BuildContext context) {
    int seconds = 0;

    recipe.steps.forEach((step) {
      seconds += step.time;
    });

    final recipeDuration = Duration(seconds: seconds);
    final recipeCoffeeAndGrindsize =
        '${recipe.coffeeVolumeGrams}g  -  ${recipe.grindSize}';
    final recipeWater = '${recipe.waterVolumeGrams}g - water';

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4C748B)),
          key: Key('back-btn'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.0),
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF4C748B),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          recipe.name,
                          style: TextStyle(
                            color: Color(0xFF4C748B),
                            fontSize: 18,
                            fontFamily: "Kollektif",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF4C748B),
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          recipeCoffeeAndGrindsize,
                          style: TextStyle(
                            color: Color(0xFF4C748B),
                            fontSize: 14,
                            fontFamily: "Kollektif",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          recipeWater,
                          style: TextStyle(
                            color: Color(0xFF4C748B),
                            fontSize: 14,
                            fontFamily: "Kollektif",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          recipe.miscDetails,
                          style: TextStyle(
                            color: Color(0xFF4C748B),
                            fontSize: 10,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Steps',
                        style: TextStyle(
                          color: Color(0xFF4C748B),
                          fontSize: 14,
                          fontFamily: "Kollektif",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Total: ${recipeDuration.inMinutes}: ${recipeDuration.inSeconds % 60}',
                        style: TextStyle(
                          color: Color(0xFF4C748B),
                          fontSize: 12,
                          fontFamily: "Kollektif",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      ...recipe.steps.map((step) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF4C748B),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                step.text,
                                style: TextStyle(
                                  color: Color(0xFF4C748B),
                                  fontSize: 12,
                                  fontFamily: "Kollektif",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${TimeChange(Duration(seconds:step.time))}',
                                style: TextStyle(
                                  color: Color(0xFF4C748B),
                                  fontSize: 12,
                                  fontFamily: "Kollektif",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ],
              ),
            ),
            ButtonTheme(
              minWidth: 280.0,
              height: 46.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color(0xFF4C748B),
                child: Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeStepsScreen(recipe)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
