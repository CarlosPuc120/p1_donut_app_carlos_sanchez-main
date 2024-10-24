import  'package:flutter/material.dart';
import 'package:p1_donut_app_carlos_sanchez/Utilis/donut_tile.dart';
import 'package:p1_donut_app_carlos_sanchez/car/car_model.dart';
import 'package:provider/provider.dart';



class DonutTab extends StatelessWidget {
  // list of donuts
  final List donutsOnSale = [ 
  //[ donutFlavor, donutPrice, donutColor, imageName ]
  ["Ice Cream", "7", Colors.blue, "lib/images/icecream_donut.png"],
  ["Strawberry", "8", Colors.red, "lib/images/strawberry_donut.png"],
  ["Grape Ape", "12", Colors.purple, "lib/images/grape_donut.png"],
  ["Choco", "15", Colors.brown, "lib/images/chocolate_donut.png"],
  ["Ice Cream", "17", Colors.blue, "lib/images/icecream_donut.png"],
  ["Strawberry", "19", Colors.red, "lib/images/strawberry_donut.png"],
  ["Grape Ape", "20", Colors.purple, "lib/images/grape_donut.png"],
  ["Choco", "16", Colors.brown, "lib/images/chocolate_donut.png"],
  
  ]; 

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: donutsOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return DonutTile(
                  donutFlavor: donutsOnSale[index][0],
                  donutPrice: donutsOnSale[index][1],
                  donutColor: donutsOnSale[index][2],
                  imageName: donutsOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': donutsOnSale[index][0],
                      'price': donutsOnSale[index][1],
                      'color': donutsOnSale[index][2],
                      'image': donutsOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${donutsOnSale[index][0]} toggled');
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
