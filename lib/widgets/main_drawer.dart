import 'package:flutter/material.dart';

import '../screen/product_screen.dart';
import '../screen/tab_screens.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  Widget _buildMenuItem(IconData icon, String title, Function() handle) {
    return ListTile(
      leading: Icon(icon),
      onTap: handle,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "Munyu",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          _buildMenuItem(
            Icons.home,
            "Bosh Sahifa",
            () {
              Navigator.of(context).pushReplacementNamed(
                TabScreen.routeName,
              );
            },
          ),
          const Divider(
            height: 0,
          ),
          _buildMenuItem(
            Icons.shopping_cart_sharp,
            "Mahsulotlar",
            () {
              Navigator.of(context).pushReplacementNamed(
                ProductScreen.yolnomi,
              );
            },
          ),
        ],
      ),
    );
  }
}
