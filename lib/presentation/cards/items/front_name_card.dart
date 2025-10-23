import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/core/strings/app_strings.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/app_player_state.dart';

class FrontNameCard extends StatelessWidget {
  const FrontNameCard({
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
    return Card(
      margin: AppStyles.mardingBottomOnlyMini,
      child: Container(
        padding: AppStyles.mainMarding,
        height: 225,
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
                backgroundColor: appColors.secondary.withAlpha(35),
                radius: 17.5,
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
            Align(
              alignment: Alignment.center,
              child: Text(
                model.nameArabic,
                style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: AppStrings.fontNotoNaskh,
                  color: appColors.primary,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Consumer<AppPlayerState>(
                builder: (context, appPlayerState, _) {
                  return IconButton.filledTonal(
                    onPressed: () {
                      appPlayerState.playTrack(
                        nameAudio: model.nameAudio,
                        trackId: model.id,
                      );
                    },
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      appPlayerState.getCurrentTrackItem == model.id && appPlayerState.getPlayingState ? Icons.stop_circle_outlined : Icons.play_circle_outline_rounded,
                      size: 40.0,
                    ),
                    color: appColors.primary,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.change_circle_outlined,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
