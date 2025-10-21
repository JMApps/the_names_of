import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Container(
      margin: AppStyles.mardingBottomOnlyMini,
      child: InkWell(
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => MainNamesModal(model: nameModel),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            color: nameModel.id.isOdd ? oddItemColor : evenItemColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
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
                    return IconButton(
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
                      iconSize: 35.0,
                      color: appColors.secondary,
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
      ),
    );
  }
}
