import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class bottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  bottomTabs({this.selectedTab, this.tabPressed});
  @override
  _bottomTabsState createState() => _bottomTabsState();
}

class _bottomTabsState extends State<bottomTabs> {
  int _selected = 0;

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Warning"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _selected = widget.selectedTab ?? 0;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1.0,
              blurRadius: 30.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomTabBtn(
            imagePath: 'assets/images/tab_home.png',
            selected: _selected == 0 ? true : false,
            onPressed: () {
              widget.tabPressed(0);
            },
          ),
          bottomTabBtn(
            imagePath: 'assets/images/tab_search.png',
            selected: _selected == 1 ? true : false,
            onPressed: () {
              widget.tabPressed(1);
            },
          ),
          bottomTabBtn(
            imagePath: 'assets/images/tab_saved.png',
            selected: _selected == 2 ? true : false,
            onPressed: () {
              widget.tabPressed(2);
            },
          ),
          bottomTabBtn(
            imagePath: 'assets/images/tab_logout.png',
            selected: _selected == 3 ? true : false,
            onPressed: () {
              _alertDialogBuilder('Do you want to Logout ?');
            },
          ),
        ],
      ),
    );
  }
}

class bottomTabBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  const bottomTabBtn({this.imagePath, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 22.0,
          horizontal: 22.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: _selected ? Theme.of(context).accentColor : Colors.transparent,
          width: 2.0,
        ))),
        child: Image(
          image: AssetImage(
            imagePath ?? 'assets/images/tab_home.png',
          ),
          width: 22.0,
          height: 22.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
