// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:bosra_elcham/src/presentation/widgets/app_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AcknowledgementScreen extends ConsumerWidget {
  const AcknowledgementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (val) => context.goNamed('/home'),
      child: Scaffold(
        appBar: iAppBar(
          context,
          ref,
          AppLocalizations.of(context).translate('acknowledgements')!,
        ),
        bottomNavigationBar: iBottomNav(context, 0),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.justify,
                          AppLocalizations.of(context).translate('thanksDsc')!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://whc.unesco.org/en/list/22/')) {
                              await launchUrlString(
                                  'https://whc.unesco.org/en/list/22/');
                            }
                          },
                          child: Text(
                            '- ${AppLocalizations.of(context).translate('unescoDsc')!}',
                            textAlign: TextAlign.justify,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://www.bosracity.com')) {
                              await launchUrlString(
                                  'https://www.bosracity.com');
                            }
                          },
                          child: Text(
                            '- ${AppLocalizations.of(context).translate('bosraWebDsc')!}',
                            textAlign: TextAlign.justify,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://www.facebook.com/Bosra.Yusuf')) {
                              await launchUrlString(
                                  'https://www.facebook.com/Bosra.Yusuf');
                            }
                          },
                          child: Text(
                            '- ${AppLocalizations.of(context).translate('bosraGroupDsc')!}',
                            textAlign: TextAlign.justify,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          '- ${AppLocalizations.of(context).translate('musicDsc')!}',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          '- ${AppLocalizations.of(context).translate('packagesUsed')!}',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/flutter_riverpod')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/flutter_riverpod');
                            }
                          },
                          child: Text(
                            '    * flutter_riverpod: ^2.4.9',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/cloud_firestore')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/cloud_firestore');
                            }
                          },
                          child: Text(
                            '    * cloud_firestore: ^4.13.3',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/cached_network_image')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/cached_network_image');
                            }
                          },
                          child: Text(
                            '    * cached_network_image: ^3.3.0',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/firebase_core')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/firebase_core');
                            }
                          },
                          child: Text(
                            '    * firebase_core: ^2.24.0',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/google_fonts')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/google_fonts');
                            }
                          },
                          child: Text(
                            '    * google_fonts: ^6.1.0',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/go_router')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/go_router');
                            }
                          },
                          child: Text(
                            '    * go_router: ^12.1.1',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/http')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/http');
                            }
                          },
                          child: Text(
                            '    * http: ^1.1.2',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/webview_flutter')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/webview_flutter');
                            }
                          },
                          child: Text(
                            '    * webview_flutter: ^4.4.2',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/photo_view')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/photo_view');
                            }
                          },
                          child: Text(
                            '    * photo_view: ^0.14.0',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/wakelock_plus')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/wakelock_plus');
                            }
                          },
                          child: Text(
                            '    * wakelock_plus: ^1.1.4',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/audioplayers')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/audioplayers');
                            }
                          },
                          child: Text(
                            '    * audioplayers: ^5.2.1',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/connectivity_plus')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/connectivity_plus');
                            }
                          },
                          child: Text(
                            '    * connectivity_plus: ^5.0.2',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/another_flutter_splash_screen')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/another_flutter_splash_screen');
                            }
                          },
                          child: Text(
                            '    * another_flutter_splash_screen: ^1.2.0',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/url_launcher')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/url_launcher');
                            }
                          },
                          child: Text(
                            '    * url_launcher: ^6.2.1',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://pub.dev/packages/firebase_crashlytics')) {
                              await launchUrlString(
                                  'https://pub.dev/packages/firebase_crashlytics');
                            }
                          },
                          child: Text(
                            '    * firebase_crashlytics: ^3.4.6',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
