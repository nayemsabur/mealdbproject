class Meal {
  final String id;
  final String name;
  final String imageUrl;
  final double price; // Add a price field

  Meal({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  // Factory constructor to parse JSON from the API
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      price: (json['idMeal'].hashCode % 20) + 5.0, // Assign random price between 5.0 and 24.99
    );
  }
}
