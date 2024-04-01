import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String? title;
  final Function fn;
  const CustomButton({super.key, required this.formKey, required this.fn,this.title});

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
      widget.fn();
      // router.go('/register');
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
          backgroundColor: WidgetStateProperty.all<Color>(
              _isButtonDisabled ? Colors.grey : Colors.white),
          foregroundColor: WidgetStateProperty.all<Color>(
              _isButtonDisabled ? Colors.black54 : Colors.black),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: !_isButtonDisabled,
              child: Text(widget.title ?? 'Subscribe'),
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
