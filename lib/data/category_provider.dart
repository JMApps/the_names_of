import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

class QuizCategories {
  int? id;
  String? categoryName;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      '_id': id,
      'category_name': categoryName,
    };
    return map;
  }

  QuizCategories();

  QuizCategories.fromMap(Map<String, dynamic> map) {
    id = map['_id'];
    categoryName = map['category_name'];
  }
}

class CategoryProvider {
  Future<QuizCategories?> getQuizCategoryById(Database db, int id) async {
    var maps = await db.query('Table_of_quiz_categories',
        columns: [
          '_id',
          'category_name',
        ],
        where: '_id = ?',
        whereArgs: [id]);
    if (maps.length > 0) return QuizCategories.fromMap(maps.first);
    return null;
  }

  Future<List<QuizCategories>?> getQuizCategories(Database db) async {
    var maps = await db.query(
      'Table_of_quiz_categories',
      columns: [
        '_id',
        'category_name',
      ],
    );
    if (maps.length > 0) {
      return maps.map((category) => QuizCategories.fromMap(category)).toList();
    } else {
      return null;
    }
  }
}

class CategoryList extends StateNotifier<List<QuizCategories>?> {
  CategoryList(List<QuizCategories> state) : super(state);

  addAll(List<QuizCategories> categories) {
    state!.addAll(categories);
  }

  add(QuizCategories category) {
    state = [
      ...state!,
      category,
    ];
  }
}
