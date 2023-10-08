import 'package:flutter/material.dart';
import 'package:shop_app_flutter/cartpage.dart';

import 'package:shop_app_flutter/product_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  
  int currentPage = 0;
 
 List<Widget> pages = 
 [
 const Productlist(),
 const Cartpage()
 ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: IndexedStack
      (
        index: currentPage,
        children: pages,
      ),
    bottomNavigationBar: BottomNavigationBar(
      iconSize: 35,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      onTap: (value) 
      {
      setState(() 
      {
       currentPage = value; 
      });  
      },
      currentIndex: currentPage,
      items: const
    [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: '',)
      
    ]),
    );
  }
}
