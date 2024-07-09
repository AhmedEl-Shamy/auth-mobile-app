import 'package:flutter/material.dart';

import '../../../../core/utils/text_stlyles.dart';

class RememberMeCheckButton extends StatefulWidget {
  const RememberMeCheckButton({super.key});

  @override
  State<RememberMeCheckButton> createState() => _RememberMeCheckButtonState();
}

class _RememberMeCheckButtonState extends State<RememberMeCheckButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
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
              value: isChecked,
              onChanged: (value) {
                setState(
                  () {
                    isChecked = !isChecked;
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
