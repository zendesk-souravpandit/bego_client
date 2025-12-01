import 'package:bego/pages/profile/profile_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class ProfileController extends BePageController<ProfileState> {
  ProfileController();

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      change(SuccessStatus(ProfileState.initial()));
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void editProfile() {
    Get.toNamed<void>('/edit-profile');
  }

  Future<void> logout() async {
    try {
      change(SuccessStatus(state.copyWith(isLoading: true)));

      // Simulate logout API call
      await Future<void>.delayed(const Duration(seconds: 1));

      // Navigate to login
      await Get.offAllNamed<void>('/login');
    } catch (e) {
      change(
        SuccessStatus(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Logout failed. Please try again.',
          ),
        ),
      );
    }
  }

  void goBack() {
    Get.back<void>();
  }
}
