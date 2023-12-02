// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:bosra_elcham/src/domain/gallery_image.dart';
import 'package:bosra_elcham/src/presentation/widgets/app_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/bottom_nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GalleryCategoryScreen extends ConsumerWidget {
  const GalleryCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    final galleries = ref.watch(galleriesDataProvider);
    Orientation orientation = MediaQuery.of(context).orientation;

    return PopScope(
      canPop: false,
      onPopInvoked: (val) => context.goNamed('/home'),
      child: Scaffold(
        appBar: iAppBar(
            context, ref, AppLocalizations.of(context).translate('gallery')!),
        bottomNavigationBar: iBottomNav(context, 2),
        body: galleries.when(
          data: (gallery) {
            List<GalleryImage> galleryGrouped = <GalleryImage>[];
            final categoryEnSet = <String>{};
            for (GalleryImage galleryImage in gallery) {
              if (isEnglish) {
                if (galleryImage.categoryEn != null &&
                    categoryEnSet.add(galleryImage.categoryEn ?? '')) {
                  galleryGrouped.add(galleryImage);
                }
              } else {
                if (galleryImage.categoryAr != null &&
                    categoryEnSet.add(galleryImage.categoryAr ?? '')) {
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
                          context.goNamed('/gallery',
                              extra: isEnglish
                                  ? galleryGrouped[index].categoryEn
                                  : galleryGrouped[index].categoryAr);
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
                                  galleryGrouped[index].categoryImageUrl!),
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
                                        ? '${galleryGrouped[index].categoryEn}'
                                        : '${galleryGrouped[index].categoryAr}',
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
