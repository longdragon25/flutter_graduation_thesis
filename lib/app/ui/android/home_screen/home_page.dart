import 'package:flutter/material.dart';
import 'package:flutter_graduation_thesis/app/ui/android/transaction_screen/transaction_screen.dart';
import 'package:flutter_graduation_thesis/app/ui/android/wallet_screen/wallet_screen.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  // final Widget body;
  // final Widget? header;

  RxInt selectedTabIndex = 0.obs;
  static int homeIndex = 0;
  static int walletIndex = 1;
  static int planIndex = 2;
  static int accountIndex = 3;

  final List<Widget> _listScreens = [
    const TransactionScreen(),
    const WalletScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: selectedTabIndex.value,
          children: _listScreens,
        ),
      ),
      bottomNavigationBar: _buildBottomTabBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomTabBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: -10,
      child: Obx(
        () => SizedBox(
          height: 66,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Home
            _buildBottomBarItem(key, 'Tổng quan', () {
              selectedTabIndex.value = homeIndex;
              // Get.to(() => const TransactionScreen(),
              //     transition: Transition.cupertino);
            }, selectedTabIndex.value == homeIndex ? Colors.black : Colors.grey,
                listIcons[0]),
            // Wallet
            _buildBottomBarItem(key, 'Sổ giao dịch', () {
              selectedTabIndex.value = walletIndex;
              // Get.to(() => const WalletScreen(),
              //     transition: Transition.cupertino);
            },
                selectedTabIndex.value == walletIndex
                    ? Colors.black
                    : Colors.grey,
                listIcons[1]),
            // plus button
            const SizedBox(
              width: 60,
            ),

            _buildBottomBarItem(key, 'Lập kế hoạch', () {
              selectedTabIndex.value = planIndex;
            }, selectedTabIndex.value == planIndex ? Colors.black : Colors.grey,
                listIcons[2]),
            // Account
            _buildBottomBarItem(key, 'Tài khoản', () {
              selectedTabIndex.value = accountIndex;
            },
                selectedTabIndex.value == accountIndex
                    ? Colors.black
                    : Colors.grey,
                listIcons[3]),
          ]),
        ),
      ),
    );
  }

  final List<IconData> listIcons = [
    Icons.home,
    Icons.account_balance_wallet_rounded,
    Icons.article_sharp,
    Icons.account_circle,
  ];

  Widget _buildBottomBarItem(
    Key? key,
    String title,
    Function? fnTap,
    Color color,
    IconData icon,
  ) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: () => fnTap!.call(),
            child: Column(
              key: key,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: color,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 10, color: color),
                )
              ],
            ),
          ),
        ),
      );
}
