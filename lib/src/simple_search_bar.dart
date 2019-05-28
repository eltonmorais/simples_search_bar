import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget{

  final Color statusBarColor;
  final Color primaryColor;
  final bool autoSelected;
  final AppBar mainAppBar;
  final Color mainTextColor;

  SearchAppBar({
    @required this.primaryColor,
    this.mainTextColor = Colors.white,
    this.statusBarColor,
    this.autoSelected = false,
    @required this.mainAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return null;
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
              print("try to close");
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