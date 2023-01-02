import 'package:flutter/material.dart';
import 'package:flutter_graduation_thesis/app/ui/android/widgets/height_box.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_colors.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_text_theme.dart';

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.diamond),
            ),
            const WidthBox(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ăn uống',
                  style: textTheme().headline4,
                ),
                const HeightBox(4),
                Text(
                  '25 tháng 12,2022',
                  style: textTheme()
                      .headline5!
                      .copyWith(color: ColorsTheme.colorTextGrey),
                )
              ],
            ),
          ],
        ),
        Text(
          '5,000,000',
          style: textTheme().headline4!.copyWith(color: ColorsTheme.mainRed),
        )
      ],
    );
  }
}
