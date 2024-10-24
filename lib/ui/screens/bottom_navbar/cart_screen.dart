import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/ingredient_model.dart';
import '../../../data/models/meal_model.dart';
import '../../widget/meal_provider.dart';
import '../../widget/ingredient_provider.dart';
import '../drawers/drawer.dart';
import '../meal_serve_screens/before_buy_user_details.dart';
import '../drawers/utils/app_setting.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mealCartItems = Provider.of<MealProvider>(context).cart.entries.toList();
    final ingredientCartItems = Provider.of<IngredientProvider>(context).cart;
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0 ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                    child: Text(
                      'Meals',
                      style: TextStyle(
                        color: _selectedIndex == 0 ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                        color: _selectedIndex == 1 ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: const DrawerScreen(),
      body: _selectedIndex == 0
          ? appSettings.isListView
          ? _buildMealList(mealCartItems)
          : _buildMealGrid(mealCartItems)
          : appSettings.isListView
          ? _buildIngredientList(ingredientCartItems)
          : _buildIngredientGrid(ingredientCartItems),
    );
  }

  Widget _buildMealList(List<MapEntry<Meal, int>> mealCartItems) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: mealCartItems.length,
      itemBuilder: (context, index) {
        final meal = mealCartItems[index].key;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Card(
            child: ListTile(
              leading: Image.network(meal.imageUrl, fit: BoxFit.cover, width: 80),
              title: Text(meal.name, style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Remove the meal from the cart
                      Provider.of<MealProvider>(context, listen: false).removeFromCart(meal);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<MealProvider>(context, listen: false).purchaseMeal(meal);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BeforeBuyUserDetails()));
                    },
                    child: const Text('Buy'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMealGrid(List<MapEntry<Meal, int>> mealCartItems) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        childAspectRatio: 0.75, // Adjust for width
      ),
      itemCount: mealCartItems.length,
      itemBuilder: (context, index) {
        final meal = mealCartItems[index].key;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Card(
            child: Column(
              children: [
                Image.network(meal.imageUrl, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(meal.name, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Remove the meal from the cart
                        Provider.of<MealProvider>(context, listen: false).removeFromCart(meal);
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<MealProvider>(context, listen: false).purchaseMeal(meal);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BeforeBuyUserDetails()));
                      },
                      child: const Text('Buy'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildIngredientList(Map<Ingredient, int> ingredientCartItems) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: ingredientCartItems.keys.length,
      itemBuilder: (context, index) {
        final ingredient = ingredientCartItems.keys.elementAt(index);
        final quantity = ingredientCartItems[ingredient];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Card(
            child: ListTile(
              leading: Image.network(
                'https://www.themealdb.com/images/ingredients/${ingredient.name}.png',
                fit: BoxFit.cover,
                width: 80,
              ),
              title: Text('${ingredient.name} (x$quantity)', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<IngredientProvider>(context, listen: false).removeFromCart(ingredient);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<IngredientProvider>(context, listen: false).purchaseIngredient(ingredient);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BeforeBuyUserDetails()));
                    },
                    child: const Text('Buy'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIngredientGrid(Map<Ingredient, int> ingredientCartItems) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: ingredientCartItems.keys.length,
      itemBuilder: (context, index) {
        final ingredient = ingredientCartItems.keys.elementAt(index);
        final quantity = ingredientCartItems[ingredient];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Card(
            child: Column(
              children: [
                Image.network(
                  'https://www.themealdb.com/images/ingredients/${ingredient.name}.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${ingredient.name} (x$quantity)', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<IngredientProvider>(context, listen: false).removeFromCart(ingredient);
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<IngredientProvider>(context, listen: false).purchaseIngredient(ingredient);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BeforeBuyUserDetails()));
                      },
                      child: const Text('Buy'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
