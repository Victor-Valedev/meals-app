import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/models/settings.dart';
import 'package:mealsapp/screens/categories_meals_screen.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';
import 'package:mealsapp/screens/settings_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';
import 'package:mealsapp/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals =
          dummyMeals.where((meal) {
            final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
            final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
            final filterVegan = settings.isVegan && !meal.isVegan;
            final filterVegetarian =
                settings.isVegetarian && !meal.isVegetarian;
            return !filterGluten &&
                !filterLactose &&
                !filterVegetarian &&
                !filterVegan;
          }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS:
            (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
