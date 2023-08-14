import 'package:flutter/material.dart';

void _showApplyOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Apply Wallpaper To:'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Apply as Home Screen Wallpaper
                Navigator.pop(context); // Close the dialog
                // _applyWallpaperToHomeScreen();
              },
              child: const Text('Home Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                // Apply as Lock Screen Wallpaper
                Navigator.pop(context); // Close the dialog
                // _applyWallpaperToLockScreen();
              },
              child: const Text('Lock Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                // Apply as Both Home Screen and Lock Screen Wallpaper
                Navigator.pop(context); // Close the dialog
                // _applyWallpaperToBoth();
              },
              child: const Text('Both'),
            ),
          ],
        ),
      );
    },
  );
}
