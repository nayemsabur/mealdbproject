import 'package:flutter/material.dart';
import 'package:mealdbproject/ui/utils/colors_data.dart';
import '../../../../data/models/meal_model.dart';
import 'meal_details.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final bool isGrid;
  const MealItem({super.key, required this.meal, this.isGrid = false});
  @override
  Widget build(BuildContext context) {
    return isGrid
        ? _buildGridItem(context)
        : _buildListItem(context);
  }

  Widget _buildListItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: Colors.orangeAccent.shade100,
        elevation: 20,
        child: ListTile(
          leading: Image.network(
            meal.imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          title: Text(meal.name),
          trailing: Chip(label: Text('\$${meal.price.toStringAsFixed(2)}')),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MealDetailsScreen(meal: meal),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context) {
    return Card(
      color: Colors.orangeAccent.shade100,
      elevation: 20,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealDetailsScreen(meal: meal),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                meal.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Chip(
              label: Text(
                '\$${meal.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
