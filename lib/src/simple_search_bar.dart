import 'package:flutter/material.dart';
import 'app_bar_controller.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Color statusBarColor;
  final Color primaryColor;
  final bool autoSelected;
  final AppBar mainAppBar;
  final Color mainTextColor;
  final AppBarController appBarController;

  SearchAppBar({
    @required this.primaryColor,
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

    if(appBarController.state){
      return searchAppBar();
    }else{
      return showMainAppBar();
    }
  }

  Widget showMainAppBar(){
    return mainAppBar;
  }

  Widget searchAppBar({BuildContext context}){
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            color: statusBarColor != null
              ? statusBarColor
              : primaryColor,
          ),
        ),
        AppBar(
          leading: InkWell(
            child: Icon(Icons.close),
            onTap: (){
              appBarController.stream.add(false);
            },
          ),
          backgroundColor: primaryColor,
          title: TextField(
            
          ),
        ),
      ],
    );
  }
}