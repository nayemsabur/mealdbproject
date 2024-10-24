import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widget/meal_provider.dart';
import '../../widget/ingredient_provider.dart';
import '../drawers/drawer.dart';
import '../drawers/utils/app_setting.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    _FavoriteMealsTab(),
    _FavoriteIngredientsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
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
                      color: _selectedIndex == 0 ? Colors.blue : Colors.grey[300], // Color when selected/unselected
                      borderRadius: BorderRadius.circular(20), // Rounded corners
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
      body: _pages[_selectedIndex],
    );
  }
}

class _FavoriteMealsTab extends StatelessWidget {
  const _FavoriteMealsTab();

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = Provider.of<MealProvider>(context).favorites;
    final appSettings = Provider.of<AppSettings>(context);

    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('No favorite meals yet!'),
      );
    }

    return appSettings.isListView // Check view mode
        ? ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoriteMeals.length,
      itemBuilder: (context, index) {
        final meal = favoriteMeals[index];
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
              ],
            ),
          ),
        );
      },
    )
        : GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        childAspectRatio: 0.75, // Adjust for width
      ),
      itemCount: favoriteMeals.length,
      itemBuilder: (context, index) {
        final meal = favoriteMeals[index];
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
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FavoriteIngredientsTab extends StatelessWidget {
  const _FavoriteIngredientsTab();

  @override
  Widget build(BuildContext context) {
    final favoriteIngredients = Provider.of<IngredientProvider>(context).favorites;
    final appSettings = Provider.of<AppSettings>(context);

    if (favoriteIngredients.isEmpty) {
      return const Center(
        child: Text('No favorite ingredients yet!'),
      );
    }

    return appSettings.isListView
        ? ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoriteIngredients.length,
      itemBuilder: (context, index) {
        final ingredient = favoriteIngredients[index];
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
                  child: Text(ingredient.name, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        );
      },
    )
        : GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        childAspectRatio: 0.75, // Adjust for width
      ),
      itemCount: favoriteIngredients.length,
      itemBuilder: (context, index) {
        final ingredient = favoriteIngredients[index];
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
                  child: Text(ingredient.name, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
