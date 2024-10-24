import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/ingredient_model.dart';
import '../../../widget/ingredient_provider.dart';
import '../before_buy_user_details.dart';
import 'ingredient_details.dart';

class IngredientManager extends StatefulWidget {
  final Ingredient ingredient;

  const IngredientManager({Key? key, required this.ingredient}) : super(key: key);

  @override
  _IngredientManagerState createState() => _IngredientManagerState();
}

class _IngredientManagerState extends State<IngredientManager> {
  int _quantity = 1;

  void _refreshData() {
    setState(() {
      _quantity = 1;
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleFavorite() {
    final ingredientProvider = Provider.of<IngredientProvider>(context, listen: false);

    setState(() {
      if (ingredientProvider.isFavorite(widget.ingredient)) {
        ingredientProvider.removeFavorite(widget.ingredient);
      } else {
        ingredientProvider.addFavorite(widget.ingredient);
      }
    });
  }

  void _addToCart() {
    final ingredientProvider = Provider.of<IngredientProvider>(context, listen: false);
    _refreshData();
    ingredientProvider.clearCart();
    ingredientProvider.addToCart(widget.ingredient, _quantity);

    _showSnackBar(context, 'Added to Cart ($_quantity)');
  }

  void _buyNow() {
    _refreshData();
    _showSnackBar(context, 'Purchase successful!');

    final ingredientProvider = Provider.of<IngredientProvider>(context, listen: false);
    ingredientProvider.clearCart();
  }

  @override
  Widget build(BuildContext context) {
    final ingredientProvider = Provider.of<IngredientProvider>(context);
    bool isFavorite = ingredientProvider.isFavorite(widget.ingredient);
    double totalPrice = widget.ingredient.price * _quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ingredient.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://www.themealdb.com/images/ingredients/${widget.ingredient.name}.png',
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ingredient.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Price: \$${totalPrice.toStringAsFixed(2)}',
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
                    onPressed: _addToCart,
                    child: Text('Add to Cart ($_quantity)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BeforeBuyUserDetails()));
                    },
                    child: const Text('Buy Now'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IngredientDetailsScreen(ingredient: widget.ingredient),
                        ),
                      );
                    },
                    child: const Text('View Details'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
