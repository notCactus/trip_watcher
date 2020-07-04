import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function onTapFunction;

  AddButton({@required this.onTapFunction,});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.lightBlue,
      ),
      child: InkWell(
        onTap: () {
          onTapFunction();
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width - 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
