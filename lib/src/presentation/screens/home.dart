// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:bosra_elcham/src/presentation/widgets/app_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/bottom_nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: iAppBar(
        context,
        ref,
        AppLocalizations.of(context).translate('app_title')!,
      ),
      bottomNavigationBar: iBottomNav(context, 0),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor.withAlpha(150),
              BlendMode.multiply,
            ),
            image: const CachedNetworkImageProvider(
                'https://whc.unesco.org/uploads/thumbs/site_0022_0001-1000-1008-20151104162109.jpg'),
            fit: BoxFit.cover, // Choose the appropriate BoxFit
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 20),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 1 : 1),
              itemCount: 1,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: InkWell(
                          onTap: () {
                            context.goNamed('/article');
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black87.withAlpha(200),
                            ),
                            child: Center(
                              child: ListTile(
                                title: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 2,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.article,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('history')!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: InkWell(
                          onTap: () {
                            context.goNamed('/gallery-category');
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black87.withAlpha(200),
                            ),
                            child: Center(
                              child: ListTile(
                                title: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 2,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.image,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('gallery')!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: InkWell(
                          onTap: () {
                            context.goNamed('/map');
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black87.withAlpha(200),
                            ),
                            child: Center(
                              child: ListTile(
                                title: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 2,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('location')!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: InkWell(
                          onTap: () {
                            context.goNamed('/about');
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black87.withAlpha(200),
                            ),
                            child: Center(
                              child: ListTile(
                                title: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 2,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.info,
                                      color: Colors.white,
                                      size: isEnglish ? 25 : 20,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('about')!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: isEnglish ? 20.0 : 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
