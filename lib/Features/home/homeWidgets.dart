import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertask/Features/home/Controller/homeControllerImp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/tasksModel.dart';

// ignore: must_be_immutable
class TimerWidget extends ConsumerStatefulWidget {
  String id;
  int seconds;
  TimerWidget({super.key, required this.id, required this.seconds});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  late int endTime;
  late int elapsedTime;
  bool isStarted = false;
  Timer time = Timer(const Duration(), (() {}));
  String hour = "";
  String min = "";
  String sec = "";
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

  String formatToHourMinSec(
    int value,
  ) {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: isStarted
                  ? () {
                      startAndStopTimer(start: false);
                      ref.read(timeUpdateProvider(TimerModel(
                          hour: int.parse(hour),
                          id: widget.id,
                          min: int.parse(min),
                          sec: int.parse(sec))));
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
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  formatToHourMinSec(widget.seconds),
                  style: GoogleFonts.aBeeZee(
                      color: Theme.of(context).primaryColor,
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
