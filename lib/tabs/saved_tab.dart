import 'package:ecommerce/widgets/customActionBar.dart';
import 'package:flutter/material.dart';

class SavedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text('saved_tab'),
          ),
          CustomActionBar(
            title: 'saved',
            hasBackArrow: false
          ),
        ],
      ),
    );
  }
}
