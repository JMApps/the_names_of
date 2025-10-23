import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/app_player_state.dart';
import '../../state/content_settings_state.dart';

class ClarificationNameItem extends StatelessWidget {
  const ClarificationNameItem({
    super.key,
    required this.nameModel,
  });

  final NameEntity nameModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mardingWithoutTopMini,
      child: Container(
        padding: AppStyles.mainMardingMini,
        height: 150,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                backgroundColor: appColors.secondary.withAlpha(35),
                radius: 17.5,
                child: Padding(
                  padding: AppStyles.mardingTopMicro,
                  child: Text(
                    nameModel.id.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: AppStrings.fontGilroy,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Consumer<AppPlayerState>(
                builder: (context, player, _) {
                  return IconButton.filledTonal(
                    onPressed: () {
                      player.playTrack(
                        nameAudio: nameModel.nameAudio,
                        trackId: nameModel.id,
                      );
                    },
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      player.getCurrentTrackItem == nameModel.id && player.getPlayingState
                          ? Icons.stop_circle_outlined
                          : Icons.play_circle_outline_rounded,
                    ),
                    iconSize: 40.0,
                    color: appColors.secondary,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Consumer<ContentSettingsState>(
                builder: (context, contentSettingsState, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nameModel.nameArabic,
                        style: TextStyle(
                          fontSize: contentSettingsState.textSize + 5,
                          fontFamily: AppStrings.fontNotoNaskh,
                          color: appColors.primary,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        nameModel.nameTranscription,
                        style: TextStyle(
                          fontSize: contentSettingsState.textSize,
                          color: appColors.secondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        nameModel.nameTranslation,
                        style: TextStyle(
                          fontSize: contentSettingsState.textSize,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
