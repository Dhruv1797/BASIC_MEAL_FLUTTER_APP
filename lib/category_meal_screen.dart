import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  //final String categoryId;
  // final String categorytitle;

  //CategoryMealScreen(this.categoryId, this.categorytitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final CategoryMeals = DUMMY_MEALS.where((Meal) {
      return Meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(CategoryMeals[index].title);
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
