import 'package:flutter/material.dart';
import 'package:duration_button/duration_button.dart';

class AutoClickButton {
  static automaticTaskWorker(
      {required BuildContext context,
      required Duration taskWaitDuration,
      required Function()? task}) {
    return DurationButton(
      onPressed: () {},
      width: 1,
      height: 1,
      coverColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      duration: taskWaitDuration,
      onComplete: task,
      child: Container(),
    );
  }
}
