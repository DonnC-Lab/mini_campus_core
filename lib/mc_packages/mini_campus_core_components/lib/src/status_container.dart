import 'package:flutter/material.dart';

import '../../../index.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer({
    Key? key,
    this.state = false,
    this.activeText = 'Active',
    this.deactiveText = 'Deactive',
    this.width = 60.0,
  }) : super(key: key);

  final bool state;
  final String activeText;
  final String deactiveText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width / 2,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: state
              ? McAppColors.appGreenIndicatorColor.withOpacity(0.4)
              : McAppColors.appRedIndicatorColor.withOpacity(0.4)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            state ? activeText : deactiveText,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: state
                      ? McAppColors.appGreenIndicatorColor
                      : McAppColors.appRedIndicatorColor,
                ),
          ),
        ),
      ),
    );
  }
}
