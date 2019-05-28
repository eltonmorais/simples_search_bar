import 'package:flutter/material.dart';
import 'app_bar_controller.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color statusBarColor;
  final Color primary;
  final bool autoSelected;
  final AppBar mainAppBar;
  final Color mainTextColor;
  final AppBarController appBarController;

  SearchAppBar({
    @required this.primary,
    this.mainTextColor = Colors.white,
    this.statusBarColor,
    this.autoSelected = false,
    @required this.mainAppBar,
    @required this.appBarController,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(20.0);
  }

  Widget build(BuildContext context) {
    appBarController.stream.add(autoSelected);

    return StreamBuilder(
      stream: appBarController.stream.stream,
      builder: (BuildContext context, AsyncSnapshot<bool> snap) {
        bool _local = false;

        if (snap.hasData) {
          _local = snap.data;
        }

        if (_local) {
          return searchAppBar();
        } else {
          return showMainAppBar();
        }
      },
    );
  }

  Widget showMainAppBar() {
    return mainAppBar;
  }

  Widget searchAppBar({BuildContext context}) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            color: statusBarColor != null ? statusBarColor : primary,
          ),
        ),
        AppBar(
          leading: InkWell(
            child: Icon(Icons.close),
            onTap: () {
              appBarController.stream.add(false);
            },
          ),
          backgroundColor: primary,
          title: TextField(),
        ),
      ],
    );
  }
}
