import 'package:flutter/material.dart';
import 'package:mealdbproject/ui/screens/bottom_navbar/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../widget/history_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<HistoryProvider>(context).history;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase History'),
        actions: [
          TextButton(onPressed:() {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          MainNavBar()
          ),);}, child: Text("Home"))
        ],
      ),
      body: history.isEmpty
          ? const Center(child: Text('No purchase history yet!'))
          : ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          return ListTile(
            leading: Image.network(item.imageUrl),
            title: Text(item.itemName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: \$${item.price.toStringAsFixed(2)}'),
                Text('Unit: ${item.unit}'),
                Text('Date: ${item.purchaseDate.toLocal()}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
