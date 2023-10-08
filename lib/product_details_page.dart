import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class Productdetailpage extends StatefulWidget {
  final Map<String, Object> product;
  const Productdetailpage({super.key, required this.product});

  @override
  State<Productdetailpage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<Productdetailpage> {
  int selectedSize = 0;
  void onTap () 
                {
                      if(selectedSize != 0) 
                      {
                        Provider.of<CartProvider>(context, listen: false).addProduct
                      (
                   {
                      'id': widget.product['id'],
                      'title': widget.product['title'],
                      'Price': widget.product['Price'],
                      'imageURL': widget.product['imageURL'],
                      'Company': widget.product['Company'],
                      'Size': selectedSize,
                   },
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added succesfully')));
                      }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Plese select a size')));
                      }
                      
                    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 255),
      appBar: AppBar(
        title: const Center(child:  Text('Details')),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageURL'] as String),
          ),
          const Spacer(flex: 10),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 219, 239, 245),
                borderRadius: BorderRadius.circular(40)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('₹${widget.product['Price']}',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (widget.product['Size'] as List<int>).length,
                  itemBuilder: (context, index) {
                    final size = (widget.product['Size'] as List<int>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: Chip(
                          label: Text(
                            size.toString(),
                          ),
                          backgroundColor: selectedSize == size
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(
                    onPressed: onTap ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    icon: const Icon(Icons.shopping_cart,color: Colors.black,size: 25,),
                    label: const
                    Text('Add to cart',
                    
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,),
                    ),
                    ),
              )
            ]),
          )
        ],
      ),
    );
  }
}