import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Providers/provider.dart';
import '../model/tasksModel.dart';

// ignore: must_be_immutable
class TimerWidget extends ConsumerStatefulWidget {
  String id;
  int seconds;
  TimerWidget({super.key, required this.id, required this.seconds});


   static String formatToHourMinSec(
    int value,
  ) {
    String hour = "";
    String min = "";
    String sec = "";
    sec = (value % 60).toString();
    min = (value / 60).toStringAsFixed(5);
    hour = (value / 3600).toStringAsFixed(5);
    if (sec.length == 1) {
      sec = '0$sec';
    }

    if (min[1] == '.') {
      min = min.substring(0, 1);
    }
    if (hour[1] == '.') {
      hour = hour.substring(0, 1);
    }
    return "$hour : $min : $sec";
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  late int endTime;
  late int elapsedTime;
  bool isStarted = false;
  Timer time = Timer(const Duration(), (() {}));

  void startAndStopTimer({required bool start}) {
    if (start) {
      setState(() {
        isStarted = true;
      });
      time = Timer.periodic(const Duration(seconds: 1), (timer) {
        widget.seconds++;

        setState(() {});
      });
    }
    if (!start) {
      setState(() {
        isStarted = false;
      });
      time.cancel();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: isStarted
                  ? () {
                      startAndStopTimer(start: false);
                      ref.read(timeUpdateProvider(
                          TimerModel(id: widget.id, sec: widget.seconds)));
                    }
                  : () {
                      startAndStopTimer(start: true);
                    },
              child: Icon(
                isStarted ? Icons.pause : Icons.play_circle,
                size: 30,
                color: isStarted ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                 TimerWidget.formatToHourMinSec(widget.seconds),
                  style: GoogleFonts.aBeeZee(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
