import 'package:flutter/material.dart';
import '../theme/sweets_theme.dart';

class SweetsOtpField extends StatelessWidget {
  const SweetsOtpField({
    super.key,
    this.values,
    this.onChanged,
  });

  final List<String>? values;
  final Function(int index, String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final value = values != null && index < values!.length ? values![index] : '';
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index < 3 ? 12 : 0),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: SweetsColors.grayLighter,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 24 / 16,
                    color: SweetsColors.grayDarker,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
