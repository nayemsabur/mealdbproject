import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/meal_model.dart';
import '../../../../data/service/network_service.dart';
import '../../drawers/utils/app_setting.dart';
import 'meal_item.dart';

class MealTab extends StatefulWidget {
  const MealTab({super.key});

  @override
  _MealTabState createState() => _MealTabState();
}

class _MealTabState extends State<MealTab> {
  List<Meal> meals = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchDefaultMeals();
  }

  void fetchDefaultMeals() async {
    setState(() {
      isLoading = true;
    });
    try {
      final defaultMeals = await MealService.fetchDefaultMeals();
      setState(() {
        meals = defaultMeals;
      });
    } catch (error) {
      print('Error fetching default meals: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void searchMeals() async {
    setState(() {
      isLoading = true;
    });
    try {
      final searchResults = await MealService.searchMeals(searchController.text);
      setState(() {
        meals = searchResults;
      });
    } catch (error) {
      print('Error searching meals: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context); // Get the view mode from AppSettings
    bool isListView = appSettings.isListView;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search for a meal',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: searchMeals,
              ),
            ),
          ),
        ),

        isLoading
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
          child: isListView
              ? ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return MealItem(meal: meals[index], isGrid: false);
            },
          )
              : _buildGrid(),
        ),
      ],
    );
  }

  Widget _buildGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        itemCount: meals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          childAspectRatio: 0.75, // Adjust for width
        ),
        itemBuilder: (context, index) {
          return MealItem(meal: meals[index], isGrid: true);
        },
      ),
    );
  }
}
