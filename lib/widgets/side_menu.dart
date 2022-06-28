import 'package:flutter/material.dart';
import 'package:flutter_web_project/constants/controllers.dart';
import 'package:flutter_web_project/constants/style.dart';
import 'package:flutter_web_project/helpers/responsiveness.dart';
import 'package:flutter_web_project/routing/routes.dart';
import 'package:flutter_web_project/widgets/custom_text.dart';
import 'package:flutter_web_project/widgets/side_menu_items.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    const Flexible(
                        child: CustomText(
                      text: "Dash",
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: active,
                    )),
                    SizedBox(
                      width: _width / 48,
                    ),
                  ],
                ),
                Divider(
                  color: lightGrey.withOpacity(0.1),
                ),
              ],
            ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                    itemName: itemName == authenticationPageRoute
                        ? "Log out"
                        : itemName,
                    onTap: () {
                      if (itemName == authenticationPageRoute) {
                        //TODO:: go to authentication page
                      }

                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveitemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                          // TODO :: go to item name route
                        }
                      }
                    }))
                .toList(),
          ),
        ],
      ),
    );
  }
}
