import 'package:becomponent/src/page/be_page_state.dart';
import 'package:becore/getx.dart';
// import 'package:bego_app/src/page/i_be_page.dart';
// import 'package:bego_core/bego_getx.dart'
// show ErrorStatus, LoadingStatus, StateController, SuccessStatus;

class BePageController<S extends BePageState> extends StateController<S> {
  BePageController();

  @override
  void onInit() {
    super.onInit();
    // change(LoadingStatus());
    // futurize(pageInt);
  }

  // Future<S> pageInt() async => state;

  // @override
  // void hideLoading() {
  //   change(SuccessStatus(state));
  // }

  // @override
  // void showLoading() {
  //   change(LoadingStatus());
  // }

  // @override
  // void showMessage(String title, String message) {}

  // @override
  // void onError(dynamic error) {
  //   change(ErrorStatus(error));
  // }

  // // can be override and update `CustomStatus` with custom data
  // @override
  // void onSucess(S data) {
  //   change(SuccessStatus(data));
  // }
}
