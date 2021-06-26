import 'package:flutter/material.dart';
import 'package:progress_timeline/progress_timeline.dart';

class ProgressTimeLine extends StatefulWidget {
  // ProgressTimeLine({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _ProgressTimeLineState createState() => _ProgressTimeLineState();
}

class _ProgressTimeLineState extends State<ProgressTimeLine> {
  ProgressTimeline screenProgress;

  List<SingleState> allStages = [
    SingleState(stateTitle: "Stage 1"),
    SingleState(stateTitle: "Stage 2"),
    SingleState(stateTitle: "Stage 3"),
  ];

  @override
  void initState() {
    screenProgress = new ProgressTimeline(
      checkedIcon: Icon(Icons.circle, color: Colors.teal,),
      currentIcon: Icon(Icons.circle, color: Colors.teal,),
      uncheckedIcon: Icon(Icons.brightness_1_outlined, color: Colors.teal,),
      connectorColor: Colors.teal,
      states: allStages,
      iconSize: 30,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: screenProgress,

    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
