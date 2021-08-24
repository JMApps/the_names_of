import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_names_of/data/quiz_category_provider.dart';
import 'package:the_names_of/model/user_answer_model.dart';

final categoryListProvider = StateNotifierProvider((ref) => CategoryList([]));
final questionCategoryState = StateProvider((ref) => QuizCategories());
final userListAnswer = StateProvider((ref) => <UserAnswer>[]);
final isTestMode = StateProvider((ref) => false);
final currentReadPage = StateProvider((ref) => 0);
final userAnswerSelected = StateProvider((ref) => UserAnswer());
final isEnableShowAnswer = StateProvider((ref) => false);