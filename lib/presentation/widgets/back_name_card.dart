import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/state/app_player_state.dart';
import '../../application/styles/app_styles.dart';
import '../../domain/entities/name_entity.dart';

class BackNameCard extends StatelessWidget {
  const BackNameCard({super.key, required this.model, required this.index});

  final NameEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.05);
    final Color evenItemColor = appColors.primary.withOpacity(0.15);
    final AppPlayerState player = Provider.of<AppPlayerState>(context);
    return Container(
      padding: AppStyles.mainMarding,
      margin: const EdgeInsets.only(bottom: 16),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: AppStyles.mainBorder,
        color: index.isOdd ? oddItemColor : evenItemColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: index.isOdd ? oddItemColor : evenItemColor,
              child: IconButton(
                onPressed: () {
                  player.playTrack(
                    nameAudio: model.nameAudio,
                    trackId: model.id,
                  );
                },
                icon: Icon(
                  player.getCurrentTrackItem == model.id &&
                      player.getPlayingState
                      ? CupertinoIcons.stop_circle
                      : CupertinoIcons.play,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.nameTranslation,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                model.nameTranscription,
                style: TextStyle(
                  color: appColors.primary,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: index.isOdd ? evenItemColor : oddItemColor,
              child: Text(
                model.id.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
