import 'dart:async';
import 'package:crocco_dashpi/donutautolabelchart.dart';
import 'package:crocco_dashpi/pointlinechart.dart';
import 'package:crocco_dashpi/wordcloud.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.white),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    const oneSec = const Duration(seconds: 5);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {});
    });
    super.initState();
  }

  Widget buildPieChart(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width / 4,
        child: DonutAutoLabelChart.withSampleData());
  }

  Widget buildWordCloud(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width / 3,
      child: WordCloudBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.black)),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.5 - 112,
                width: MediaQuery.of(context).size.width,
                child: PointsLineChart.withSampleData()),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildWordCloud(context),
                buildPieChart(context),
                buildPieChart(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WordCloud {
  String text;
  int size;

  WordCloud(this.text, this.size);
}
