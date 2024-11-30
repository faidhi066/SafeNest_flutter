import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

enum BarType { account, category }

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({
    super.key,
    required this.type,
    required this.amount,
    required this.total,
    required this.colorIndex,
  });

  final BarType type;
  final double amount;
  final double total;
  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;
    final colorList = isDarkMode
        ? (type == BarType.account
            ? darkAccountColorList
            : darkCategoryColorList)
        : (type == BarType.account ? accountColorList : categoryColorList);

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: LinearProgressIndicator(
        value: amount != 0 ? amount / total : 0,
        minHeight: 16,
        backgroundColor: colorList[colorIndex].withOpacity(0.3),
        valueColor: AlwaysStoppedAnimation<Color>(colorList[colorIndex]),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
