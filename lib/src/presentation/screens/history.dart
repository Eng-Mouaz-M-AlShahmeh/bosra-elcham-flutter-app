// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:bosra_elcham/src/presentation/widgets/app_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/bottom_nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    final articles = ref.watch(articlesDataProvider);

    return PopScope(
      canPop: false,
      onPopInvoked: (val) => context.goNamed('/home'),
      child: Scaffold(
        appBar: iAppBar(
            context, ref, AppLocalizations.of(context).translate('history')!),
        bottomNavigationBar: iBottomNav(context, 1),
        body: articles.when(
          data: (article) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: ListView.builder(
                  itemCount: article.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          context.goNamed('/article-details',
                              extra: article[index]);
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).primaryColor.withAlpha(250),
                                BlendMode.multiply,
                              ),
                              image: const CachedNetworkImageProvider(
                                  'https://whc.unesco.org/uploads/thumbs/site_0022_0001-1000-1008-20151104162109.jpg'),
                              fit:
                                  BoxFit.cover, // Choose the appropriate BoxFit
                            ),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    isEnglish
                                        ? '${article[index].titleEn}'
                                        : '${article[index].titleAr}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          },
          error: (e, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(e.toString()),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
