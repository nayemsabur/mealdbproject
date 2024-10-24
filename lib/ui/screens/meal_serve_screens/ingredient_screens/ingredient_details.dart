import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/ingredient_model.dart';
import '../../../widget/ingredient_provider.dart';
import '../../drawers/drawer.dart';
import '../before_buy_user_details.dart';

class IngredientDetailsScreen extends StatefulWidget {
  final Ingredient ingredient;

  const IngredientDetailsScreen({super.key, required this.ingredient});

  @override
  _IngredientDetailsScreenState createState() => _IngredientDetailsScreenState();
}

class _IngredientDetailsScreenState extends State<IngredientDetailsScreen> {
  int _quantity = 1;

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IngredientProvider>(context);
    bool isFavorite = provider.isFavorite(widget.ingredient);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ingredient.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              if (isFavorite) {
                provider.removeFavorite(widget.ingredient);
                _showSnackBar(context, 'Removed from favorites');
              } else {
                provider.addFavorite(widget.ingredient);
                _showSnackBar(context, 'Added to favorites');
              }
              setState(() {}); // Refresh UI
            },
          ),
        ],
      ),
      endDrawer: const DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://www.themealdb.com/images/ingredients/${widget.ingredient.name}.png',
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(height: 16),
            Text(
              widget.ingredient.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: \$${widget.ingredient.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 1) _quantity--;
                    });
                  },
                ),
                Text(
                  '$_quantity',
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                provider.addToCart(widget.ingredient, _quantity);
                _showSnackBar(context, 'Added to Cart ($_quantity)');
              },
              child: Text('Add to Cart ($_quantity)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BeforeBuyUserDetails()),
                );
                _showSnackBar(context, 'Purchase successful!');
              },
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
