import 'package:flutter/material.dart';
import 'app_bar_controller.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color statusBarColor;
  final Color primary;
  final bool autoSelected;
  final AppBar mainAppBar;
  final Color mainTextColor;
  final String searchHint;
  final AppBarController appBarController;
  final Function(String search) onChange;
  final double searchFontSize;

  SearchAppBar({
    @required this.primary,
    this.mainTextColor = Colors.white,
    this.statusBarColor,
    this.autoSelected = false,
    this.searchHint = "Search here...",
    @required this.mainAppBar,
    @required this.appBarController,
    @required this.onChange,
    this.searchFontSize = 20,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(60.0);
  }

  Widget build(BuildContext context) {
    // appBarController.stream.add(autoSelected);

    return StreamBuilder(
      stream: appBarController.stream.stream,
      builder: (BuildContext context, AsyncSnapshot<bool> snap) {
        bool _show = autoSelected;

        if (snap.hasData) {
          _show = snap.data;
        }

        if (_show) {
          return searchAppBar(
            context: context,
          );
        } else {
          return showMainAppBar();
        }
      },
    );
  }

  Widget showMainAppBar() {
    return mainAppBar;
  }

  Widget searchAppBar({@required BuildContext context}) {
    return AppBar(
      leading: InkWell(
        child: Icon(
          Icons.close,
          color: mainTextColor,
        ),
        onTap: () {
          appBarController.stream.add(false);
          onChange('');
        },
      ),
      backgroundColor: primary,
      title: Container(
        child: TextField(
          autofocus: true,
          onChanged: (String value) {
            onChange(value);
          },
          style: TextStyle(
            fontSize: searchFontSize,
            color: mainTextColor,
          ),
          cursorColor: mainTextColor,
          decoration: InputDecoration(
            hintText: searchHint,
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: mainTextColor.withAlpha(100),
            ),
            suffixIcon: Icon(
              Icons.search,
              color: mainTextColor.withAlpha(100),
            ),
          ),
        ),
      ),
    );
  }
}
