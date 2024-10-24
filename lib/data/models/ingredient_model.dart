class Ingredient {
  final String id;
  final String name;
  final String description;
  final double price;

  Ingredient({
    required this.id,
    required this.name,
    required this.description,
    required this.price, // Added price property
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['idIngredient'],
      name: json['strIngredient'],
      description: json['strDescription'] ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0.0') ?? 0.0, // Adjust parsing logic based on API response
    );
  }
}
