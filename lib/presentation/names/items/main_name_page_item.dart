import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/app_player_state.dart';
import '../../widgets/main_names_modal.dart';

class MainNamePageItem extends StatelessWidget {
  const MainNamePageItem({super.key, required this.nameModel});

  final NameEntity nameModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppPlayerState player = Provider.of<AppPlayerState>(context);
    return Card(
      margin: AppStyles.mainMardingMini,
      elevation: 0,
      color: appColors.secondaryContainer.withAlpha(175),
      child: Container(
        padding: AppStyles.mainMarding,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  player.playTrack(
                    nameAudio: nameModel.nameAudio,
                    trackId: nameModel.id,
                  );
                },
                icon: Icon(
                  player.getCurrentTrackItem == nameModel.id && player.getPlayingState ? Icons.stop_circle_rounded : Icons.play_circle_fill_rounded,
                ),
                iconSize: 45.0,
                color: appColors.primary,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => MainNamesModal(model: nameModel),
                  );
                },
                icon: Icon(Icons.ios_share),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nameModel.nameArabic,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: AppStrings.fontScheherezade,
                      color: appColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    nameModel.nameTranscription,
                    style: TextStyle(
                      color: appColors.secondary,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    nameModel.nameTranslation,
                    style: TextStyle(
                      fontSize: 20.0,
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
