import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:mobileapp/common/theme/color.dart';

class ProgressBarCustom extends StatefulWidget {
  final Duration? position;
  final Duration? duration;
   ProgressBarCustom({
    Key? key,
     this.position,
     this.duration,
  }) : super(key: key);

  @override
  _ProgressBarCustomState createState() => _ProgressBarCustomState();
}

class _ProgressBarCustomState extends State<ProgressBarCustom> {

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes);
    String twoDigitSeconds = twoDigits(duration.inSeconds);    
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 40,        
        alignment: Alignment.center,
        child: Text(
            _formatDuration(widget.position ?? Duration()),
            style: TextStyle(color: GREY_20)),
      ),
      LinearPercentIndicator(
        width: size.width - 153,        
        lineHeight: 5.0,        
        addAutomaticKeepAlive: false,        
        animateFromLastPercent: true,

        percent: (widget.position != null && widget.duration != null) ? (widget.position!.inSeconds / widget.duration!.inSeconds) : 0,
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: OLIVE,
      ),
      Container(
        width: 40,        
        alignment: Alignment.center,
        child: Text(
           _formatDuration(widget.duration ?? Duration()),
            style: TextStyle(color: GREY_20)),
      )
    ]));
  }
}
