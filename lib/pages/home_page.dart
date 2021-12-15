
import 'package:example_api/pages/categories.dart';
import 'package:example_api/pages/profile.dart';
import 'package:example_api/pages/shop.dart';
import 'package:flutter/material.dart';
import 'package:example_api/pages/sub_home_page.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedPage = 0;
  final pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.green),
        selectedFontSize: 12,
        selectedItemColor: Colors.green,
        currentIndex: selectedPage,
        onTap: (index){
          selectedPage = index;
          pageController.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.easeInOutQuart);
          setState(() {
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.grey,),label: 'Inicio',activeIcon: Icon(Icons.home, color: Colors.green,),),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view, color: Colors.grey,),label: 'Categorias',activeIcon: Icon(Icons.grid_view, color: Colors.green,)),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket, color: Colors.grey,), label: 'Carrito',activeIcon: Icon(Icons.shopping_basket, color: Colors.green,)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.grey,), label: 'Perfil',activeIcon: Icon(Icons.account_circle, color: Colors.green,)),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SubHomePage(),
            CategoriesPage(),
            ShopPage(),
            ProfilePage()
          ],
        )
      ),
    );
  }
}
