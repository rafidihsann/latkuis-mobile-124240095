import 'package:flutter/material.dart';

import '../models/data.dart';
import 'detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(product: menus[index]),
              ),
            );
          },
          title: Text(menus[index].name),
          subtitle: Text("Rp ${menus[index].price}"),
          leading: Image.network(menus[index].image),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
