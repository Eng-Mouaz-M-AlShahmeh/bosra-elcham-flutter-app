// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:bosra_elcham/src/domain/article.dart';
import 'package:bosra_elcham/src/presentation/widgets/app_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/bottom_nav_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/photo_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArticleDetailsScreen extends ConsumerWidget {
  const ArticleDetailsScreen({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    return PopScope(
      canPop: false,
      onPopInvoked: (val) => context.goNamed('/article'),
      child: Scaffold(
        appBar: iAppBar(
            context, ref, isEnglish ? article.titleEn! : article.titleAr!),
        bottomNavigationBar: iBottomNav(context, 1),
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      children: [
                        article.imageUrls!.isEmpty
                            ? const SizedBox()
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: article.imageUrls!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5.0, 0, 5.0, 0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => PhotoGallery(
                                              imageUrls: article.imageUrls!,
                                            ),
                                          ));
                                        },
                                        child: Hero(
                                          tag: article.imageUrls![index]!,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                article.imageUrls![index]!,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                        Text(
                          isEnglish ? article.dscEn! : article.dscAr!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
