// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:bosra_elcham/src/presentation/widgets/app_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate())
      ..loadRequest(Uri.parse(isEnglish
          ? 'https://www.google.com/maps/place/Busra,+Syria/@32.5168536,36.4694166,15z/data=!3m1!4b1!4m14!1m7!3m6!1s0x151bced7bd43018b:0x200f84c99106ba29!2sCham+Palace+Hotel+Bosra!8m2!3d32.5176791!4d36.4814026!16s%2Fg%2F1vgn529j!3m5!1s0x151bced71a6b85b1:0xee22b8010b28681d!8m2!3d32.5166892!4d36.4743044!16zL20vMDJzcWd3?authuser=0&hl=en&entry=ttu'
          : 'https://www.google.com/maps/place/بصرى،+سوريا%E2%80%AD/@32.5168536,36.490016,15z/data=!3m1!4b1!4m14!1m7!3m6!1s0x151bced7bd43018b:0x200f84c99106ba29!2z2KjYtdix2Ykg2KfZhNi02KfZhQ!8m2!3d32.5176791!4d36.4814026!16s%2Fg%2F1vgn529j!3m5!1s0x151bced71a6b85b1:0xee22b8010b28681d!8m2!3d32.5166892!4d36.4743044!16zL20vMDJzcWd3?authuser=0&entry=ttu'));
    return PopScope(
      canPop: false,
      onPopInvoked: (val) => context.goNamed('/home'),
      child: Scaffold(
        appBar: iAppBar(
            context, ref, AppLocalizations.of(context).translate('map')!),
        bottomNavigationBar: iBottomNav(context, 0),
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WebViewWidget(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}
