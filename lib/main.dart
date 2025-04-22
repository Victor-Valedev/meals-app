import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_meals_screen.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';
import 'package:mealsapp/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealsApp',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.pink,
          secondary: Colors.white,
        ),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
    );
  }
}
