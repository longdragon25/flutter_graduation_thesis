import 'package:flutter/material.dart';
import 'package:flutter_graduation_thesis/app/ui/android/home_screen/home_page.dart';
import 'package:flutter_graduation_thesis/app/ui/android/widgets/super_icon_widget.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build Transaction screen');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 70,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                const SuperIcon(
                  iconPath: 'assets/icons/wallet_2.svg',
                  size: 25.0,
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.grey)
              ],
            ),
          ),
        ),
      ),
      body: const SizedBox(),
    );
  }
}
