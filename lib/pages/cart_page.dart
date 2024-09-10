import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_buttons.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Payment Successful'),
              content: const Text('Thank you for shopping with us!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().clearCart();
                    Navigator.pop(context);
                  },
                  child:
                      const Text('OK', style: TextStyle(color: Colors.black)),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text("My Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text("No items in you cart"),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final product = cart[index];
                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text(product.price.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            context.read<Shop>().removeFromCart(product);
                          },
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text("PAY NOW")),
          ),
        ],
      ),
    );
  }
}
