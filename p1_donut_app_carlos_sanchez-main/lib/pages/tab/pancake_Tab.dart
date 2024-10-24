import 'package:flutter/material.dart';
import 'package:p1_donut_app_carlos_sanchez/Utilis/pancake_tile.dart';
import 'package:p1_donut_app_carlos_sanchez/car/car_model.dart';
import 'package:provider/provider.dart';

class PancakeTab extends StatelessWidget {
  //list of pancake
  final List pancakeOnsale = 
  [
  //[ pancakeFlavor, pancakePrice, pancakeColor, imageName ]
  ["Pancake 1", "25", Colors.blue, "lib/images/Pancakes/ballas_PanCakes.png"],
  ["Pancake 2", "29", Colors.red, "lib/images/Pancakes/Cat_PanCakes.png"],
  ["Pancake 3", "27", Colors.green, "lib/images/Pancakes/Chocle_PanCakes.png"],
  ["Pancake 4", "19", Colors.yellow, "lib/images/Pancakes/comb_coffe_PanCakes.png"],
  ["Pancake 5", "20", Colors.blueGrey, "lib/images/Pancakes/fresa_PanCakes.png"],
  ["Pancake 6", "17", Colors.amber, "lib/images/Pancakes/gordis_PanCakes.png"],
  ["Pancake 7", "30", Colors.red, "lib/images/Pancakes/Ice_PanCakes.png"],
  ["Pancake 8", "39", Colors.orange, "lib/images/Pancakes/Mora_azul_PanCakes.png"],

 
 
  ];
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pancakeOnsale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return PancakeTile(
                  pancakeFlavor: pancakeOnsale[index][0],
                  pancakePrice: pancakeOnsale[index][1],
                  pancakeColor: pancakeOnsale[index][2],
                  imageName: pancakeOnsale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pancakeOnsale[index][0],
                      'price': pancakeOnsale[index][1],
                      'color': pancakeOnsale[index][2],
                      'image': pancakeOnsale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${pancakeOnsale[index][0]} toggled');
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
