import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_names_of/data/category_provider.dart';

final categoryListProvider = StateNotifierProvider((ref) => CategoryList([]));
final questionCategoryState = StateProvider((ref) => QuizCategories());