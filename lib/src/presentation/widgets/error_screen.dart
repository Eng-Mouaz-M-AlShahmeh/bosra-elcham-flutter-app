// Developed by Eng Mouaz M AlShahmeh
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Column(
                children: [
                  Image.asset('assets/images/connection-error.png'),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context).translate('sorryError')!,
                    style: TextStyle(
                      fontSize: isEnglish ? 28.0 : 34.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).translate('checkConnection')!,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
