import 'package:flutter/material.dart';
import 'package:movi_app/core/utils/app/colors/app_colors.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.2),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.topLeft,
              child: Text(
                'Menu',
                style: AppStyles.styleExtraBold24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.search, color: Colors.white),
            title: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text('Search',
                  style: AppStyles.styleMedium16.copyWith(fontSize: 17)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text('Home',
                  style: AppStyles.styleMedium16.copyWith(fontSize: 17)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.movie, color: Colors.white),
            title: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text('Movies',
                  style: AppStyles.styleMedium16.copyWith(fontSize: 17)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.tv, color: Colors.white),
            title: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text('TV Shows',
                  style: AppStyles.styleMedium16.copyWith(fontSize: 17)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.new_releases, color: Colors.white),
            title: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text('New',
                  style: AppStyles.styleMedium16.copyWith(fontSize: 17)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border, color: Colors.white),
            title: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text('Favorites',
                  style: AppStyles.styleMedium16.copyWith(fontSize: 17)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text('Account',
                  style: AppStyles.styleMedium16.copyWith(fontSize: 17)),
            ),
          ),
        ],
      ),
    );
  }
}
