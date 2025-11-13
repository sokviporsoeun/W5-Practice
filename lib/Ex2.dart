import 'package:flutter/material.dart';

enum BtnType { primary, secondary, disabled }
enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final BtnType btnType;
  final VoidCallback? whenPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.btnType = BtnType.primary,
    this.whenPressed,
  });

  Color _getBtnColor() {
    // choose color depend on button type
    if (btnType == BtnType.secondary) {
      return Colors.green;
    } else if (btnType == BtnType.disabled) {
      return Colors.grey;
    } else {
      return Colors.blue;
    }
  }

  bool get isDisable => btnType == BtnType.disabled;

  @override
  Widget build(BuildContext context) {
    Color bgColor = _getBtnColor();
    return Opacity(
      opacity: isDisable ? 0.5 : 1.0,
      child: InkWell(
        onTap: isDisable ? null : whenPressed,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // icon on left
              if (iconPosition == IconPosition.left)
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              // button text
              Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              // icon on right
              if (iconPosition == IconPosition.right)
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Custom Buttons"),
          backgroundColor: const Color(0xFFFFFFFF),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: "Submit", icon: Icons.check, whenPressed: () {},),
              CustomButton(label: "Time", icon: Icons.access_time, btnType: BtnType.secondary, iconPosition: IconPosition.right, whenPressed: () {},),
              CustomButton(label: "Account", icon: Icons.account_circle, btnType: BtnType.disabled, iconPosition: IconPosition.right,),
            ],
          ),
        ),
      ),
    ),
  );
}
