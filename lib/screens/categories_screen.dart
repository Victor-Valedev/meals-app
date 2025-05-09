import 'package:flutter/material.dart';
import 'package:mealsapp/components/category_item.dart';
import 'package:mealsapp/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children:
          dummyCategories.map((cat) {
            return CategoryItem(cat);
          }).toList(),
    );
  }
}
