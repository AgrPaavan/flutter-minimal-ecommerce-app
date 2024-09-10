import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 72,
                ),
              ),

              const SizedBox(height: 25),

              // Shop
              ListTile(
                contentPadding: const EdgeInsets.only(left: 40.0),
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text("Shop"),
                onTap: () {
                  Navigator.pushNamed(context, '/shop_page');
                },
              ),

              // Cart
              ListTile(
                contentPadding: const EdgeInsets.only(left: 40.0),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text("Cart"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // Exit
          ListTile(
            contentPadding: const EdgeInsets.only(left: 40.0, bottom: 25.0),
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: const Text("Exit"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
