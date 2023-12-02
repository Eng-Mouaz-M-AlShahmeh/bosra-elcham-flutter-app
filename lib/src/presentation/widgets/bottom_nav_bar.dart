// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

BottomNavigationBar iBottomNav(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    backgroundColor: Theme.of(context).primaryColor,
    currentIndex: currentIndex,
    selectedItemColor: Colors.white.withAlpha(200),
    onTap: (int index) {
      if (index == 0) {
        context.goNamed('/home');
      } else if (index == 1) {
        context.goNamed('/article');
      } else if (index == 2) {
        context.goNamed('/gallery-category');
      }
    },
    items: [
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.home,
        ),
        label: AppLocalizations.of(context).translate('home')!,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.article,
        ),
        label: AppLocalizations.of(context).translate('history')!,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.image,
        ),
        label: AppLocalizations.of(context).translate('gallery')!,
      ),
    ],
  );
}
