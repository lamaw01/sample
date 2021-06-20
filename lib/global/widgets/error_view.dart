import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key, this.message})
      : assert(message != null, 'Message must not be null.'),
        super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$message'),
    );
  }
}
