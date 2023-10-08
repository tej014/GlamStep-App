import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return  Scaffold
    (
      appBar: AppBar(title: const Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),),
      body: ListView.builder
      (
        itemCount: cart.length,
        itemBuilder: (context, index)
        {
          final cartItem = cart[index];
        return ListTile
        (
          leading: CircleAvatar
          (
            backgroundImage: AssetImage(cartItem['imageURL']as String),
            radius: 30,
          ),
          trailing: IconButton(onPressed: ()
          {
            showAdaptiveDialog(barrierDismissible: true,context: context, builder: (context)
            {
              return AlertDialog(
                title: Text('Delete Product',style: Theme.of(context).textTheme.titleMedium,),
                content:const Text('Are you suer you want to remove the product from your cart ?'),
                actions: 
                [
                  TextButton(onPressed: (){Navigator.of(context).pop();}, child:const Text('No',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                  TextButton(onPressed: (){Navigator.of(context).pop(); Provider.of<CartProvider>(context, listen:false).removeProduct(cartItem);}, child:const Text('Yes',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)))
                ],
              );
            }
            );
          }, 
          icon: const Icon(Icons.delete,color: Colors.red,)),
          title: Text
          (
            cartItem['title'].toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: Text('Size : ${cartItem['Size']}'),
        );
        }
      )
    );
  }
}