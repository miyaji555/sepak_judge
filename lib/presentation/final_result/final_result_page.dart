import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepakjudge/domain/file_manage.dart';
import 'package:sepakjudge/domain/match.dart';
import 'package:sepakjudge/presentation/main/main.dart';

import 'final_result_model.dart';

class FinalResultPage extends StatelessWidget {
  FinalResultPage(this.match);
  final Match match;
  final fileManage = FileManage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      home: ChangeNotifierProvider<FinalResultModel>(
        create: (_) => FinalResultModel(match), //mainmodelを作成
        child: Scaffold(
          appBar: AppBar(
            title: Text('result'),
          ),
          body: Consumer<FinalResultModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(model.match.aTeamName,
                              style: TextStyle(
                                fontSize: 50,
                              )),
                          Text(model.match.bTeamName,
                              style: TextStyle(
                                fontSize: 50,
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        for (int i = 0; i < 3; i++) //set毎の結果を表示する
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                '${match.aScore[i]}',
                                style: Theme.of(context).textTheme.display1,
                              ),
                              Text(
                                "${model.match.bScore[i]}",
                                style: Theme.of(context).textTheme.display1,
                              ),
                            ],
                          ),
                      ],
                    ),
                    if (model.match.winner == 1)
                      Text(
                        '${model.match.aTeamName} WIN',
                        style: TextStyle(fontSize: 50),
                      ),
                    if (model.match.winner == -1)
                      Text(
                        '${model.match.bTeamName} WIN',
                        style: TextStyle(fontSize: 50),
                      ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                            child: Text('出力'),
                            onPressed: () {
                              fileManage.setFileName(match);
                              fileManage.setOutText(match);
                              fileManage.outButton();
                            },
                          ),
                          RaisedButton(
                            child: Text('final Result'),
                            onPressed: () {
                              fileManage.share();
                              model.setNextMatch();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
                              );
                              fileManage.loadButton();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
