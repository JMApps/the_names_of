import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/state/app_player_state.dart';
import '../../application/styles/app_styles.dart';
import '../../domain/entities/name_entity.dart';
import '../widgets/main_names_modal.dart';

class MainNamesItem extends StatelessWidget {
  const MainNamesItem({super.key, required this.nameModel});

  final NameEntity nameModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.05);
    final Color evenItemColor = appColors.primary.withOpacity(0.15);
    final AppPlayerState player = Provider.of<AppPlayerState>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
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
                  radius: 20,
                  backgroundColor:
                      nameModel.id.isOdd ? evenItemColor : appColors.surface,
                  child: Text(nameModel.id.toString()),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      nameModel.id.isOdd ? evenItemColor : appColors.surface,
                  child: IconButton(
                    onPressed: () {
                      player.playTrack(
                        nameAudio: nameModel.nameAudio,
                        trackId: nameModel.id,
                      );
                    },
                    icon: Icon(
                      player.getCurrentTrackItem == nameModel.id &&
                          player.getPlayingState
                          ? CupertinoIcons.stop_circle
                          : CupertinoIcons.play,
                    ),
                  ),
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
                        fontSize: 25,
                        fontFamily: 'Scheherezade',
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
