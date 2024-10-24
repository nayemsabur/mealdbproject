import 'package:flutter/material.dart';
import '../../../../data/models/ingredient_model.dart';
import 'ingredient_Manager.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;
  final bool isGrid;

  const IngredientItem({super.key, required this.ingredient, this.isGrid = false});

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
          leading:Image.network(
            'https://www.themealdb.com/images/ingredients/${ingredient.name}.png',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
          title: Text(ingredient.name,),
          trailing: Chip(label: Text('\$${ingredient.price.toStringAsFixed(2)}',),),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IngredientManager(ingredient: ingredient),
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
              builder: (context) => IngredientManager(ingredient: ingredient),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                'https://www.themealdb.com/images/ingredients/${ingredient.name}.png',
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
                ingredient.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Chip(
              label: Text(
                '\$${ingredient.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
