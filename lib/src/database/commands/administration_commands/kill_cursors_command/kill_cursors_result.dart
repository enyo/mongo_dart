import 'package:mongo_dart/src/database/commands/mixin/basic_result.dart';
import 'package:mongo_dart/src/database/utils/map_keys.dart';

class KillCursorsResult with BasicResult {
  KillCursorsResult(Map<String, Object?> document) {
    extractBasic(document);
    List docs = document[keyCursorsKilled] as List<dynamic>? ?? [];
    if (docs.isNotEmpty) {
      cursorsKilled = <int>[];
    }
    for (var cursorKilled in docs) {
      cursorsKilled!.add(cursorKilled);
    }
    docs = document[keyCursorsNotFound] as List<dynamic>? ?? [];
    if (docs.isNotEmpty) {
      cursorsNotFound = <int>[];
    }
    for (var cursorNotFound in docs) {
      cursorsNotFound.add(cursorNotFound);
    }
    docs = document[keyCursorsAlive] as List<dynamic>? ?? [];
    if (docs.isNotEmpty) {
      cursorsAlive = <int>[];
    }
    for (var cursorAlive in docs) {
      cursorsAlive!.add(cursorAlive);
    }
    docs = document[keyCursorsUnknown] as List<dynamic>? ?? [];
    if (docs.isNotEmpty) {
      cursorsUnknown = <int>[];
    }
    for (var cursorUnknown in docs) {
      cursorsUnknown!.add(cursorUnknown);
    }
  }

  List<int>? cursorsKilled;
  late List<int> cursorsNotFound;
  List<int>? cursorsAlive;
  List<int>? cursorsUnknown;
}
