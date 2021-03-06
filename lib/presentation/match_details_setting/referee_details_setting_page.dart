import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepakjudge/constants.dart';
import 'package:sepakjudge/domain/match.dart';
import 'package:sepakjudge/presentation/match_details_setting/match_details_setting_model.dart';
import 'package:sepakjudge/presentation/point_counting/point_counting_page.dart';
import 'package:sepakjudge/utils/dialog_utils.dart';

class RefereeDetailsPage extends StatelessWidget {
  RefereeDetailsPage(this.match, this.index);
  Match match;
  int index;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MatchDetailsSettingModel>(
      create: (_) =>
          MatchDetailsSettingModel(match: match, index: index)..init(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<MatchDetailsSettingModel>(
            builder: (context, model, child) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '試合番号',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  //チーム名用のテキストフィールド
                  TextField(
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '試合番号',
                    ),
                    controller: model.matchNameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'コート名',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  //チーム名用のテキストフィールド
                  TextField(
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'コート名',
                    ),
                    controller: model.courtNameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '主審',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  //チーム名用のテキストフィールド
                  TextField(
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'チーム名',
                    ),
                    controller: model.chiefRefereeController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '副審',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  //チーム名用のテキストフィールド
                  TextField(
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'チーム名',
                    ),
                    controller: model.assistantRefereeController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'サーブ権',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  //チーム名用のテキストフィールド
                  TextField(
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    autofocus: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ServiceTeam',
                    ),
                    controller: model.serviceTeamController,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      model.showServicePicker(
                        context,
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                      child: Text(kTextGameStart),
                      onPressed: () {
                        model.register(context);
                        model.startGame(context);
                      }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
