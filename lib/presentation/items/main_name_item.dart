import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/app_player_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/widgets/main_names_modal.dart';

class MainNamesItem extends StatelessWidget {
  const MainNamesItem({super.key, required this.model});

  final NameModel model;

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
            builder: (context) => MainNamesModal(model: model),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            color: model.id.isOdd ? oddItemColor : evenItemColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      model.id.isOdd ? evenItemColor : appColors.background,
                  child: Text(model.id.toString()),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      model.id.isOdd ? evenItemColor : appColors.background,
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
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      model.nameArabic,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Khebrat',
                        color: appColors.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      model.nameTranscription,
                      style: TextStyle(
                        color: appColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      model.nameTranslation,
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
