import 'package:flutter/material.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_colors.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_text_theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with TickerProviderStateMixin {
// tab controller để điều khiển tab
  late TabController _tabController;
  // ScrollController listScrollController;
  // biến wallet hiện tại
  // Wallet wallet;
  // biến điều khiển việc hiển thị transaction ở dạng view by category hay view by date
  Rx<bool> viewByCategory = false.obs;
  // biến điều khiển cách phân chia tab
  Rx<int> choosedTimeRange = 3.obs;
  // ký tự đơn vị tiền tệ của các transaction
  // String currencySymbol;
  // list các tab
  RxList<Tab> myTabs = <Tab>[].obs;
  // danh sách các thời điểm bắt đầu phục vụ chức năng 'View report for this period'
  List<DateTime> beginDate = [];
  // danh sách các thời điểm kết thức phục vụ chức năng 'View report for this period'
  List<DateTime> endDate = [];

  @override
  void initState() {
    //  implement initState
    super.initState();

    beginDate.clear();
    endDate.clear();

// set up lấy các begin date
    int index = 0;
    var now = DateTime.now();
    for (; index < 20; index++) {
      var date = DateTime(now.year, now.month - (18 - index), 1);
      beginDate.add(date);
      if (index < 19) {
        endDate.add(DateTime(
          beginDate[index].year,
          beginDate[index].month + 1,
          beginDate[index].day - 1,
        ));
      }
    }

    myTabs.value = initTabBar(choosedTimeRange.value);
    _tabController = TabController(length: 20, vsync: this, initialIndex: 18);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorsTheme.colorOfBox,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications,
                  color: ColorsTheme.colorTextDefault_10),
              tooltip: 'Notify',
              onPressed: () {},
            ),
            PopupMenuButton(
                icon: Icon(Icons.more_vert_rounded,
                    color: ColorsTheme.colorTextDefault_10),
                padding: const EdgeInsets.all(10.0),
                offset: Offset.fromDirection(40, 40),
                color: ColorsTheme.foregroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                elevation: 2,
                onSelected: (value) {
                  if (value == 'Search for transaction') {
                    showCupertinoModalBottomSheet(
                        isDismissible: false,
                        enableDrag: false,
                        context: context,
                        builder: (context) => Container()
                        // =>
                        //     SearchTransactionScreen(wallet: wallet)
                        );
                  } else if (value == 'change display') {
                    viewByCategory.value = !viewByCategory.value;
                  } else if (value == 'Adjust Balance') {
                    showCupertinoModalBottomSheet(
                        context: context, builder: (context) => Container()
                        // AdjustBalanceScreen(wallet: wallet)
                        );
                  } else if (value == 'Select time range') {
                    handleSelectTimeRange(choosedTimeRange.value);
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        value: 'Select time range',
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: ColorsTheme.colorOfBox),
                            const SizedBox(width: 10.0),
                            Text(
                              'Select time range',
                              style: textTheme().headline3,
                            ),
                          ],
                        )),
                    PopupMenuItem(
                        value: 'change display',
                        child: Row(
                          children: [
                            Icon(Icons.remove_red_eye,
                                color: ColorsTheme.colorOfBox),
                            const SizedBox(width: 10.0),
                            Text(
                              viewByCategory.value
                                  ? 'View by date'
                                  : 'View by category',
                              style: textTheme().headline3,
                            ),
                          ],
                        )),
                    PopupMenuItem(
                        value: 'Adjust Balance',
                        child: Row(
                          children: [
                            Icon(Icons.account_balance_wallet,
                                color: ColorsTheme.colorOfBox),
                            const SizedBox(width: 10.0),
                            Text(
                              'Adjust Balance',
                              style: textTheme().headline3,
                            ),
                          ],
                        )),
                    PopupMenuItem(
                        value: 'Search for transaction',
                        child: Row(
                          children: [
                            Icon(Icons.search, color: ColorsTheme.colorOfBox),
                            const SizedBox(width: 10.0),
                            Text(
                              'Search for transaction',
                              style: textTheme().headline3,
                            ),
                          ],
                        )),
                  ];
                })
          ],
          bottom: TabBar(
            labelStyle:
                textTheme().headline4!.copyWith(fontWeight: FontWeight.w600),
            unselectedLabelStyle: textTheme().headline4,
            unselectedLabelColor: ColorsTheme.colorTextGrey,
            labelColor: ColorsTheme.colorTextDefault_10,
            indicatorColor: Colors.grey,
            physics: const AlwaysScrollableScrollPhysics(),
            isScrollable: true,
            indicatorWeight: 3.0,
            controller: _tabController,
            tabs: myTabs,
          )),
    );
  }

  List<Tab> initTabBar(int choosedTimeRange, {var extraInfo}) {
    if (choosedTimeRange == 3) {
      return List.generate(20, (index) {
        var now = DateTime.now();
        if (index == 17) {
          return const Tab(
            text: 'LAST MONTH',
          );
        } else if (index == 18) {
          return const Tab(
            text: 'THIS MONTH',
          );
        } else if (index == 19) {
          return const Tab(
            text: 'FUTURE',
          );
        } else {
          var date = DateTime(now.year, now.month - (18 - index), now.day);
          String dateDisplay = DateFormat('MM/yyyy').format(date);
          return Tab(
            text: dateDisplay,
          );
        }
      });
    } else if (choosedTimeRange == 1) {
      return List.generate(20, (index) {
        var now = DateTime.now();
        if (index == 17) {
          return const Tab(
            text: 'YESTERDAY',
          );
        } else if (index == 18) {
          return const Tab(
            text: 'TODAY',
          );
        } else if (index == 19) {
          return const Tab(
            text: 'FUTURE',
          );
        } else {
          var date = DateTime(now.year, now.month, now.day - (18 - index));
          String dateDisplay = DateFormat('dd MMMM yyyy').format(date);
          return Tab(
            text: dateDisplay,
          );
        }
      });
    } else if (choosedTimeRange == 2) {
      return List.generate(20, (index) {
        if (index == 17) {
          return const Tab(
            text: 'LAST WEEK',
          );
        } else if (index == 18) {
          return const Tab(
            text: 'THIS WEEK',
          );
        } else if (index == 19) {
          return const Tab(
            text: 'FUTURE',
          );
        } else {
          var firstDateInAWeek = DateTime.now()
              .subtract(Duration(days: DateTime.now().weekday - 1))
              .subtract(Duration(days: 7 * (18 - index)));
          String firstDateDisplay =
              DateFormat('dd/MM').format(firstDateInAWeek);

          var lastDateInAWeek = firstDateInAWeek.add(const Duration(days: 6));
          String lastDateDisplay = DateFormat('dd/MM').format(lastDateInAWeek);

          return Tab(text: firstDateDisplay + ' - ' + lastDateDisplay);
        }
      });
    } else if (choosedTimeRange == 4) {
      var now = DateTime.now();
      int year = now.year;
      int initQuarter = ((now.month + 2) / 3).toInt();
      int k = 0;

      List<String> list = [];

      for (var i = 0; i < 20; i++) {
        var q = initQuarter - i + 4 * k + 1;
        list.add('Q$q $year');
        if (q == 1) {
          k = k + 1;
          year = year - 1;
        }
      }
      list = list.reversed.toList();

      return List.generate(20, (index) {
        if (index == 19) {
          return const Tab(
            text: 'FUTURE',
          );
        } else {
          // String dateDisplay = DateFormat('yyyy').format(date);
          String display = list[index];
          return Tab(
            text: display,
          );
        }
      });
    } else if (choosedTimeRange == 5) {
      return List.generate(20, (index) {
        var now = DateTime.now();
        if (index == 17) {
          return const Tab(
            text: 'LAST YEAR',
          );
        } else if (index == 18) {
          return const Tab(
            text: 'THIS YEAR',
          );
        } else if (index == 19) {
          return const Tab(
            text: 'FUTURE',
          );
        } else {
          var date = DateTime(now.year, now.month, now.day - (18 - index));
          String dateDisplay = DateFormat('yyyy').format(date);
          return Tab(
            text: dateDisplay,
          );
        }
      });
    } else if (choosedTimeRange == 6) {
      return List.generate(1, (index) {
        return const Tab(
          text: 'All transactions',
        );
      });
    } else {
      return List.generate(1, (index) {
        return Tab(
          text: extraInfo,
        );
      });
    }
  }

// xử lý khi thay đổi time range
  void handleSelectTimeRange(int selected) {
    showMenu(
      color: ColorsTheme.foregroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      elevation: 0.0,
      context: context,
      position: RelativeRect.fromLTRB(100, 55, 28, 0),
      items: [
        CheckedPopupMenuItem(
          checked: selected == 1 ? true : false,
          value: 1,
          child: Text(
            "Day",
            style: textTheme().headline4,
          ),
        ),
        CheckedPopupMenuItem(
          checked: selected == 2 ? true : false,
          value: 2,
          child: Text(
            "Week",
            style: textTheme().headline4,
          ),
        ),
        CheckedPopupMenuItem(
          checked: selected == 3 ? true : false,
          value: 3,
          child: Text(
            "Month",
            style: textTheme().headline4,
          ),
        ),
        CheckedPopupMenuItem(
          checked: selected == 4 ? true : false,
          value: 4,
          child: Text(
            "Quarter",
            style: textTheme().headline4,
          ),
        ),
        CheckedPopupMenuItem(
          checked: selected == 5 ? true : false,
          value: 5,
          child: Text(
            "Year",
            style: textTheme().headline4,
          ),
        ),
        CheckedPopupMenuItem(
          checked: selected == 6 ? true : false,
          value: 6,
          child: Text(
            "All",
            style: textTheme().headline4,
          ),
        ),
        CheckedPopupMenuItem(
          checked: selected == 7 ? true : false,
          value: 7,
          child: Text(
            "Custom",
            style: textTheme().headline4,
          ),
        ),
      ],
    ).then((value) async {
      switch (value) {
        case 1:
          setState(() {
            beginDate.clear();
            endDate.clear();
            int index = 0;
            var now = DateTime.now();
            for (; index < 20; index++) {
              var date = DateTime(now.year, now.month, now.day - (18 - index));
              beginDate.add(date);
              if (index < 19) {
                endDate.add(date);
              }
            }
            choosedTimeRange.value = 1;

            myTabs.value = initTabBar(choosedTimeRange.value);
            _tabController =
                TabController(length: 20, vsync: this, initialIndex: 18);
            _tabController.addListener(() {
              setState(() {});
            });
          });
          break;
        case 2:
          setState(() {
            beginDate.clear();
            endDate.clear();
            int index = 0;
            for (; index < 20; index++) {
              var firstDateInAWeek = DateTime.now()
                  .subtract(Duration(days: DateTime.now().weekday - 1))
                  .subtract(Duration(days: 7 * (18 - index)));
              beginDate.add(firstDateInAWeek);
              if (index < 19) {
                endDate.add(DateTime(
                  firstDateInAWeek.year,
                  firstDateInAWeek.month,
                  firstDateInAWeek.day + 6,
                ));
              }
            }
            choosedTimeRange.value = 2;
            myTabs.value = initTabBar(choosedTimeRange.value);
            _tabController =
                TabController(length: 20, vsync: this, initialIndex: 18);
            _tabController.addListener(() {
              setState(() {});
            });
          });
          break;
        case 3:
          setState(() {
            beginDate.clear();
            endDate.clear();
            int index = 0;
            var now = DateTime.now();
            for (; index < 20; index++) {
              var date = DateTime(now.year, now.month - (18 - index), 1);
              beginDate.add(date);
              if (index < 19) {
                endDate.add(DateTime(
                  beginDate[index].year,
                  beginDate[index].month + 1,
                  beginDate[index].day - 1,
                ));
              }
            }
            choosedTimeRange.value = 3;
            myTabs.value = initTabBar(choosedTimeRange.value);
            _tabController =
                TabController(length: 20, vsync: this, initialIndex: 18);
            _tabController.addListener(() {
              setState(() {});
            });
          });
          break;
        case 4:
          setState(() {
            beginDate.clear();
            endDate.clear();
            int index = 0;
            var now = DateTime.now();
            var initQuater = (now.month + 2) % 3;
            for (; index < 20; index++) {
              beginDate.add(DateTime(
                now.year,
                now.month - initQuater - (18 - index) * 3,
                1,
              ));
              if (index < 19) {
                endDate.add(DateTime(
                  beginDate[index].year,
                  beginDate[index].month + 3,
                  beginDate[index].day - 1,
                ));
              }
            }
            choosedTimeRange.value = 4;
            myTabs.value = initTabBar(choosedTimeRange.value);
            _tabController =
                TabController(length: 20, vsync: this, initialIndex: 18);
            _tabController.addListener(() {
              setState(() {});
            });
          });
          break;
        case 5:
          setState(() {
            beginDate.clear();
            endDate.clear();
            int index = 0;
            var now = DateTime.now();
            for (; index < 20; index++) {
              beginDate.add(DateTime(
                now.year - (18 - index),
                1,
                1,
              ));
              if (index < 19) {
                endDate.add(DateTime(
                  beginDate[index].year,
                  12,
                  31,
                ));
              }
            }
            choosedTimeRange.value = 5;
            myTabs.value = initTabBar(choosedTimeRange.value);
            _tabController =
                TabController(length: 20, vsync: this, initialIndex: 18);
            _tabController.addListener(() {
              setState(() {});
            });
          });
          break;
        case 6:
          setState(() {
            beginDate.clear();
            endDate.clear();
            choosedTimeRange.value = 6;
            myTabs.value = initTabBar(choosedTimeRange.value);
            _tabController =
                TabController(length: 1, vsync: this, initialIndex: 0);
            _tabController.addListener(() {
              setState(() {});
            });
          });
          break;
        case 7:
          beginDate.clear();
          endDate.clear();
          List<DateTime> timeRange = [];
          await showDialog(
              context: context,
              builder: (builder) {
                return Container();
                // CustomSelectTimeDialog();
              }).then((value) => timeRange = value);

          if (timeRange == null) return null;
          String displayTab = DateFormat('dd/MM/yyyy').format(timeRange[0]) +
              " - " +
              DateFormat('dd/MM/yyyy').format(timeRange[1]);
          beginDate.add(timeRange[0]);
          endDate.add(timeRange[1]);
          setState(() {
            choosedTimeRange.value = 7;
            myTabs.value =
                initTabBar(choosedTimeRange.value, extraInfo: displayTab);
            _tabController =
                TabController(length: 1, vsync: this, initialIndex: 0);
            _tabController.addListener(() {
              setState(() {});
            });
          });

          break;
      }
    });
  }
}
