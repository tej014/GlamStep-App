import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details_page.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});
  

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Bata',
    'Paragon'
  ];
  late String selectedFilter;
   @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
     const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return SafeArea(
        child: Column(
          children: [
             Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
               const  Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromRGBO(245, 247, 249, 1),
                        side:
                          const  BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                        label: Text(
                          filter,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder
              (
                itemCount: products.length,
                itemBuilder: (context,index)
                {
                  final product = products[index];
                  return GestureDetector
                  (
                    onTap: ()
                    {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context){return Productdetailpage(product: product);})); 
                    },
                    child: ProductCard(title: product['title']as String,
                    price: product['Price']as double,
                    image: product['imageURL']as String,
                    backGroundcolor: index.isEven ? const Color.fromARGB(85, 63, 156, 68) : const Color.fromARGB(86, 191, 128, 128),
                    ),
                  );
                  
                },
              ),
            )
          ],
        ),
      );
  }
}