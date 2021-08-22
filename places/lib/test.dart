import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          splashColor: Colors.green,
          highlightColor: Colors.orange,
          child: Container(
            padding: EdgeInsets.all(50),
            child: Text('Button'),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
