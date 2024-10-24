import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/ingredient_model.dart';
import '../../../../data/service/network_service.dart';
import '../../drawers/utils/app_setting.dart';
import 'ingredient_item.dart';

class IngredientTab extends StatefulWidget {
  const IngredientTab({super.key});

  @override
  _IngredientTabState createState() => _IngredientTabState();
}

class _IngredientTabState extends State<IngredientTab> {
  List<Ingredient> ingredients = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchDefaultIngredients();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void fetchDefaultIngredients() async {
    setState(() {
      isLoading = true;
    });
    try {
      final defaultIngredients = await MealService.fetchDefaultIngredients();
      setState(() {
        ingredients = defaultIngredients;
      });
    } catch (error) {
      print('Error fetching default ingredients: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void searchIngredients() async {
    setState(() {
      isLoading = true;
    });
    try {
      final searchResults = await MealService.searchIngredients(searchController.text);
      setState(() {
        ingredients = searchResults;
      });
    } catch (error) {
      print('Error searching ingredients: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, appSettings, child) {
        final appSettings = Provider.of<AppSettings>(context);
        bool isListView = appSettings.isListView;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search for an ingredient',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: searchIngredients,
                  ),
                ),
              ),
            ),

            isLoading
              ?const Center(child: CircularProgressIndicator())
              :Expanded(
                child: isListView
                    ? ListView.builder(
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = ingredients[index];
                    return IngredientItem(ingredient: ingredient,isGrid: false,); // Unique Key
                  },
                )
                    : _buildGrid(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        itemCount: ingredients.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          childAspectRatio: 0.75, // Adjust for width
        ),
        itemBuilder: (context, index) {
          return IngredientItem(ingredient: ingredients[index], isGrid: true);
        },
      ),
    );
  }
}
