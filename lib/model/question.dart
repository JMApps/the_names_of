class Question {
  int? id, answer;
  String? question;
  List<String>? options;

  Question({this.id, this.answer, this.question, this.options});

  static const List sample_data = [
    {
      'id': 1,
      'question': 'Вопрос 1',
      'options': [
        'Вариант ответа 1',
        'Вариант ответа 2',
        'Вариант ответа 3',
        'Вариант ответа 4'
      ],
      'answer_index': 1
    },
    {
      'id': 1,
      'question': 'Вопрос 2',
      'options': [
        'Вариант ответа 5',
        'Вариант ответа 6',
        'Вариант ответа 7',
        'Вариант ответа 8'
      ],
      'answer_index': 3
    },
    {
      'id': 1,
      'question': 'Вопрос 3',
      'options': [
        'Вариант ответа 9',
        'Вариант ответа 10',
        'Вариант ответа 11',
        'Вариант ответа 12'
      ],
      'answer_index': 1
    },
    {
      'id': 1,
      'question': 'Вопрос 4',
      'options': [
        'Вариант ответа 13',
        'Вариант ответа 14',
        'Вариант ответа 15',
        'Вариант ответа 16'
      ],
      'answer_index': 4
    },
    {
      'id': 1,
      'question': 'Вопрос 5',
      'options': [
        'Вариант ответа 17',
        'Вариант ответа 18',
        'Вариант ответа 19',
        'Вариант ответа 20'
      ],
      'answer_index': 2
    },
  ];
}
