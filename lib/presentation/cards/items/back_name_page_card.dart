import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/app_player_state.dart';

class BackNamePageCard extends StatelessWidget {
  const BackNamePageCard({
    super.key,
    required this.model,
    required this.index,
  });

  final NameEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withAlpha(10);
    final Color evenItemColor = appColors.primary.withAlpha(25);
    return Container(
      padding: AppStyles.mainMardingMini,
      margin: AppStyles.mardingBottomOnlyMini,
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
              backgroundColor: appColors.surface,
              child: Padding(
                padding: AppStyles.mardingTopMicro,
                child: Text(
                  model.id.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: AppStrings.fontGilroy,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.nameTranscription,
                style: TextStyle(
                  color: appColors.secondary,
                  fontSize: 22.5,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                model.nameTranslation,
                style: const TextStyle(
                  fontSize: 22.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer<AppPlayerState>(
              builder: (context, appPlayerState, _) {
                return IconButton(
                  onPressed: () {
                    appPlayerState.playTrack(
                      nameAudio: model.nameAudio,
                      trackId: model.id,
                    );
                  },
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  icon: Icon(
                    appPlayerState.getCurrentTrackItem == model.id && appPlayerState.getPlayingState
                        ? Icons.stop_circle_outlined : Icons.play_circle_outline_rounded,
                    size: 50.0,
                  ),
                  color: appColors.primary,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
