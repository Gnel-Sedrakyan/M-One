import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final double width;
  final double height;

  final String leftDescription;
  final String rightDescription;

  final Color toggleColor;
  final Color toggleBackgroundColor;

  final Color inactiveTextColor;
  final Color activeTextColor;

  final double _leftToggleAlign = -1;
  final double _rightToggleAlign = 1;

  final VoidCallback onLeftToggleActive;
  final VoidCallback onRightToggleActive;

  final VoidCallback onPressLeft;
  final VoidCallback onPressRight;

  const ToggleButton({
    Key? key,
    required this.width,
    required this.height,
    required this.toggleBackgroundColor,
    required this.toggleColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
    required this.leftDescription,
    required this.rightDescription,
    required this.onLeftToggleActive,
    required this.onRightToggleActive,
    required this.onPressLeft,
    required this.onPressRight,
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

enum SelectedSide {
  left,
  right,
}

class _ToggleButtonState extends State<ToggleButton> {
  double _toggleXAlign = -1;

  late Color _leftDescriptionColor;
  late Color _rightDescriptionColor;
  SelectedSide selectedSide = SelectedSide.left;

  @override
  void initState() {
    super.initState();

    _leftDescriptionColor = widget.activeTextColor;
    _rightDescriptionColor = widget.inactiveTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.toggleBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(_toggleXAlign, 0),
            duration: const Duration(milliseconds: 150),
            child: Container(
              width: widget.width * 0.5,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.toggleColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedSide == SelectedSide.left) {
                widget.onPressLeft();
              } else {
                selectedSide = SelectedSide.left;

                setState(
                  () {
                    _toggleXAlign = widget._leftToggleAlign;

                    _leftDescriptionColor = widget.activeTextColor;
                    _rightDescriptionColor = widget.inactiveTextColor;
                  },
                );

                widget.onRightToggleActive();
              }
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.leftDescription,
                  style: TextStyle(
                      color: _leftDescriptionColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedSide == SelectedSide.right) {
                widget.onPressRight();
              } else {
                selectedSide = SelectedSide.right;

                setState(
                  () {
                    _toggleXAlign = widget._rightToggleAlign;

                    _leftDescriptionColor = widget.inactiveTextColor;
                    _rightDescriptionColor = widget.activeTextColor;
                  },
                );

                widget.onLeftToggleActive();
              }
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.rightDescription,
                  style: TextStyle(
                      color: _rightDescriptionColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
