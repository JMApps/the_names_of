import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/core/strings/app_strings.dart';
import 'package:the_names_of/presentation/state/main_names_state.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../names/widgets/main_names_modal.dart';
import '../../state/app_player_state.dart';

class FrontNamePageCard extends StatelessWidget {
  const FrontNamePageCard({
    super.key,
    required this.nameModel,
    required this.index,
  });

  final NameEntity nameModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final mainNamesState = Provider.of<MainNamesState>(context, listen: false);
    return Card(
      margin: AppStyles.mainMardingMini,
      child: Padding(
        padding: AppStyles.mainMarding,
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
                      fontSize: 16.0,
                      fontFamily: AppStrings.fontGilroy,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.change_circle_outlined,
                color: Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                nameModel.nameArabic,
                style: TextStyle(
                  fontSize: 50.0,
                  fontFamily: AppStrings.fontNotoNaskh,
                  color: appColors.primary,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<AppPlayerState>(
                builder: (context, appPlayerState, _) {
                  return IconButton.filledTonal(
                    onPressed: () {
                      appPlayerState.playTrack(
                        nameAudio: nameModel.nameAudio,
                        trackId: nameModel.id,
                      );
                    },
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      appPlayerState.getCurrentTrackItem == nameModel.id && appPlayerState.getPlayingState ? Icons.stop_circle_outlined : Icons.play_circle_outline_rounded,
                      size: 50.0,
                    ),
                    color: appColors.primary,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ChangeNotifierProvider.value(
                      value: mainNamesState,
                      child: MainNamesModal(
                        model: nameModel,
                        mainNamesState: mainNamesState,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.ios_share_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
