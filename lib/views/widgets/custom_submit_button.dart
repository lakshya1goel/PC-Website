import 'package:flutter/material.dart';
import 'package:pcwebsite/utils/routers/app_routers.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isButtonDisabled = false;

  void _onPressed() {
    if (!_isButtonDisabled) {
      setState(() {
        _isButtonDisabled = true;
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isButtonDisabled = false;
        });
      });
      router.go('/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 40,
      width: screenWidth < 500 ? screenWidth * 0.50 : 120,
      child: ElevatedButton(
        onPressed: _isButtonDisabled ? null : _onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              _isButtonDisabled ? Colors.grey : Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(
              _isButtonDisabled ? Colors.black54 : Colors.black),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: !_isButtonDisabled,
              child: const Text('Subscribe'),
            ),
            Visibility(
              visible: _isButtonDisabled,
              child: const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}