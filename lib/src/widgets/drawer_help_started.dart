import 'package:flutter/material.dart';
import 'package:mini_campus_core/mini_campus_core.dart';

class DrawerHelpStarted extends StatelessWidget {
  const DrawerHelpStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 20),
      child: Row(
        children: [
          const Icon(
            Icons.help_outline,
            color: McAppColors.appGreyShadeColor,
          ),
          const SizedBox(width: 10),
          Text(
            'Help & getting started',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: McAppColors.appGreyShadeColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: McAppColors.appBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '>',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: McAppColors.appTextFieldFillColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
