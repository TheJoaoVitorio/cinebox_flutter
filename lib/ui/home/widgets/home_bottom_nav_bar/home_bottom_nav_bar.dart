import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_app_flutter/ui/home/widgets/home_bottom_nav_bar_item/home_bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 64, 64, 64),
          width: 1,
        ),
        color: AppcColors.bgColorSecondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipOval(
        child: BottomNavigationBar(
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppcColors.bgColorSecondary,
          selectedItemColor: AppcColors.colorPrimary,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          currentIndex: 0,
          items: [
            HomeBottomNavBarItem(
              activeAsset: Icon(Icons.movie_sharp),
              inativeAsset: Icon(Icons.home),
              label: 'Filmes',
            ),
            HomeBottomNavBarItem(
              activeAsset: Icon(Icons.favorite),
              inativeAsset: Icon(Icons.favorite_border),
              label: 'Favoritos',
            ),
            HomeBottomNavBarItem(
              activeAsset: Icon(Icons.person),
              inativeAsset: Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
