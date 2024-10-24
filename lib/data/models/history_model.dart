class PurchaseHistory {
  final String itemName;
  final String imageUrl;
  final double price;
  final int unit;
  final DateTime purchaseDate;

  PurchaseHistory({
    required this.itemName,
    required this.imageUrl,
    required this.price,
    required this.unit,
    required this.purchaseDate,
  });
}
