// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:bosra_elcham/src/domain/gallery_image.dart';
import 'package:bosra_elcham/src/presentation/widgets/app_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/bottom_nav_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/photo_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GalleryScreen extends ConsumerWidget {
  const GalleryScreen({
    super.key,
    required this.categoryTitle,
  });

  final String? categoryTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    final galleries = ref.watch(galleriesDataProvider);
    Orientation orientation = MediaQuery.of(context).orientation;

    return PopScope(
      canPop: false,
      onPopInvoked: (val) => context.goNamed('/gallery-category'),
      child: Scaffold(
        appBar: iAppBar(context, ref, categoryTitle!),
        bottomNavigationBar: iBottomNav(context, 2),
        body: galleries.when(
          data: (gallery) {
            List<GalleryImage> galleryGrouped = <GalleryImage>[];
            for (GalleryImage galleryImage in gallery) {
              if (isEnglish) {
                if (galleryImage.categoryEn != null &&
                    galleryImage.categoryEn == categoryTitle) {
                  galleryGrouped.add(galleryImage);
                }
              } else {
                if (galleryImage.categoryAr != null &&
                    galleryImage.categoryAr == categoryTitle) {
                  galleryGrouped.add(galleryImage);
                }
              }
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 4),
                  itemCount: galleryGrouped.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PhotoGallery(
                              imageUrls: [galleryGrouped[index].imageUrl],
                            ),
                          ));
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withAlpha(150),
                                BlendMode.multiply,
                              ),
                              image: CachedNetworkImageProvider(
                                  galleryGrouped[index].imageUrl!),
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
                                        ? '${galleryGrouped[index].titleEn}'
                                        : '${galleryGrouped[index].titleAr}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.0,
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
