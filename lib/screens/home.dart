import 'package:flutter/material.dart';

import '../models/data.dart';
import 'detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    final categories = ['Semua', ...menus.map((menu) => menu.category).toSet()];
    final filteredMenus = _selectedCategory == 'Semua'
        ? menus
        : menus.where((menu) => menu.category == _selectedCategory).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: DropdownButtonFormField<String>(
            initialValue: _selectedCategory,
            decoration: const InputDecoration(
              labelText: 'Kategori',
              prefixIcon: Icon(Icons.filter_list),
              border: OutlineInputBorder(),
              isDense: true,
            ),
            items: categories
                .map(
                  (category) =>
                      DropdownMenuItem(value: category, child: Text(category)),
                )
                .toList(),
            onChanged: (category) {
              if (category != null) {
                setState(() => _selectedCategory = category);
              }
            },
          ),
        ),
        Expanded(
          child: filteredMenus.isEmpty
              ? const Center(child: Text('Menu tidak ditemukan'))
              : ListView.builder(
                  itemCount: filteredMenus.length,
                  itemBuilder: (context, index) {
                    final menu = filteredMenus[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(product: menu),
                          ),
                        );
                      },
                      title: Text(menu.name),
                      subtitle: Text('Rp ${menu.price}'),
                      leading: Image.network(menu.image),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
