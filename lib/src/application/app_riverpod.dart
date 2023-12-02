// Developed by Eng Mouaz M AlShahmeh
import 'package:audioplayers/audioplayers.dart';
import 'package:bosra_elcham/src/domain/article.dart';
import 'package:bosra_elcham/src/domain/gallery_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Articles
final articlesFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final articlesDataProvider =
    FutureProvider.autoDispose<List<Article>>((ref) async {
  final firestore = ref.read(articlesFirestoreProvider);

  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firestore.collection('articles').get();

  return querySnapshot.docs.map((doc) => Article.fromJson(doc.data())).toList();
});
// End Articles

// Galleries
final galleriesFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final galleriesDataProvider =
    FutureProvider.autoDispose<List<GalleryImage>>((ref) async {
  final firestore = ref.read(galleriesFirestoreProvider);

  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firestore.collection('galleryImages').get();

  return querySnapshot.docs
      .map((doc) => GalleryImage.fromJson(doc.data()))
      .toList();
});
// End Galleries

// Music Audio
final audioPlayerProvider = Provider<AudioPlayer>((ref) => AudioPlayer());
final isPlayingProvider = StateProvider<bool>((ref) => false);
// End Music Audio

// Language
final isEnglishProvider = StateProvider<bool>((ref) => false);
// End Language

// START CONNECTIVITY
enum NetworkStatus { notDetermined, on, off }

class NetworkDetectorNotifier extends StateNotifier<NetworkStatus> {
  NetworkDetectorNotifier() : super(NetworkStatus.notDetermined) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      NetworkStatus newState;
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = NetworkStatus.on;
          break;
        case ConnectivityResult.none:
          newState = NetworkStatus.off;
          break;
        default:
          newState = NetworkStatus.off;
          break;
      }

      if (newState != state) {
        state = newState;
      }
    });
  }
}

final networkAwareProvider = StateNotifierProvider((ref) {
  return NetworkDetectorNotifier();
});
// END CONNECTIVITY
