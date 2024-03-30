import 'package:fluttertoast/fluttertoast.dart';

class CustomToasts{
  Future<bool?> showToast(List data){
    return Fluttertoast.showToast(
      msg: data[1],
      webBgColor: data[0] == true?"linear-gradient(to right, #00b09b, #96c93d)":"linear-gradient(to right, #ff0000, #ff6347)",
      webPosition: "center",
      timeInSecForIosWeb: 2
    );
  }
}