import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../state/content_settings_state.dart';

class SettingsColumn extends StatelessWidget {
  const SettingsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final appColors = Theme.of(context).colorScheme;
    return Padding(
      padding: AppStyles.mardingWithoutTop,
      child: Consumer<ContentSettingsState>(
        builder: (context, settingsState, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                AppStrings.textSize,
                style: AppStyles.mainTextStyle,
              ),
              Row(
                children: [
                  Icon(
                    Icons.text_decrease_rounded,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Slider(
                      padding: AppStyles.mainMardingMicro,
                      value: settingsState.textSize,
                      min: 14,
                      max: 100,
                      divisions: 100,
                      label: settingsState.textSize.round().toString(),
                      onChanged: (double? size) {
                        settingsState.textSize = size!;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.text_increase_rounded,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                AppStrings.textFont,
                style: AppStyles.mainTextStyle,
              ),
              const SizedBox(height: 10),
              Card(
                child: CupertinoSlidingSegmentedControl(
                  proportionalWidth: true,
                  thumbColor: appColors.inversePrimary,
                  padding: AppStyles.mainMardingMicro,
                  children: <int, Widget>{
                    0: Text(
                      AppStrings.fontGilroy,
                      style: AppStyles.mainTextStyle,
                    ),
                    1: Text(
                      AppStrings.fontMontserrat,
                      style: AppStyles.mainTextStyle,
                    ),
                    2: Text(
                      AppStrings.fontRaleway,
                      style: AppStyles.mainTextStyle,
                    ),
                  },
                  groupValue: settingsState.fontIndex,
                  onValueChanged: (int? index) {
                    settingsState.fontIndex = index!;
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                AppStrings.alignText,
                style: AppStyles.mainTextStyle,
              ),
              const SizedBox(height: 10),
              Card(
                child: CupertinoSlidingSegmentedControl(
                  proportionalWidth: true,
                  thumbColor: appColors.inversePrimary,
                  padding: AppStyles.mainMardingMicro,
                  children: const <int, Widget>{
                    0: Icon(CupertinoIcons.text_alignleft),
                    1: Icon(CupertinoIcons.text_aligncenter),
                    2: Icon(CupertinoIcons.text_alignright),
                    3: Icon(CupertinoIcons.text_justify),
                  },
                  groupValue: settingsState.textAlignIndex,
                  onValueChanged: (int? index) {
                    settingsState.textAlignIndex = index!;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: AppStyles.bigShape,
                child: ListTile(
                  shape: AppStyles.mainShape,
                  contentPadding: AppStyles.mainMardingMini,
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  title: Text(
                    AppStrings.textColor,
                    style: AppStyles.mainTextStyle,
                  ),
                  leading: Icon(
                    Icons.palette_outlined,
                    color: appTheme.brightness == Brightness.dark
                        ? settingsState.darkTextColor
                        : settingsState.lightTextColor,
                  ),
                  trailing: Card(
                    margin: EdgeInsets.zero,
                    shape: AppStyles.bigShape,
                    color: appColors.inversePrimary,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text(
                                    AppStrings.forLightTheme,
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: AppStyles.mainShape,
                                  content: Material(
                                    color: Colors.transparent,
                                    child: MaterialColorPicker(
                                      elevation: 0,
                                      alignment: WrapAlignment.center,
                                      onColorChange: (Color color) {
                                        settingsState.lightTextColor = color;
                                      },
                                      selectedColor: settingsState.lightTextColor,
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      shape: AppStyles.mainShape,
                                      child: const Text(
                                        AppStrings.close,
                                        style: AppStyles.mainTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: settingsState.lightTextColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text(
                                    AppStrings.forDarkTheme,
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: AppStyles.mainShape,
                                  content: Material(
                                    color: Colors.transparent,
                                    child: MaterialColorPicker(
                                      elevation: 0,
                                      alignment: WrapAlignment.center,
                                      onColorChange: (Color color) {
                                        settingsState.darkTextColor = color;
                                      },
                                      selectedColor: settingsState.darkTextColor,
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      shape: AppStyles.mainShape,
                                      child: const Text(
                                        AppStrings.close,
                                        style: AppStyles.mainTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: settingsState.darkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                value: settingsState.wakeLock,
                onChanged: (bool? onChanged) {
                  settingsState.wakeLock = onChanged!;
                },
                contentPadding: AppStyles.mainMardingHorizontalMini,
                title: Text(
                  AppStrings.displayAlways,
                  style: AppStyles.mainTextStyle,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
