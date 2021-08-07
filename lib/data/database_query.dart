import 'package:the_names_of/data/database_helper.dart';
import 'package:the_names_of/model/name_item.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<NameItem>> getAllNames() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_names');
    List<NameItem>? allNames = res.isNotEmpty ? res.map((c) => NameItem.fromMap(c)).toList() : null;
    return allNames!;
  }

  Future<List<NameItem>> getFavoriteNames() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_names', where: 'favorite == 0');
    List<NameItem>? favoriteNames = res.isNotEmpty ? res.map((c) => NameItem.fromMap(c)).toList() : null;
    return favoriteNames!;
  }
}