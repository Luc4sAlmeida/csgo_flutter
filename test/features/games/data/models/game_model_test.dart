import 'dart:convert';

import 'package:csgo_flutter/features/games/data/models/game_model.dart';
import 'package:csgo_flutter/features/games/domain/entities/game.dart';
import 'package:csgo_flutter/features/games/domain/entities/team.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tGameModel = GameModel(
    event: "UNITED Pro Series Winter 2020",
    maps: "bo3",
    team1: Team(
      name: "SPARX",
      crest :"https://img-cdn.hltv.org/teamlogo/zQUPdUEf_wQgLO-QhDxQ64.svg?ixlib=java-2.1.0&s=6385d292e2432df8c82991b1ed3a3fa3",
      result :0
    ),
    team2: Team(
        name: "ttc",
        crest: "https://img-cdn.hltv.org/teamlogo/Nsu3Bx5jLmrJzFAYSX7yvS.png?ixlib=java-2.1.0&s=f2fcae9a54190745e217c476fd644eb0",
        result: 2
    ),
    matchId :"/matches/2346069/sparx-vs-ttc-united-pro-series-winter-2020"
  );

  test(
    'should be a subclass of Game entitie', 
    () async {
      //assert
      expect(tGameModel, isA<Game>());
    }
  );

  group('fromJson', () {
    test('should return a valid model when JSON is provided', () async {
      //arrange
      final Map<String, dynamic> json = jsonDecode(fixture('game.json'));

      //act
      final result = GameModel.fromJson(json);

      //assert
      expect(result, tGameModel);
    });
  });
}