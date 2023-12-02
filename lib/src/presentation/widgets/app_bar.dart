// Developed by Eng Mouaz M AlShahmeh
import 'package:audioplayers/audioplayers.dart';
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

AppBar iAppBar(BuildContext context, WidgetRef ref, String title) {
  final isEnglish = ref.watch(isEnglishProvider.notifier);
  final audioPlayer = ref.watch(audioPlayerProvider);
  final isPlaying = ref.watch(isPlayingProvider.notifier);
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    leading: InkWell(
      onTap: () async {
        if (isPlaying.state == true) {
          await audioPlayer.pause();
          isPlaying.state = !isPlaying.state;
        } else {
          if (audioPlayer.state == PlayerState.paused) {
            await audioPlayer.resume();
            await audioPlayer.setReleaseMode(ReleaseMode.loop);
          } else {
            await audioPlayer.play(AssetSource('music.mp3'));
            await audioPlayer.setReleaseMode(ReleaseMode.loop);
          }

          isPlaying.state = !isPlaying.state;
        }
      },
      child: Consumer(
        builder: (context, ref, child) {
          final isPlayingState = ref.watch(isPlayingProvider);
          return Icon(
            isPlayingState ? Icons.music_off : Icons.music_note,
            color: Colors.white.withAlpha(150),
          );
        },
      ),
    ),
    actions: [
      InkWell(
        onTap: () async {
          if (isEnglish.state == true) {
            isEnglish.state = !isEnglish.state;
            context.goNamed('/');
          } else {
            isEnglish.state = !isEnglish.state;
            context.goNamed('/');
          }
        },
        child: Consumer(
          builder: (context, ref, child) {
            final isEnglishState = ref.watch(isEnglishProvider);
            return Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                isEnglishState ? 'ع' : 'En',
                style: TextStyle(
                  color: Colors.white.withAlpha(150),
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                ),
              ),
            );
          },
        ),
      ),
    ],
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    ),
    centerTitle: true,
  );
}
