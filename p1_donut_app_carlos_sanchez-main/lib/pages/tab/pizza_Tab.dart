import 'package:flutter/material.dart';
import 'package:p1_donut_app_carlos_sanchez/Utilis/tab/pizza_tile.dart';
import 'package:p1_donut_app_carlos_sanchez/car/car_model.dart';
import 'package:provider/provider.dart';

class PizzaTab extends StatelessWidget {
  // list of pizzas
  final List pizzasOnSale = [
    // [ pizzaFlavor, pizzaPrice, pizzaColor, pizzaName ]
    ["Pizza 1", "19", Colors.blue, "lib/images/Pizza/Albondigas_Pizza.png"],
    ["Pizza 2", "18", Colors.yellow, "lib/images/Pizza/Big_Pizza_Pizza.png"],
    ["Pizza 3", "35", Colors.red, "lib/images/Pizza/Camarones_Pizza.png"],
    ["Pizza 4", "20", Colors.orange, "lib/images/Pizza/Chanpiñones_Pizza.png"],
    ["Pizza 5", "40", Colors.purple, "lib/images/Pizza/Emtomatada_Pizza.png"],
    ["Pizza 6", "35", Colors.pink, "lib/images/Pizza/Hawaiana_Pizza.png"],
    ["Pizza 7", "30", Colors.amber, "lib/images/Pizza/Prueva_Pizza.png"],
    ["Pizza 8", "25", Colors.red, "lib/images/Pizza/Albondigas_Pizza.png"],
  
  ];
  PizzaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pizzasOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return PizzaTile(
                  pizzaFlavor: pizzasOnSale[index][0],
                  pizzaPrice: pizzasOnSale[index][1],
                  pizzaColor: pizzasOnSale[index][2],
                  pizzaName: pizzasOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pizzasOnSale[index][0],
                      'price': pizzasOnSale[index][1],
                      'color': pizzasOnSale[index][2],
                      'image': pizzasOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${pizzasOnSale[index][0]} toggled');
                  },
                );
              },
            ),
          ),
          // Barrita inferior para mostrar el total del carrito
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cart.totalItems} Items | \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.pink, // Color del botón "View Cart"
                      ),
                      onPressed: () {
                        // Acción para ver el carrito
                        print('View Cart pressed');
                      },
                      child: const Text('View Cart'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}