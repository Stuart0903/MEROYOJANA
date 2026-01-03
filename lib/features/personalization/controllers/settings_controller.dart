import 'package:get/get.dart';

import '../../../data/repo/authentication/auth_repo.dart';
import '../../../utils/https/network_manager.dart';
import '../../../utils/popups/full_screenLoader.dart';
import '../../../utils/popups/loaders.dart';

/// Controller to manage settings and related functionality
class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  final _authRepo = AuthenticationRepository.instance;

  /// Logout user - using the existing logout method in AuthRepository
  Future<void> logout() async {
    try {
      // Show loading indicator
      // UNFullScreenLoader.openLoadingDialog('Logging out...', 'logout_animation');

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        UNFullScreenLoader.stopLoading();
        // Show error message
        UNLoaders.errorSnackBar(
          title: 'No Internet Connection',
          message: 'Check your internet connection and try again.',
        );
        return;
      }

      // Call logout from auth repository
      // Note: The existing implementation already handles navigation to LoginView
      await _authRepo.logout();

      // Remove loader
      UNFullScreenLoader.stopLoading();

      // Note: We don't need to navigate again since AuthRepo.logout() already does this
      // Also don't need success message as the user will already be on the login screen

    } catch (e) {
      // Remove loader
      UNFullScreenLoader.stopLoading();

      // Show error message
      UNLoaders.errorSnackBar(
        title: 'Logout Failed',
        message: e.toString(),
      );
    }
  }
}