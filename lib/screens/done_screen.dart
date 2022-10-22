import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 250),
                child: Column(
                  children: [
                    Text(
                      "enjoy your amazing \n handmade coffee",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C748B),
                        letterSpacing: 1.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 300),
                      child: ButtonTheme(
                        minWidth: 280.0,
                        height: 46.0,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color(0xFFFFFFFF),
                          child: Text(
                            "done",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF4C748B),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                            key: Key('done-text'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeSelectionScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
