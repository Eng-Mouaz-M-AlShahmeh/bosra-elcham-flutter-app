// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/domain/article.dart';
import 'package:bosra_elcham/src/presentation/screens/about.dart';
import 'package:bosra_elcham/src/presentation/screens/acknowledgement.dart';
import 'package:bosra_elcham/src/presentation/screens/article_details.dart';
import 'package:bosra_elcham/src/presentation/screens/gallery.dart';
import 'package:bosra_elcham/src/presentation/screens/gallery_category.dart';
import 'package:bosra_elcham/src/presentation/screens/history.dart';
import 'package:bosra_elcham/src/presentation/screens/home.dart';
import 'package:bosra_elcham/src/presentation/screens/map.dart';
import 'package:bosra_elcham/src/presentation/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      name: '/',
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      name: '/home',
      path: '/home',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      name: '/about',
      path: '/about',
      builder: (BuildContext context, GoRouterState state) =>
          const AboutScreen(),
    ),
    GoRoute(
      name: '/map',
      path: '/map',
      builder: (BuildContext context, GoRouterState state) => const MapScreen(),
    ),
    GoRoute(
      name: '/acknowledgement',
      path: '/acknowledgement',
      builder: (BuildContext context, GoRouterState state) =>
          const AcknowledgementScreen(),
    ),
    GoRoute(
      name: '/article',
      path: '/article',
      builder: (BuildContext context, GoRouterState state) =>
          const ArticleScreen(),
    ),
    GoRoute(
      name: '/article-details',
      path: '/article-details',
      builder: (BuildContext context, GoRouterState state) {
        return ArticleDetailsScreen(article: state.extra! as Article);
      },
    ),
    GoRoute(
      name: '/gallery-category',
      path: '/gallery-category',
      builder: (BuildContext context, GoRouterState state) =>
          const GalleryCategoryScreen(),
    ),
    GoRoute(
      name: '/gallery',
      path: '/gallery',
      builder: (BuildContext context, GoRouterState state) {
        return GalleryScreen(
          categoryTitle: state.extra! as String,
        );
      },
    ),
  ],
);
