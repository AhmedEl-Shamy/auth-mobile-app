import 'package:auth_mobile_app/config/size_config.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/log_in_out_cubit/log_in_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/text_stlyles.dart';

class RememberMeCheckButton extends StatefulWidget {
  const RememberMeCheckButton({super.key});

  @override
  State<RememberMeCheckButton> createState() => _RememberMeCheckButtonState();
}

class _RememberMeCheckButtonState extends State<RememberMeCheckButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthBlock * 50,
      child: InkWell(
        onTap: () {
          _updateRememberMeCheckedButton(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(width: 1),
              ),
              value: context.read<LogInOutCubit>().isRememberMeChecked,
              onChanged: (value) {
                _updateRememberMeCheckedButton(context);
              },
            ),
            // const SizedBox(width: 5,),
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

  void _updateRememberMeCheckedButton(BuildContext context) {
    setState(() {
      context.read<LogInOutCubit>().isRememberMeChecked =
          !context.read<LogInOutCubit>().isRememberMeChecked;
    });
  }
}
