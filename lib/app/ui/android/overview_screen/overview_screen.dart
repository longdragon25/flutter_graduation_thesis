import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation_thesis/app/ui/android/home_screen/home_page.dart';
import 'package:flutter_graduation_thesis/app/ui/android/widgets/bar_chart.dart';
import 'package:flutter_graduation_thesis/app/ui/android/widgets/box_border_list_widget.dart';
import 'package:flutter_graduation_thesis/app/ui/android/widgets/circle_item_widget.dart';
import 'package:flutter_graduation_thesis/app/ui/android/widgets/height_box.dart';
import 'package:flutter_graduation_thesis/app/ui/android/widgets/super_icon_widget.dart';
import 'package:flutter_graduation_thesis/app/ui/android/widgets/transaction_item_widget.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_colors.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_text_theme.dart';

class OverViewScreen extends StatelessWidget {
  OverViewScreen({Key? key}) : super(key: key);

  List<Widget> listWidgets = [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Ví của tôi',
            style: textTheme().headline5!.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'Xem tất cả',
            style: textTheme().headline5!.copyWith(
                fontWeight: FontWeight.bold, color: ColorsTheme.mainGreen),
          ),
        ],
      ),
    ),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          CircleItemWidget(
              colorBackground: ColorsTheme.mainBackgroundColor,
              child: const Icon(
                Icons.account_balance_wallet_outlined,
              )),
          const WidthBox(16),
          Text(
            'abcd',
            style: textTheme().headline4!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Text(
        '1,000,000,000',
        style: textTheme().headline4!.copyWith(fontWeight: FontWeight.w600),
      )
    ]),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          CircleItemWidget(
              colorBackground: ColorsTheme.mainBackgroundColor,
              child: const Icon(
                Icons.account_balance_wallet_outlined,
              )),
          const WidthBox(16),
          Text(
            'abcd',
            style: textTheme().headline4!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Text(
        '1,000,000,000',
        style: textTheme().headline4!.copyWith(fontWeight: FontWeight.w600),
      )
    ]),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          CircleItemWidget(
              colorBackground: ColorsTheme.mainBackgroundColor,
              child: const Icon(
                Icons.account_balance_wallet_outlined,
              )),
          const WidthBox(16),
          Text(
            'abcd',
            style: textTheme().headline4!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Text(
        '1,000,000,000',
        style: textTheme().headline4!.copyWith(fontWeight: FontWeight.w600),
      )
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.mainBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTotalMoney(),
            const SizedBox(
              height: 16,
            ),
            BoxBorderListWidget(
              listWidget: listWidgets,
            ),
            const HeightBox(16),
            _buildTitleSession(
                leftText: 'Báo cáo chi tiêu', rightText: 'Xem báo cáo'),
            const HeightBox(8),
            _buildReportChart(),
            const HeightBox(24),
            _buildTitleSession(
                leftText: 'Giao dịch gần đây', rightText: 'Xem tất cả'),
            const HeightBox(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorsTheme.colorOfBox,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: const [
                    TransactionItemWidget(),
                    HeightBox(16),
                    TransactionItemWidget(),
                    HeightBox(16),
                    TransactionItemWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Padding _buildReportChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            color: ColorsTheme.colorOfBox,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HeightBox(16),
            _buildWeekMonthOptions(),
            const HeightBox(32),
            _buildTextIndicate(),
            const HeightBox(8),
            BarChartSample3(),
          ]),
        ),
      ),
    );
  }

  Column _buildTextIndicate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '0 đ',
          style: textTheme().headline3,
        ),
        Row(
          children: [
            Text('Tổng chi tháng này',
                style: textTheme().headline5!.copyWith(
                      color: ColorsTheme.colorTextGrey,
                    )),
            Icon(
              Icons.arrow_downward_rounded,
              color: ColorsTheme.mainGreen,
              size: 16,
            ),
            Text('100%',
                style: textTheme().headline5!.copyWith(
                      color: ColorsTheme.mainGreen,
                    ))
          ],
        )
      ],
    );
  }

  Row _buildWeekMonthOptions() {
    return Row(
      children: [
        // Week
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: ColorsTheme.mainBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              border:
                  Border.all(width: 2, color: ColorsTheme.mainBackgroundColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text(
                'Tuần',
                style: textTitleStyle(),
              ),
            ),
          ),
        )),
        // Month
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: ColorsTheme.colorOfBox,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    border: Border.all(
                        width: 2, color: ColorsTheme.mainBackgroundColor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text(
                      'Tháng',
                      style: textTitleStyle(),
                    ),
                  ),
                )))
      ],
    );
  }

  Padding _buildTitleSession({String? leftText, String? rightText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText ?? "",
            style: textTitleStyle().copyWith(color: ColorsTheme.colorTextGrey),
          ),
          Text(
            rightText ?? "",
            style: textTitleStyle().copyWith(color: ColorsTheme.mainGreen),
          )
        ],
      ),
    );
  }

  Padding _buildTotalMoney() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0,0,000 đ',
                style: textTheme().headline2,
              ),
              Text(
                'Tổng số dư',
                style: textTheme().headline4,
              )
            ],
          ),
          const Icon(
            Icons.notifications,
            size: 24,
          )
        ],
      ),
    );
  }
}
