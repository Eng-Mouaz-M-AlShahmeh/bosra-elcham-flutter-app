// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:bosra_elcham/src/presentation/widgets/app_bar.dart';
import 'package:bosra_elcham/src/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (val) => context.goNamed('/home'),
      child: Scaffold(
        appBar: iAppBar(
          context,
          ref,
          AppLocalizations.of(context).translate('about')!,
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
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(200)),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('assets/images/logo.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.justify,
                          AppLocalizations.of(context).translate('aboutApp')!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            // color: Theme.of(context).colorScheme.onSecondary,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/images/mlogo.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.center,
                          AppLocalizations.of(context).translate('aboutDsc')!,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://malshahmeh.web.app/privacy')) {
                              await launchUrlString(
                                  'https://malshahmeh.web.app/privacy');
                            }
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context).translate('privacy')!,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://malshahmeh.web.app/privacy')) {
                              await launchUrlString(
                                  'https://malshahmeh.web.app/privacy');
                            }
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context).translate('terms')!,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            context.goNamed('/acknowledgement');
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context).translate('thanks')!,
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
