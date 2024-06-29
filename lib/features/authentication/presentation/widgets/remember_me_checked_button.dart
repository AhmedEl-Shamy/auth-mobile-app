import 'package:flutter/material.dart';

import '../../../../core/utils/text_stlyles.dart';

class RememberMeCheckButton extends StatefulWidget {
  RememberMeCheckButton({super.key});
  bool isChecked = false;

  @override
  State<RememberMeCheckButton> createState() => _RememberMeCheckButtonState();
}

class _RememberMeCheckButtonState extends State<RememberMeCheckButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: () {
          setState(() {
            widget.isChecked = !widget.isChecked;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(width: 1),
              ),
              value: widget.isChecked,
              onChanged: (value) {
                setState(
                  () {
                    widget.isChecked = !widget.isChecked;
                  },
                );
              },
            ),
            
            Text(
              'Remember me',
              style: TextStlyles.normal.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}