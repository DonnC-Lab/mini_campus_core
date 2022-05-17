import 'package:flutter/material.dart';
import 'package:mc_core_constants/mc_core_constants.dart';

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
            color: greyTextShade,
          ),
          const SizedBox(width: 10),
          Text(
            'Help & getting started',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: greyTextShade,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '>',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: fieldDMFillText,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
