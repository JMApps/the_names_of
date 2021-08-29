class QuestionArabic {
  int? id, answer;
  String? question;
  List<String>? options;

  QuestionArabic({this.id, this.answer, this.question, this.options});

  static const List sample_data = [
    {
      '_id': 1,
      'question': 'المَجِيدُ',
      'options': [
        'Последний',
        'Мягкий, Добрый',
        'Славный',
        'Достохвальный',
      ],
      'answer_index': 2,
    },
    {
      '_id': 2,
      'question': 'الأَحَدُ',
      'options': [
        'Живой',
        'Единственный',
        'Великий',
        'Единый',
      ],
      'answer_index': 3,
    },
    {
      '_id': 3,
      'question': 'الوَدُودُ',
      'options': [
        'Любящий, Любимый',
        'Возвышенный',
        'Видящий',
        'Высочайший',
      ],
      'answer_index': 0,
    },
    {
      '_id': 4,
      'question': '(3) المُقْتَدِرُ',
      'options': [
        'Могущественный',
        'Выдвигающий вперед',
        'Истинный',
        'Всемогущий',
      ],
      'answer_index': 3,
    },
    {
      '_id': 5,
      'question': 'الإِلَهُ',
      'options': [
        'Разъясняющий',
        'Бог',
        'Первосоздатель небес и земли',
        'Наставляющий',
      ],
      'answer_index': 1,
    },
    {
      '_id': 6,
      'question': 'الكَرِيمُ',
      'options': [
        'Справедливый Судья',
        'Простирающий',
        'Великодушный',
        'Господин, Покровитель',
      ],
      'answer_index': 2,
    },
    {
      '_id': 7,
      'question': 'الحَقُّ',
      'options': [
        'Исцеляющий',
        'Истинный',
        'Отбрасывающий назад',
        'Всевышний',
      ],
      'answer_index': 1,
    },
    {
      '_id': 8,
      'question': 'الآخِرُ',
      'options': [
        'Первый',
        'Всесильный',
        'Стыдливый',
        'Последний',
      ],
      'answer_index': 3,
    },
    {
      '_id': 9,
      'question': 'المُبِينُ',
      'options': [
        'Разъясняющий',
        'Господин, Покровитель',
        'Дарующий пропитание, Наблюдающий',
        'Знающий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 10,
      'question': 'الكَبِيرُ',
      'options': [
        'Аллах',
        'Большой',
        'Обладающий величием и великодушием',
        'Удерживающий, Сжимающий',
      ],
      'answer_index': 1,
    },
    {
      '_id': 11,
      'question': 'الرَّفِيقُ',
      'options': [
        'Дарующий, Щедрый',
        'Мягкий, Добрый',
        'Наделяющий уделом',
        'Самый великодушный',
      ],
      'answer_index': 1,
    },
    {
      '_id': 12,
      'question': '(2) القَهَّارُ',
      'options': [
        'Всемогущий',
        'Наблюдающий',
        'Всесильный',
        'Вседержитель',
      ],
      'answer_index': 0,
    },
    {
      '_id': 13,
      'question': 'نُورُ السَّمَوَاتِ وَالأَرْضِ',
      'options': [
        'Первосоздатель небес и земли',
        'Свет небес и земли',
        'Дарующий пропитание, Наблюдающий',
        'Судия, Раскрывающий, Дарующий победу',
      ],
      'answer_index': 1,
    },
    {
      '_id': 14,
      'question': 'المُؤْمِنُ',
      'options': [
        'Оберегающий, Дарующий безопасность',
        'Собирающий людей',
        'Помощник, Защитник',
        'Одолевающий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 15,
      'question': 'السَّلَامُ',
      'options': [
        'Могучий, Выправляющий, Подчиняющий',
        'Сострадательный',
        'Обладающий властью',
        'Пречистый, Дарующий мир и благополучие',
      ],
      'answer_index': 3,
    },
    {
      '_id': 16,
      'question': 'الخَلَّاقُ',
      'options': [
        'Создатель',
        'Созидатель',
        'Живой',
        'Богатый',
      ],
      'answer_index': 1,
    },
    {
      '_id': 17,
      'question': 'الرَّقِيبُ',
      'options': [
        'Наблюдающий',
        'Всесильный',
        'Славный',
        'Добродетельный',
      ],
      'answer_index': 0,
    },
    {
      '_id': 18,
      'question': 'الرَّازِقُ',
      'options': [
        'Гордый',
        'Царь',
        'Кормилец',
        'Дарующий',
      ],
      'answer_index': 2,
    },
    {
      '_id': 19,
      'question': 'ذُو الجَلَالِ وَالإِكْرَامِ',
      'options': [
        'Оберегающий, Дарующий безопасность',
        'Крепкий, Несокрушимый',
        'Покрывающий, Защищающий',
        'Обладающий величием и великодушием',
      ],
      'answer_index': 3,
    },
    {
      '_id': 20,
      'question': 'مَالِكُ المُلْكِ',
      'options': [
        'Собирающий людей',
        'Дарующий облик',
        'Обладающий властью',
        'Вседержитель',
      ],
      'answer_index': 2,
    },
    {
      '_id': 21,
      'question': 'الرَّحْمٰنُ',
      'options': [
        'Милостивый',
        'Прощающий',
        'Властелин',
        'Создатель',
      ],
      'answer_index': 0,
    },
    {
      '_id': 22,
      'question': 'بَدِيعُ السَّمَوَاتِ وَالأَرْضِ',
      'options': [
        'Обладающий величием и великодушием',
        'Первосоздатель небес и земли',
        'Могучий, Выправляющий, Подчиняющий',
        'Проницательный, Добрый',
      ],
      'answer_index': 1,
    },
    {
      '_id': 23,
      'question': 'اللَّطِيفُ',
      'options': [
        'Самодостаточный',
        'Одаряющий',
        'Близкий',
        'Проницательный, Добрый',
      ],
      'answer_index': 3,
    },
    {
      '_id': 24,
      'question': 'الحَكِيمُ',
      'options': [
        'Принимающий покаяния',
        'Могущественный',
        'Простирающий',
        'Мудрый',
      ],
      'answer_index': 3,
    },
    {
      '_id': 25,
      'question': 'الله',
      'options': [
        'Превознесшийся',
        'Мудрый',
        'Аллах',
        'Прекрасный',
      ],
      'answer_index': 2,
    },
    {
      '_id': 26,
      'question': '(1) الحَفِيظُ',
      'options': [
        'Хранитель',
        'Мудрый',
        'Богатый',
        'Могучий, Способный',
      ],
      'answer_index': 0,
    },
    {
      '_id': 27,
      'question': 'الهَادِي',
      'options': [
        'Требующий отчета',
        'Наставляющий',
        'Достохвальный',
        'Объемлющий',
      ],
      'answer_index': 1,
    },
    {
      '_id': 28,
      'question': 'المَوْلَى',
      'options': [
        'Стыдливый',
        'Одаряющий',
        'Господин, Покровитель',
        'Помощник, Защитник',
      ],
      'answer_index': 2,
    },
    {
      '_id': 29,
      'question': 'المُعْطِي',
      'options': [
        'Одаряющий',
        'Первосоздатель небес и земли',
        'Живой',
        'Собирающий людей',
      ],
      'answer_index': 0,
    },
    {
      '_id': 30,
      'question': 'العَلِيمُ',
      'options': [
        'Превознесшийся',
        'Знающий',
        'Мудрый',
        'Хранитель',
      ],
      'answer_index': 1,
    },
    {
      '_id': 31,
      'question': 'الغَفُورُ',
      'options': [
        'Всепрощающий',
        'Ведающий',
        'Прощающий',
        'Первый',
      ],
      'answer_index': 2,
    },
    {
      '_id': 32,
      'question': 'الأَعْلَى',
      'options': [
        'Всемогущий (3)',
        'Свидетель',
        'Дарующий',
        'Всевышний',
      ],
      'answer_index': 3,
    },
    {
      '_id': 33,
      'question': 'الرَّؤُوفُ',
      'options': [
        'Достаточный',
        'Сострадательный',
        'Господь',
        'Требующий отчета',
      ],
      'answer_index': 1,
    },
    {
      '_id': 34,
      'question': 'العَزِيزُ',
      'options': [
        'Могущественный',
        'Превознесшийся',
        'Принимающий покаяния',
        'Справедливый Судья',
      ],
      'answer_index': 0,
    },
    {
      '_id': 35,
      'question': 'السَّيِّدُ',
      'options': [
        'Господин',
        'Всесильный',
        'Выдержанный',
        'Близкий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 36,
      'question': 'الْبَاطِنُ',
      'options': [
        'Большой',
        'Признательный',
        'Ближайший',
        'Благодарный',
      ],
      'answer_index': 2,
    },
    {
      '_id': 37,
      'question': 'المُقِيتُ',
      'options': [
        'Покрывающий, Защищающий',
        'Дарующий пропитание, Наблюдающий',
        'Одаряющий',
        'Наделяющий уделом',
      ],
      'answer_index': 1,
    },
    {
      '_id': 38,
      'question': 'الرَّحِيمُ',
      'options': [
        'Ведающий',
        'Бог',
        'Милосердный',
        'Достохвальный',
      ],
      'answer_index': 2,
    },
    {
      '_id': 39,
      'question': 'المَتِينُ',
      'options': [
        'Великий',
        'Стыдливый',
        'Мягкий, Добрый',
        'Крепкий, Несокрушимый',
      ],
      'answer_index': 3,
    },
    {
      '_id': 40,
      'question': 'الحَيُّ',
      'options': [
        'Прекрасный',
        'Созидатель',
        'Помощник, Защитник',
        'Живой',
      ],
      'answer_index': 3,
    },
    {
      '_id': 41,
      'question': 'الْعَلِيُّ',
      'options': [
        'Всевышний',
        'Возвышенный',
        'Всемогущий (1)',
        'Вседержитель',
      ],
      'answer_index': 1,
    },
    {
      '_id': 42,
      'question': 'القَادِرُ',
      'options': [
        'Могучий, Способный',
        'Ближайший',
        'Всесильный',
        'Всеобъемлющий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 43,
      'question': 'جَامِعُ النَّاسِ',
      'options': [
        'Собирающий людей',
        'Оберегающий, Дарующий безопасность',
        'Обладающий властью',
        'Наставляющий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 44,
      'question': 'الظَّاهِرُ',
      'options': [
        'Превознесшийся',
        'Первый',
        'Высочайший',
        'Богатый',
      ],
      'answer_index': 2,
    },
    {
      '_id': 45,
      'question': 'القَابِضُ',
      'options': [
        'Объемлющий',
        'Удерживающий, Сжимающий',
        'Дарующий, Щедрый',
        'Знающий',
      ],
      'answer_index': 1,
    },
    {
      '_id': 46,
      'question': 'الأَوَّلُ',
      'options': [
        'Первый',
        'Достохвальный',
        'Простирающий',
        'Исцеляющий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 47,
      'question': 'البَاسِطُ',
      'options': [
        'Истинный',
        'Большой',
        'Простирающий',
        'Могучий, Способный',
      ],
      'answer_index': 2,
    },
    {
      '_id': 48,
      'question': 'البَصِيرُ',
      'options': [
        'Видящий',
        'Всесильный',
        'Первый',
        'Слышащий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 49,
      'question': 'المُقَدِّمُ',
      'options': [
        'Попечитель и Хранитель',
        'Выдвигающий вперед',
        'Покровитель',
        'Царь',
      ],
      'answer_index': 1,
    },
    {
      '_id': 50,
      'question': 'المُتَعَالِ',
      'options': [
        'Всемогущий (2)',
        'Бог',
        'Помощник, Защитник',
        'Превознесшийся',
      ],
      'answer_index': 3,
    },
    {
      '_id': 51,
      'question': 'القَوِيُّ',
      'options': [
        'Возвышенный',
        'Богатый',
        'Ведающий',
        'Всесильный',
      ],
      'answer_index': 3,
    },
    {
      '_id': 52,
      'question': 'العَظِيمُ',
      'options': [
        'Великий',
        'Первый',
        'Отбрасывающий назад',
        'Господин, Покровитель',
      ],
      'answer_index': 0,
    },
    {
      '_id': 53,
      'question': 'الجَمِيلُ',
      'options': [
        'Стыдливый',
        'Прекрасный',
        'Достохвальный',
        'Высочайший',
      ],
      'answer_index': 1,
    },
    {
      '_id': 54,
      'question': 'السَّمِيعُ',
      'options': [
        'Слышащий',
        'Выдержанный',
        'Признательный',
        'Одолевающий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 55,
      'question': 'المُجِيبُ',
      'options': [
        'Отзывчивый',
        'Добродетельный',
        'Проницательный, Добрый',
        'Хранитель',
      ],
      'answer_index': 0,
    },
    {
      '_id': 56,
      'question': 'الخَبِيرُ',
      'options': [
        'Ближайший',
        'Большой',
        'Ведающий',
        'Требующий отчета',
      ],
      'answer_index': 2,
    },
    {
      '_id': 57,
      'question': 'المُتَكَبِّرُ',
      'options': [
        'Властелин',
        'Гордый',
        'Одаряющий',
        'Разъясняющий',
      ],
      'answer_index': 1,
    },
    {
      '_id': 58,
      'question': 'الغَفَّارُ',
      'options': [
        'Знающий',
        'Наблюдающий',
        'Близкий',
        'Всепрощающий',
      ],
      'answer_index': 3,
    },
    {
      '_id': 59,
      'question': '(1) القَدِيرُ',
      'options': [
        'Свидетель',
        'Пречистый, Дарующий мир и благополучие',
        'Всемогущий',
        'Единый',
      ],
      'answer_index': 2,
    },
    {
      '_id': 60,
      'question': 'الحَمِيدُ',
      'options': [
        'Всепрощающий',
        'Великодушный',
        'Кормилец',
        'Достохвальный',
      ],
      'answer_index': 3,
    },
    {
      '_id': 61,
      'question': 'السِّتِّيرُ',
      'options': [
        'Покрывающий, Защищающий',
        'Покровитель',
        'Достохвальный',
        'Славный',
      ],
      'answer_index': 0,
    },
    {
      '_id': 62,
      'question': 'الحَيُّ',
      'options': [
        'Удерживающий, Сжимающий',
        'Стыдливый',
        'Истинный',
        'Достаточный',
      ],
      'answer_index': 1,
    },
    {
      '_id': 63,
      'question': 'الشَّاكِرُ',
      'options': [
        'Сострадательный',
        'Господь',
        'Святой',
        'Признательный',
      ],
      'answer_index': 3,
    },
    {
      '_id': 64,
      'question': '(2) المُهَيْمِنُ',
      'options': [
        'Прекрасный',
        'Создатель',
        'Хранитель',
        'Разъясняющий',
      ],
      'answer_index': 2,
    },
    {
      '_id': 65,
      'question': 'المَلِكُ',
      'options': [
        'Царь',
        'Творец',
        'Сострадательный',
        'Одолевающий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 66,
      'question': 'التَّوَّابُ',
      'options': [
        'Любящий, Любимый',
        'Принимающий покаяния',
        'Господин',
        'Святой',
      ],
      'answer_index': 1,
    },
    {
      '_id': 67,
      'question': 'الكَافِي',
      'options': [
        'Прекрасный',
        'Дарующий облик',
        'Достаточный',
        'Исцеляющий',
      ],
      'answer_index': 2,
    },
    {
      '_id': 68,
      'question': 'النَّصِيرُ',
      'options': [
        'Простирающий',
        'Объемлющий',
        'Собирающий людей',
        'Помощник, Защитник',
      ],
      'answer_index': 3,
    },
    {
      '_id': 69,
      'question': 'السِّتِّيرُ',
      'options': [
        'Достохвальный',
        'Большой',
        'Царь',
        'Покрывающий, Защищающий',
      ],
      'answer_index': 3,
    },
    {
      '_id': 70,
      'question': 'الوَلِيُّ',
      'options': [
        'Покровитель',
        'Стыдливый',
        'Самый великодушный',
        'Могучий, Выправляющий, Подчиняющий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 71,
      'question': 'القُدُّوسُ',
      'options': [
        'Одолевающий',
        'Святой',
        'Снисходительный',
        'Всевышний',
      ],
      'answer_index': 1,
    },
    {
      '_id': 72,
      'question': 'الحَلِيمُ',
      'options': [
        'Мудрый',
        'Близкий',
        'Выдержанный',
        'Судия, Раскрывающий, Дарующий победу',
      ],
      'answer_index': 2,
    },
    {
      '_id': 73,
      'question': 'البَارِىءُ',
      'options': [
        'Созидатель',
        'Творец',
        'Создатель',
        'Хранитель',
      ],
      'answer_index': 2,
    },
    {
      '_id': 74,
      'question': 'القَيُّومُ',
      'options': [
        'Вседержитель',
        'Выдержанный',
        'Высочайший',
        'Аллах',
      ],
      'answer_index': 0,
    },
    {
      '_id': 75,
      'question': 'القَاهِرُ',
      'options': [
        'Простирающий',
        'Одолевающий',
        'Дарующий, Щедрый',
        'Господин, Покровитель',
      ],
      'answer_index': 1,
    },
    {
      '_id': 76,
      'question': 'الفَتَّاحُ',
      'options': [
        'Единый',
        'Дарующий облик',
        'Судия, Раскрывающий, Дарующий победу',
        'Обладающий величием и великодушием',
      ],
      'answer_index': 2,
    },
    {
      '_id': 77,
      'question': 'الوَاسِعُ',
      'options': [
        'Прекрасный',
        'Живой',
        'Царь',
        'Объемлющий',
      ],
      'answer_index': 3,
    },
    {
      '_id': 78,
      'question': 'الشَّافِي',
      'options': [
        'Благодарный',
        'Наставляющий',
        'Хранитель',
        'Исцеляющий',
      ],
      'answer_index': 3,
    },
    {
      '_id': 79,
      'question': 'المُؤَخِّرُ',
      'options': [
        'Отбрасывающий назад',
        'Гордый',
        'Милосердный',
        'Видящий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 80,
      'question': 'البَرُّ',
      'options': [
        'Крепкий, Несокрушимый',
        'Добродетельный',
        'Проницательный, Добрый',
        'Всемогущий (1)',
      ],
      'answer_index': 1,
    },
    {
      '_id': 81,
      'question': 'الغَنِيُّ',
      'options': [
        'Свидетель',
        'Славный',
        'Богатый',
        'Высочайший',
      ],
      'answer_index': 2,
    },
    {
      '_id': 82,
      'question': 'الرَّزَّاقُ',
      'options': [
        'Близкий',
        'Самодостаточный',
        'Наделяющий уделом',
        'Исцеляющий',
      ],
      'answer_index': 2,
    },
    {
      '_id': 83,
      'question': 'العَفُوُّ',
      'options': [
        'Бог',
        'Истинный',
        'Разъясняющий',
        'Снисходительный',
      ],
      'answer_index': 3,
    },
    {
      '_id': 84,
      'question': 'القَرِيبُ',
      'options': [
        'Близкий',
        'Господин, Покровитель',
        'Собирающий людей',
        'Ведающий',
      ],
      'answer_index': 0,
    },
    {
      '_id': 85,
      'question': 'الحَسِيبُ',
      'options': [
        'Первый',
        'Требующий отчета',
        'Господь',
        'Самый великодушный',
      ],
      'answer_index': 1,
    },
    {
      '_id': 86,
      'question': 'الشَّكُورُ',
      'options': [
        'Покровитель',
        'Благодарный',
        'Милостивый',
        'Стыдливый',
      ],
      'answer_index': 1,
    },
    {
      '_id': 87,
      'question': 'المُصَوِّرُ',
      'options': [
        'Простирающий',
        'Кормилец',
        'Дарующий облик',
        'Обладающий властью',
      ],
      'answer_index': 2,
    },
    {
      '_id': 88,
      'question': 'المَلِيكُ',
      'options': [
        'Властелин',
        'Одолевающий',
        'Дарующий',
        'Первосоздатель небес и земли',
      ],
      'answer_index': 0,
    },
    {
      '_id': 89,
      'question': 'الشَّهِيدُ',
      'options': [
        'Дарующий пропитание, Наблюдающий',
        'Выдержанный',
        'Оберегающий, Дарующий безопасность',
        'Свидетель',
      ],
      'answer_index': 3,
    },
    {
      '_id': 90,
      'question': 'الحَكَمُ',
      'options': [
        'Гордый',
        'Достаточный',
        'Исцеляющий',
        'Справедливый Судья',
      ],
      'answer_index': 3,
    },
    {
      '_id': 91,
      'question': 'الوَهَّابُ',
      'options': [
        'Судия, Раскрывающий, Дарующий победу',
        'Дарующий',
        'Могучий, Выправляющий, Подчиняющий',
        'Свидетель',
      ],
      'answer_index': 1,
    },
    {
      '_id': 92,
      'question': 'الصَّمَدُ',
      'options': [
        'Всевышний',
        'Последний',
        'Самодостаточный',
        'Всепрощающий',
      ],
      'answer_index': 2,
    },
    {
      '_id': 93,
      'question': 'الجَبَّارُ',
      'options': [
        'Могучий, Выправляющий, Подчиняющий',
        'Святой',
        'Кормилец',
        'Стыдливый',
      ],
      'answer_index': 0,
    },
    {
      '_id': 94,
      'question': 'الوَكِيلُ',
      'options': [
        'Попечитель и Хранитель',
        'Удерживающий, Сжимающий',
        'Создатель',
        'Крепкий, Несокрушимый',
      ],
      'answer_index': 0,
    },
    {
      '_id': 95,
      'question': 'الرَّبُّ',
      'options': [
        'Слышащий',
        'Созидатель',
        'Господь',
        'Властелин',
      ],
      'answer_index': 2,
    },
    {
      '_id': 96,
      'question': 'المَنَّانُ',
      'options': [
        'Дарующий, Щедрый',
        'Пречистый, Дарующий мир и благополучие',
        'Наблюдающий',
        'Большой',
      ],
      'answer_index': 0,
    },
    {
      '_id': 97,
      'question': 'الوَاحِدُ',
      'options': [
        'Богатый',
        'Любящий, Любимый',
        'Хранитель',
        'Единственный',
      ],
      'answer_index': 3,
    },
    {
      '_id': 98,
      'question': 'المُحِيطُ',
      'options': [
        'Всевышний',
        'Всеобъемлющий',
        'Достохвальный',
        'Мудрый',
      ],
      'answer_index': 1,
    },
    {
      '_id': 99,
      'question': 'الخَالِقُ',
      'options': [
        'Благодарный',
        'Творец',
        'Дарующий',
        'Истинный',
      ],
      'answer_index': 1,
    }
  ];
}
