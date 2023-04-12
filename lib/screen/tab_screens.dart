import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import './home_screen.dart';
import './favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Category> categories;
  final Meals mealModel;
  final Function isFavorite;
  final Function toogleLike;
  const TabScreen(
      {super.key,
      required this.categories,
      required this.mealModel,
      required this.isFavorite,
      required this.toogleLike});

  static const routeName = '/';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _tabIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  void _changeTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': HomeScreen(
          categories: widget.categories,
          meals: widget.mealModel.list,
        ),
        'title': "Ovqatlar Menyusi",
      },
      {
        'page': FavoriteScreen(
          favorites: widget.mealModel.favorites,
          toogleLike: widget.toogleLike,
          isFavorite: widget.isFavorite,
        ),
        'title': "Sevimli taomlar",
      },
    ];
  }

  // void _selectedNb(int index) {
  //   setState(() {
  //     tabIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.menu,
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          _pages[_tabIndex]['title'],
          // "Ovqatlar Menyusi",
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),

      body: _pages[_tabIndex]['page'],
      // ['page']  bitta 'pages' dan s harfi quwib yozolganiga categoryalar menyusini kursatamdi !! ETIBORLI BULAMIZ
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,
        onTap: _changeTab,
        currentIndex: _tabIndex,
        // type: BottomNavigationBarType.shifting,
        // iconSize: 30,
        // selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Bosh Sahifa",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedNb == tabIndex ? Icons.favorite :
              Icons.favorite_outline,
            ),
            label: "Sevimlilar",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     // _selectedNb == tabIndex ? Icons.person :
          //     Icons.person_outlined,
          //   ),
          //   label: "Profile",
          // ),
        ],
      ),
    );

    // Bu tabbar menyusi ekranni tepasida cqadigan menyu hisoblanadi :
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       leading: IconButton(
    //         onPressed: () {},
    //         icon: const Icon(
    //           Icons.menu,
    //         ),
    //       ),
    //       centerTitle: true,
    //       title: const Text("Ovqatlar menyusi"),
    //       actions: [
    //         IconButton(
    //           padding: const EdgeInsets.only(right: 20),
    //           onPressed: () {},
    //           icon: const Icon(
    //             Icons.search,
    //           ),
    //         ),
    //       ],
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(
    //               Icons.home,
    //             ),
    //             text: "Bosh Sahifa",
    //           ),
    //           Tab(
    //             icon: Icon(
    //               Icons.favorite_outline,
    //             ),
    //             text: "Sevimlilar",
    //           ),
    //           Tab(
    //             icon: Icon(
    //               Icons.person_outlined,
    //             ),
    //             text: "Profil",
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         HomeScreen(
    //           categories: categories,
    //         meals: meals,
    //         ),
    //         const FavoriteScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
