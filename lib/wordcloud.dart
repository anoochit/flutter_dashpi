import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

class WordCloudBox extends StatelessWidget {
  const WordCloudBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[];

    int i = 0;
    nouns.take(50).forEach((word) {
      widgets.add(
          ScatterItem(word, Random().nextInt(200), Random().nextBool(), i));
      i++;
    });

    return Center(
      child: FittedBox(
        child: Scatter(
          fillGaps: true,
          delegate: ArchimedeanSpiralScatterDelegate(ratio: 2.0),
          children: widgets,
        ),
      ),
    );
    ;
  }
}

class ScatterItem extends StatelessWidget {
  ScatterItem(this.hashtag, this.size, this.rotated, this.index);
  final String hashtag;
  final int size;
  final bool rotated;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: size.toDouble(),
          color: Colors.blue,
        );
    return RotatedBox(
      quarterTurns: rotated ? 1 : 0,
      child: Text(
        hashtag,
        style: style,
      ),
    );
  }
}
