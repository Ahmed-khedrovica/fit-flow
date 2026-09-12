import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Top media zone — dark backdrop with a glass play button and a
/// fullscreen control, matching the Figma "Section - Media Zone".
class WorkoutMediaZone extends StatelessWidget {
  const WorkoutMediaZone({super.key, this.onPlay, this.onFullscreen});

  final VoidCallback? onPlay;
  final VoidCallback? onFullscreen;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // TODO(asset): exercise demonstration video/poster (Figma
            // "Workout demonstration"). Add under assets/ and render via
            // Assets.* here; the dark backdrop stands in for now.
            const ColoredBox(color: AppColors.workoutMediaBackground),
            Center(
              child: GestureDetector(
                onTap: onPlay,
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      width: 64,
                      height: 64,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.glassFillLight,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.glassBorderLight),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        size: 28,
                        color: AppColors.surface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 16,
              end: 16,
              child: GestureDetector(
                onTap: onFullscreen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      color: AppColors.mediaControlScrim,
                      child: const Icon(
                        Icons.fullscreen,
                        size: 18,
                        color: AppColors.surface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
