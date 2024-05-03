import 'package:flutter/material.dart';

import '../../data/repositories/book_content_data_repository.dart';
import '../../domain/usecases/book_content_use_case.dart';

class MainDataState extends ChangeNotifier {
  final _bookContentUseCase = BookContentUseCase(BookContentDataRepository());

  BookContentUseCase get getBookContentUseCase => _bookContentUseCase;
}