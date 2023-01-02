import 'package:flutter/material.dart';
import 'package:flutter_graduation_thesis/app/ui/theme/app_colors.dart';

class BoxBorderListWidget extends StatelessWidget {
  const BoxBorderListWidget({Key? key, required this.listWidget})
      : super(key: key);
  final List<Widget> listWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              if (index == listWidget.length - 1) {
                return Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: listWidget[index],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8), bottom: Radius.circular(8))),
                );
              }
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: listWidget[index],
                ),
                decoration: BoxDecoration(
                    color: ColorsTheme.colorOfBox,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8))),
              );
            } else if (index == listWidget.length - 1) {
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: listWidget[index],
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8))),
              );
            }
            return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: listWidget[index],
                ),
                color: Colors.white);
          },
          separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  height: 0,
                  thickness: 1,
                ),
              ),
          itemCount: listWidget.length),
    );
  }
}
