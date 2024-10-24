import 'package:flutter/material.dart';
import 'package:p1_donut_app_carlos_sanchez/Utilis/smoothie_tile.dart';
import 'package:p1_donut_app_carlos_sanchez/car/car_model.dart';
import 'package:provider/provider.dart'; 

class SmoothieTab extends StatelessWidget {
  // list of smoothie
   final List SmoothieOnSale = 
[
  ["Smoothie 1", "30", Colors.blue, "lib/images/Smoothie/arcoiris.png"],
  ["Smoothie 2", "40", Colors.red, "lib/images/Smoothie/chocolate-ice-cream-milkshake.png"],
  ["Smoothie 3", "34", Colors.purple, "lib/images/Smoothie/f.png"],
  ["Smoothie 4", "50", Colors.orange, "lib/images/Smoothie/fondo.png"],
  ["Smoothie 5", "32", Colors.green, "lib/images/Smoothie/fresa_t.png"],
  ["Smoothie 6", "41", Colors.yellow, "lib/images/Smoothie/mocha-cappuccino.png"],
  ["Smoothie 7", "31", Colors.pink, "lib/images/Smoothie/OIP.png"],
  ["Smoothie 8", "20", Colors.amber, "lib/images/Smoothie/Verde.png"],


];
  
 SmoothieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: SmoothieOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return smoothieTile(
                  smoothieFlavor: SmoothieOnSale[index][0],
                  smoothiePrice: SmoothieOnSale[index][1],
                  smoothieColor: SmoothieOnSale[index][2],
                  imageName: SmoothieOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': SmoothieOnSale[index][0],
                      'price': SmoothieOnSale[index][1],
                      'color': SmoothieOnSale[index][2],
                      'image': SmoothieOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${SmoothieOnSale[index][0]} toggled');
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
                        backgroundColor: Colors.pink, // Color del botón "View Cart"
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
