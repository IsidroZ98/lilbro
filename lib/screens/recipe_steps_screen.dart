import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

class RecipeStepsScreen extends StatefulWidget {
  final CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

String TimeChange(Duration duration){
  return '${duration.inMinutes}: ${duration.inSeconds%60}';

}
  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: Color(0xFF4C748B),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 80),
              child: Column(
                children: [
                  Text(
                    "$stepTimeRemaining",
                    style: TextStyle(
                      fontSize: 96,
                      fontFamily: "Kollektif",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "${currentRecipeStep.text}",
                    style: TextStyle(fontSize: 24,
                      fontFamily: "Kollektif",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),),
                  ),
                ],
              ),
            ),
            Text(
              "Steps",
              style: TextStyle(color: Colors.white),
            ),
            for (RecipeStep step in remainingSteps)
              Container(
                margin: EdgeInsets.all(8),
                decoration: currentRecipeStep == step
                    ? BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      )
                    : null,
                child: ListTile(
                  title: Text(
                    step.text,
                    style: TextStyle(color: Colors.white),
                  ),trailing: Text(TimeChange(Duration(seconds:step.time)),style: TextStyle(color: Colors.white),),
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
