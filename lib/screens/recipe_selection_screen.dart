import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/coffee_recipe.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 60, 2, 3),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Coffee Recipes",
                key: Key("coffee-recipes"),
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 24,
                    fontFamily: "Kollektif",
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4C748B)),
              ),
            ),
            RecipeList(),
            Center(
              child: Text(
                "Resources",
                key: Key("resources"),
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 24,
                    fontFamily: "Kollektif",
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4C748B)),
              ),
            ),
            ResourceList()
          ],
        ),
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF4C748B), width: 2),
        borderRadius: BorderRadius.circular(11),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: recipes.length,
        separatorBuilder: (context, index) => Divider(
          color: Color(0xff4C748B),
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          CoffeeRecipe recipe = recipes[index];
          return ListTile(
            title: Text(
              recipe.name,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4C748B)),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(
                    recipe,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class ListHelper{
 final String name;
 final String url;

 ListHelper(this.name,this.url);
 
}
class ResourceList extends StatelessWidget {
  final List<ListHelper> resources = [
    ListHelper('Coffee','https://www.amazon.com/Happy-Belly-French-Ground-Coffee/dp/B087GDYLS2/ref=sr_1_1_sspa?dchild=1&keywords=coffee&qid=1619476922&rdc=1&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyWlRNVDc5OTlPUUVZJmVuY3J5cHRlZElkPUEwMzUyNjg4MjIxUEdGTzhZWUsyWiZlbmNyeXB0ZWRBZElkPUEwMjc5NDE5MTFFVDdRWExMT0xGSSZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU='),
    ListHelper('Grinder','https://www.amazon.com/JavaPresse-Grinder-Conical-Brushed-Stainless/dp/B013R3Q7B2/ref=sr_1_1_sspa?dchild=1&keywords=grinder+for+coffee&qid=1619477914&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyQTdUSkozNTNQT0hVJmVuY3J5cHRlZElkPUEwMjA5NjI0MlZIWVpMOENEVjc2MCZlbmNyeXB0ZWRBZElkPUEwNjEyOTYwMlA1NkUxOTZGVFkxMCZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU='),
    ListHelper('Kettle','https://www.amazon.com/Ulalov-Gooseneck-Stainless-Spill-Proof-Protection/dp/B08KG1NPXL/ref=sr_1_2_sspa?dchild=1&keywords=kettle&qid=1619477942&sr=8-2-spons&psc=1&smid=AAQG2FKSJ9ERO&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExMFA4RDNNSE1VTTQzJmVuY3J5cHRlZElkPUEwMzA4OTc3T0E5VDdOQkZLTEwzJmVuY3J5cHRlZEFkSWQ9QTA3MzA1NjcxSzBBRzRZQVFQTjg0JndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ='),
    ListHelper('HomeBrew Dripper','https://www.amazon.com/Bodum-Coffee-Maker-Permanent-Filter/dp/B01JLY1HSE/ref=sr_1_3?dchild=1&keywords=coffee+dripper&qid=1619477984&sr=8-3'),
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
    border: Border.all(color: Color(0xFF4C748B), width: 2),
    borderRadius: BorderRadius.circular(11),
        ),
        child: ListView.separated(
    shrinkWrap: true,
    itemCount: resources.length,
    separatorBuilder: (context, index) => Divider(
      color: Color(0xff4C748B),
      thickness: 1,
    ),
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: (){
          launch(resources[index].url);
        },
              child: ListTile(
          title: Text(
            resources[index].name,
            style: TextStyle(
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: Color(0xFF4C748B)),
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      );
    },
        ),
      );
  }
}
