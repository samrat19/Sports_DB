import 'package:flutter/material.dart';

class WatchStream extends StatelessWidget {
  final Stream stream;
  final Function onStreaming;
  final Widget onStreamWait;
  final Widget onStreamError;

  const WatchStream({
    Key key,
    this.stream,
    @required this.onStreaming,
    @required this.onStreamWait,
    @required this.onStreamError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      initialData: onStreamWait,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return onStreaming(context, snapshot.data);
        } else{
          return onStreamError;
        }
      },
    );
  }
}
