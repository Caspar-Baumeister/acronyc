import 'package:acronyc_app/utiles/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  // show success toast
  static void showSuccessToast(String message, {int? timeInSec}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: timeInSec ?? 2,
      backgroundColor: CustomColors.backgroundColorSuccess,
      textColor: CustomColors.secondaryTextColor,
    );
  }

  // show error toast
  static void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: CustomColors.backgroundColorError,
      textColor: CustomColors.secondaryTextColor,
    );
  }
}
