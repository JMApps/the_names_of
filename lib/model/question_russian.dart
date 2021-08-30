class QuestionRussian {
  int? id, answer;
  String? question;
  List<String>? options;

  QuestionRussian({this.id, this.answer, this.question, this.options});

  static const List sample_data = [
    {
      '_id': 1,
      'question': 'Творец',
      'options': [
        'الشَّكُورُ',
        'الخَالِقُ',
        'الوَهَّابُ',
        'الحَقُّ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 2,
      'question': 'Всеобъемлющий',
      'options': [
        'الأَعْلَى',
        'المُحِيطُ',
        'الحَمِيدُ',
        'الحَكِيمُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 3,
      'question': 'Единственный',
      'options': [
        'الغَنِيُّ',
        'الوَدُودُ',
        'الحَفِيظُ',
        'الوَاحِدُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 4,
      'question': 'Дарующий, Щедрый',
      'options': [
        'المَنَّانُ',
        'السَّلَامُ',
        'الرَّقِيبُ',
        'الكَبِيرُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 5,
      'question': 'Господь',
      'options': [
        'السَّمِيعُ',
        'الخَلَّاقُ',
        'الرَّبُّ',
        'المَلِيكُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 6,
      'question': 'Попечитель и Хранитель',
      'options': [
        'الوَكِيلُ',
        'القَابِضُ',
        'البَارِىءُ',
        'المَتِينُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 7,
      'question': 'Могучий, Выправляющий, Подчиняющий',
      'options': [
        'الجَبَّارُ',
        'القُدُّوسُ',
        'الرَّازِقُ',
        'الحَيُّ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 8,
      'question': 'Самодостаточный',
      'options': [
        'الأَعْلَى',
        'الآخِرُ',
        'الصَّمَدُ',
        'الغَفَّارُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 9,
      'question': 'Дарующий',
      'options': [
        'الفَتَّاحُ',
        'الوَهَّابُ',
        'الجَبَّارُ',
        'الشَّهِيدُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 10,
      'question': 'Справедливый Судья',
      'options': [
        'المُتَكَبِّرُ',
        'الكَافِي',
        'الشَّافِي',
        'الحَكَمُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 11,
      'question': 'Свидетель',
      'options': [
        'المُقِيتُ',
        'الحَلِيمُ',
        'المُؤْمِنُ',
        'الشَّهِيدُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 12,
      'question': 'Властелин',
      'options': [
        'المَلِيكُ',
        'القَاهِرُ',
        'الوَهَّابُ',
        'بَدِيعُ السَّمَوَاتِ وَالأَرْضِ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 13,
      'question': 'Дарующий облик',
      'options': [
        'البَاسِطُ',
        'الرَّازِقُ',
        'المُصَوِّرُ',
        'مَالِكُ المُلْكِ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 14,
      'question': 'Благодарный',
      'options': [
        'الوَلِيُّ',
        'الشَّكُورُ',
        'الرَّحْمٰنُ',
        'الحَيُّ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 15,
      'question': 'Требующий отчета',
      'options': [
        'الأَوَّلُ',
        'الحَسِيبُ',
        'الرَّبُّ',
        'الأَكْرَمُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 16,
      'question': 'Близкий',
      'options': [
        'القَرِيبُ',
        'المَوْلَى',
        'جَامِعُ النَّاسِ',
        'الخَبِيرُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 17,
      'question': 'Снисходительный',
      'options': [
        'الإِلَهُ',
        'الحَقُّ',
        'المُبِينُ',
        'العَفُوُّ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 18,
      'question': 'Наделяющий уделом',
      'options': [
        'القَرِيبُ',
        'الصَّمَدُ',
        'الرَّزَّاقُ',
        'الشَّافِي',
      ],
      'answer_index': 2,
    },
    {
      '_id': 19,
      'question': 'Богатый',
      'options': [
        'الشَّهِيدُ',
        'المَجِيدُ',
        'الغَنِيُّ',
        'الظَّاهِرُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 20,
      'question': 'Добродетельный',
      'options': [
        'المَتِينُ',
        'البَرُّ',
        'اللَّطِيفُ',
        '(1) القَدِيرُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 21,
      'question': 'Отбрасывающий назад',
      'options': [
        'المُؤَخِّرُ',
        'المُتَكَبِّرُ',
        'الرَّحِيمُ',
        'البَصِيرُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 22,
      'question': 'Исцеляющий',
      'options': [
        'الشَّكُورُ',
        'الهَادِي',
        'الحَفِيظُ',
        'الشَّافِي',
      ],
      'answer_index': 3,
    },
    {
      '_id': 23,
      'question': 'Объемлющий',
      'options': [
        'الجَمِيلُ',
        'الحَيُّ',
        'المَلِكُ',
        'الوَاسِعُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 24,
      'question': 'Судия, Раскрывающий, Дарующий победу',
      'options': [
        'الأَحَدُ',
        'المُصَوِّرُ',
        'الفَتَّاحُ',
        'ذُو الجَلَالِ وَالإِكْرَامِ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 25,
      'question': 'Одолевающий',
      'options': [
        'البَاسِطُ',
        'القَاهِرُ',
        'المَنَّانُ',
        'المَوْلَى',
      ],
      'answer_index': 1,
    },
    {
      '_id': 26,
      'question': 'Вседержитель',
      'options': [
        'القَيُّومُ',
        'الحَلِيمُ',
        'الظَّاهِرُ',
        'الله',
      ],
      'answer_index': 0,
    },
    {
      '_id': 27,
      'question': 'Создатель',
      'options': [
        'الخَلَّاقُ',
        'الخَالِقُ',
        'البَارِىءُ',
        'الحَفِيظُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 28,
      'question': 'Выдержанный',
      'options': [
        'الحَكِيمُ',
        'القَرِيبُ',
        'الحَلِيمُ',
        'الفَتَّاحُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 29,
      'question': 'Святой',
      'options': [
        'القَاهِرُ',
        'القُدُّوسُ',
        'العَفُوُّ',
        'الأَعْلَى',
      ],
      'answer_index': 1,
    },
    {
      '_id': 30,
      'question': 'Покровитель',
      'options': [
        'الوَلِيُّ',
        'الحَيُّ',
        'الأَكْرَمُ',
        'الجَبَّارُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 31,
      'question': 'Покрывающий, Защищающий',
      'options': [
        'الحَمِيدُ',
        'الكَبِيرُ',
        'المَلِكُ',
        'السِّتِّيرُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 32,
      'question': 'Помощник, Защитник',
      'options': [
        'البَاسِطُ',
        'الوَاسِعُ',
        'جَامِعُ النَّاسِ',
        'النَّصِيرُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 33,
      'question': 'Достаточный',
      'options': [
        'الجَمِيلُ',
        'المُصَوِّرُ',
        'الكَافِي',
        'الشَّافِي',
      ],
      'answer_index': 2,
    },
    {
      '_id': 34,
      'question': 'Принимающий покаяния',
      'options': [
        'الوَدُودُ',
        'التَّوَّابُ',
        'السَّيِّدُ',
        'القُدُّوسُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 35,
      'question': 'Царь',
      'options': [
        'المَلِكُ',
        'الخَالِقُ',
        'الرَّؤُوفُ',
        'القَاهِرُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 36,
      'question': 'Хранитель (2)',
      'options': [
        'الجَمِيلُ',
        'البَارِىءُ',
        'المُهَيْمِنُ',
        'المُبِينُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 37,
      'question': 'Признательный',
      'options': [
        'الرَّؤُوفُ',
        'الرَّبُّ',
        'القُدُّوسُ',
        'الشَّاكِرُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 38,
      'question': 'Стыдливый',
      'options': [
        'القَابِضُ',
        'الحَيُّ',
        'الحَقُّ',
        'الكَافِي',
      ],
      'answer_index': 1,
    },
    {
      '_id': 39,
      'question': 'Покрывающий, Защищающий',
      'options': [
        'السِّتِّيرُ',
        'الوَلِيُّ',
        'الحَمِيدُ',
        'المَجِيدُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 40,
      'question': 'Достохвальный',
      'options': [
        'الغَفَّارُ',
        'الكَرِيمُ',
        'الرَّازِقُ',
        'الحَمِيدُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 41,
      'question': 'Всемогущий (1)',
      'options': [
        'الشَّهِيدُ',
        'السَّلَامُ',
        'القَدِيرُ',
        'الأَحَدُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 42,
      'question': 'Всепрощающий',
      'options': [
        'العَلِيمُ',
        'الرَّقِيبُ',
        'القَرِيبُ',
        'الغَفَّارُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 43,
      'question': 'Гордый',
      'options': [
        'المَلِيكُ',
        'المُتَكَبِّرُ',
        'المُعْطِي',
        'المُبِينُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 44,
      'question': 'Ведающий',
      'options': [
        'الْبَاطِنُ',
        'الكَبِيرُ',
        'الخَبِيرُ',
        'الحَسِيبُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 45,
      'question': 'Отзывчивый',
      'options': [
        'المُجِيبُ',
        'البَرُّ',
        'اللَّطِيفُ',
        'الحَفِيظُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 46,
      'question': 'Слышащий',
      'options': [
        'السَّمِيعُ',
        'الحَلِيمُ',
        'الشَّاكِرُ',
        'القَاهِرُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 47,
      'question': 'Прекрасный',
      'options': [
        'الحَيُّ',
        'الجَمِيلُ',
        'الحَمِيدُ',
        'الظَّاهِرُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 48,
      'question': 'Великий',
      'options': [
        'العَظِيمُ',
        'الأَوَّلُ',
        'المُؤَخِّرُ',
        'المَوْلَى',
      ],
      'answer_index': 0,
    },
    {
      '_id': 49,
      'question': 'Всесильный',
      'options': [
        'الْعَلِيُّ',
        'الغَنِيُّ',
        'الخَبِيرُ',
        'القَوِيُّ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 50,
      'question': 'Превознесшийся',
      'options': [
        '(2) القَهَّارُ',
        'الإِلَهُ',
        'النَّصِيرُ',
        'المُتَعَالِ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 51,
      'question': 'Выдвигающий вперед',
      'options': [
        'الوَكِيلُ',
        'المُقَدِّمُ',
        'الوَلِيُّ',
        'المَلِكُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 52,
      'question': 'Видящий',
      'options': [
        'البَصِيرُ',
        'القَوِيُّ',
        'الأَوَّلُ',
        'السَّمِيعُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 53,
      'question': 'Простирающий',
      'options': [
        'الحَقُّ',
        'الكَبِيرُ',
        'البَاسِطُ',
        'القَادِرُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 54,
      'question': 'Первый',
      'options': [
        'الأَوَّلُ',
        'الحَمِيدُ',
        'البَاسِطُ',
        'الشَّافِي',
      ],
      'answer_index': 0,
    },
    {
      '_id': 55,
      'question': 'Удерживающий, Сжимающий',
      'options': [
        'الوَاسِعُ',
        'القَابِضُ',
        'المَنَّانُ',
        'العَلِيمُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 56,
      'question': 'Высочайший',
      'options': [
        'المُتَعَالِ',
        'الأَوَّلُ',
        'الظَّاهِرُ',
        'الغَنِيُّ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 57,
      'question': 'Собирающий людей',
      'options': [
        'جَامِعُ النَّاسِ',
        'المُؤْمِنُ',
        'مَالِكُ المُلْكِ',
        'الهَادِي',
      ],
      'answer_index': 0,
    },
    {
      '_id': 58,
      'question': 'Могучий, Способный',
      'options': [
        'القَادِرُ',
        'الْبَاطِنُ',
        'القَوِيُّ',
        'المُحِيطُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 59,
      'question': 'Возвышенный',
      'options': [
        'الأَعْلَى',
        'الْعَلِيُّ',
        '(1) القَدِيرُ',
        'القَيُّومُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 60,
      'question': 'Живой',
      'options': [
        'الجَمِيلُ',
        'الخَلَّاقُ',
        'النَّصِيرُ',
        'الحَيُّ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 61,
      'question': 'Крепкий, Несокрушимый',
      'options': [
        'العَظِيمُ',
        'الحَيُّ',
        'الرَّفِيقُ',
        'المَتِينُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 62,
      'question': 'Милосердный',
      'options': [
        'الخَبِيرُ',
        'الإِلَهُ',
        'الرَّحِيمُ',
        'الحَمِيدُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 63,
      'question': 'Дарующий пропитание, Наблюдающий',
      'options': [
        'السِّتِّيرُ',
        'المُقِيتُ',
        'المُعْطِي',
        'الرَّزَّاقُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 64,
      'question': 'Ближайший',
      'options': [
        'الكَبِيرُ',
        'الشَّاكِرُ',
        'الْبَاطِنُ',
        'الشَّكُورُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 65,
      'question': 'Господин',
      'options': [
        'السَّيِّدُ',
        'القَوِيُّ',
        'الحَلِيمُ',
        'القَرِيبُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 66,
      'question': 'Могущественный',
      'options': [
        'العَزِيزُ',
        'المُتَعَالِ',
        'التَّوَّابُ',
        'الحَكَمُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 67,
      'question': 'Сострадательный',
      'options': [
        'الكَافِي',
        'الرَّؤُوفُ',
        'الرَّبُّ',
        'الحَسِيبُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 68,
      'question': 'Всевышний',
      'options': [
        '(3) المُقْتَدِرُ',
        'الشَّهِيدُ',
        'الوَهَّابُ',
        'الأَعْلَى',
      ],
      'answer_index': 3,
    },
    {
      '_id': 69,
      'question': 'Прощающий',
      'options': [
        'الغَفَّارُ',
        'الخَبِيرُ',
        'الغَفُورُ',
        'الأَوَّلُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 70,
      'question': 'Знающий',
      'options': [
        'المُتَعَالِ',
        'العَلِيمُ',
        'الحَكِيمُ',
        'الحَفِيظُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 71,
      'question': 'Одаряющий',
      'options': [
        'المُعْطِي',
        'القَاهِرُِ',
        'الحَيُّ',
        'جَامِعُ النَّاسِ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 72,
      'question': 'Господин, Покровитель',
      'options': [
        'الحَيُّ',
        'المُعْطِي',
        'المَوْلَى',
        'النَّصِيرُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 73,
      'question': 'Наставляющий',
      'options': [
        'الحَسِيبُ',
        'الهَادِي',
        'الحَمِيدُ',
        'الوَاسِعُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 74,
      'question': 'Хранитель (1)',
      'options': [
        'الحَفِيظُ',
        'الحَكِيمُ',
        'الغَنِيُّ',
        'القَادِرُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 75,
      'question': 'Аллах',
      'options': [
        'المُتَعَالِ',
        'الحَكِيمُ',
        'الله',
        'الجَمِيلُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 76,
      'question': 'Мудрый',
      'options': [
        'التَّوَّابُ',
        'العَزِيزُ',
        'البَاسِطُ',
        'الحَكِيمُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 77,
      'question': 'Проницательный, Добрый',
      'options': [
        'الصَّمَدُ',
        'المُعْطِي',
        'القَرِيبُ',
        'اللَّطِيفُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 78,
      'question': 'Первосоздатель небес и земли',
      'options': [
        'ذُو الجَلَالِ وَالإِكْرَامِ',
        'بَدِيعُ السَّمَوَاتِ وَالأَرْضِ',
        'الجَبَّارُ',
        'اللَّطِيفُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 79,
      'question': 'Милостивый',
      'options': [
        'الرَّحْمٰنُ',
        'الغَفُورُ',
        'المَلِيكُ',
        'البَارِىءُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 80,
      'question': 'Обладающий властью',
      'options': [
        'جَامِعُ النَّاسِ',
        'المُصَوِّرُ',
        'مَالِكُ المُلْكِ',
        'القَيُّومُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 81,
      'question': 'Обладающий величием и великодушием',
      'options': [
        'المُؤْمِنُ',
        'المَتِينُ',
        'السِّتِّيرُ',
        'ذُو الجَلَالِ وَالإِكْرَامِ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 82,
      'question': 'Кормилец',
      'options': [
        'المُتَكَبِّرُ',
        'المَلِكُ',
        'الرَّازِقُ',
        'الوَهَّابُ',
      ],
      'answer_index': 2,
    },
    {
      '_id': 83,
      'question': 'Наблюдающий',
      'options': [
        'الرَّقِيبُ',
        'القَوِيُّ',
        'المَجِيدُ',
        'البَرُّ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 84,
      'question': 'Созидатель',
      'options': [
        'البَارِىءُ',
        'الخَلَّاقُ',
        'الحَيُّ',
        'الغَنِيُّ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 85,
      'question': 'Пречистый, Дарующий мир и благополучие',
      'options': [
        'الجَبَّارُ',
        'الرَّؤُوفُ',
        'مَالِكُ المُلْكِ',
        'السَّلَامُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 86,
      'question': 'Оберегающий, Дарующий безопасность',
      'options': [
        'المُؤْمِنُ',
        'جَامِعُ النَّاسِ',
        'النَّصِيرُ',
        'القَاهِرُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 87,
      'question': 'Свет небес и земли',
      'options': [
        'بَدِيعُ السَّمَوَاتِ وَالأَرْضِ',
        'نُورُ السَّمَوَاتِ وَالأَرْضِ',
        'المُقِيتُ',
        'الفَتَّاحُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 88,
      'question': 'Всемогущий (2)',
      'options': [
        'القَهَّارُ',
        'الرَّقِيبُ',
        'القَوِيُّ',
        'القَيُّومُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 89,
      'question': 'Мягкий, Добрый',
      'options': [
        'المَنَّانُ',
        'الرَّفِيقُ',
        'الرَّزَّاقُ',
        'الأَكْرَمُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 90,
      'question': 'Большой',
      'options': [
        'الله',
        'الكَبِيرُ',
        'ذُو الجَلَالِ وَالإِكْرَامِ',
        'القَابِضُ',
      ],
      'answer_index': 1,
    },
    {
      '_id': 91,
      'question': 'Разъясняющий',
      'options': [
        'المُبِينُ',
        'المَوْلَى',
        'المُقِيتُ',
        'العَلِيمُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 92,
      'question': 'Последний',
      'options': [
        'الأَوَّلُ',
        'القَوِيُّ',
        'الحَيُّ',
        'الآخِرُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 93,
      'question': 'Истинный',
      'options': [
        'الشَّافِي',
        'الحَقُّ',
        'المُؤَخِّرُ',
        'الأَعْلَى',
      ],
      'answer_index': 1,
    },
    {
      '_id': 94,
      'question': 'Великодушный',
      'options': [
        'الحَكَمُ',
        'البَاسِطُ',
        'الكَرِيمُ',
        'المَوْلَى',
      ],
      'answer_index': 2,
    },
    {
      '_id': 95,
      'question': 'Бог',
      'options': [
        'المُبِينُ',
        'الإِلَهُ',
        'بَدِيعُ السَّمَوَاتِ وَالأَرْضِ',
        'الهَادِي',
      ],
      'answer_index': 1,
    },
    {
      '_id': 96,
      'question': 'Всемогущий (3)',
      'options': [
        'العَزِيزُ',
        'المُقَدِّمُ',
        'الحَقُّ',
        'المُقْتَدِرُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 97,
      'question': 'Любящий, Любимый',
      'options': [
        'الوَدُودُ',
        'الْعَلِيُّ',
        'البَصِيرُ',
        'الظَّاهِرُ',
      ],
      'answer_index': 0,
    },
    {
      '_id': 98,
      'question': 'Единый',
      'options': [
        'الحَيُّ',
        'الوَاحِدُ',
        'العَظِيمُ',
        'الأَحَدُ',
      ],
      'answer_index': 3,
    },
    {
      '_id': 99,
      'question': 'Славный',
      'options': [
        'الآخِرُ',
        'الرَّفِيقُ',
        'المَجِيدُ',
        'الحَمِيدُ',
      ],
      'answer_index': 2,
    }
  ];
}