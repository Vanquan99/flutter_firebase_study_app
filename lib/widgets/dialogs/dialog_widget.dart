import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaLogs {
  static final DiaLogs _singleton = DiaLogs._internal();
  DiaLogs._internal();

  factory DiaLogs() {
    return _singleton;
  }

  static Widget questionStartDialog(
      {required VoidCallback onTapConfirm, VoidCallback? onTapCancel}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Hi...',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text('Please login before you start')
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: onTapCancel, child: const Text('Cancel')),
        TextButton(onPressed: onTapConfirm, child: const Text('Confirm')),
      ],
    );
  }
}
