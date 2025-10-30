import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/presentation/state/main_names_state.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/app_player_state.dart';
import '../widgets/main_names_modal.dart';

class MainNameItem extends StatelessWidget {
  const MainNameItem({super.key, required this.nameModel});

  final NameEntity nameModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withAlpha(10);
    final Color evenItemColor = appColors.primary.withAlpha(25);
    return Card(
      margin: AppStyles.mardingBottomOnlyMini,
      child: Container(
        padding: AppStyles.mainMarding,
        height: 225.0,
        decoration: BoxDecoration(
          color: nameModel.id.isOdd ? oddItemColor : evenItemColor,
          borderRadius: AppStyles.mainBorder,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 17.5,
                backgroundColor: appColors.secondary.withAlpha(35),
                child: Padding(
                  padding: AppStyles.mardingTopMicro,
                  child: Text(
                    nameModel.id.toString(),
                    style: TextStyle(
                      fontSize: 15.0,
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
                      player.getCurrentTrackItem == nameModel.id && player.getPlayingState ? Icons.stop_circle_outlined : Icons.play_circle_outline_rounded,
                    ),
                    iconSize: 40.0,
                    color: appColors.primary,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Consumer2<AppPlayerState, MainNamesState>(
                builder: (context, player, mainNamesState, _) {
                  return IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => ChangeNotifierProvider.value(
                          value: mainNamesState,
                          child: MainNamesModal(
                            model: nameModel,
                            mainNamesState: mainNamesState,
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      Icons.ios_share_rounded
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    nameModel.nameArabic,
                    style: TextStyle(
                      fontSize: 27.5,
                      fontFamily: AppStrings.fontNotoNaskh,
                      color: appColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    nameModel.nameTranscription,
                    style: TextStyle(
                      color: appColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    nameModel.nameTranslation,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
