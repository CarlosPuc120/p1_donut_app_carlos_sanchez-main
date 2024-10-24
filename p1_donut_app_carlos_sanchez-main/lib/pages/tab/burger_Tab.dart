import 'package:flutter/material.dart';
import 'package:p1_donut_app_carlos_sanchez/Utilis/burguer_tile.dart';
import 'package:p1_donut_app_carlos_sanchez/car/car_model.dart';
import 'package:provider/provider.dart';

class BurgerTab extends StatelessWidget {
    final List burgerOnSale =[ 
  //[ burgerFlavor, burgerPrice, burgerColor, imageName ]
  ["burger 1", "36", Colors.blue, "lib/images/Burger/Chken_Crunch.png"],
  ["burger 2", "45", Colors.red, "lib/images/Burger/Chiken.png"],
  ["burger 3", "36", Colors.blue, "lib/images/Burger/Chken_Crunch.png"],
  ["burger 4", "45", Colors.red, "lib/images/Burger/Doble_Chiken.png"],
  ["burger 5", "36", Colors.blue, "lib/images/Burger/hamburger-snack.png"],
  ["burger 6", "45", Colors.red, "lib/images/Burger/Kangre_burger.png"],
  ["burger 7", "36", Colors.blue, "lib/images/Burger/Monster.png"],
  ["burger 8", "45", Colors.red, "lib/images/Burger/Monster.png"],
  
 
  
  ]; 
   BurgerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: burgerOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return BurgerTile(
                  burgerFlavor: burgerOnSale[index][0],
                  burgerPrice: burgerOnSale[index][1],
                  burgerColor: burgerOnSale[index][2],
                  imageName:burgerOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': burgerOnSale[index][0],
                      'price': burgerOnSale[index][1],
                      'color': burgerOnSale[index][2],
                      'image': burgerOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${burgerOnSale[index][0]} toggled');
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
