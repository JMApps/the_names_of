import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/app_player_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/name_model.dart';

class FrontNameCard extends StatelessWidget {
  const FrontNameCard({super.key, required this.model, required this.index});

  final NameModel model;
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
              backgroundColor: index.isOdd ? evenItemColor : oddItemColor,
              child: Text(
                model.id.toString(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              model.nameArabic,
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Khebrat',
                color: appColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
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
                  player.getCurrentTrackItem == model.id && player.getPlayingState
                      ? CupertinoIcons.stop_circle
                      : CupertinoIcons.play,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
