import '../entities/quiz_entity.dart';
import '../repositories/quiz_repository.dart';

class QuizUseCase {
  final QuizRepository _quizRepository;

  QuizUseCase(this._quizRepository);

  Future<List<QuizEntity>> fetchArabicQuiz() async {
    try {
      final List<QuizEntity> arabicQuiz = await _quizRepository.getArabicQuiz();
      return arabicQuiz;
    } catch (e) {
      throw Exception('Error arabic quiz \n\n${e.toString()}');
    }
  }

  Future<void> fetchArRuAnswer({required int answerId, required int answerState}) async {
    try {
      return await _quizRepository.setArRuAnswer(answerId: answerId, answerState: answerState);
    } catch (e) {
      throw Exception('Error ar-ru answer \n\n${e.toString()}');
    }
  }

  Future<void> fetchArRuResetAnswer() async {
    try {
      return await _quizRepository.resetArRuAnswer();
    } catch (e) {
      throw Exception('Error reset ar-ru answer \n\n${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> fetchArRuTrueAnswers() async {
    try {
      return await _quizRepository.getArRuTrueAnswers();
    } catch (e) {
      throw Exception('Error ar-ru true answer \n\n${e.toString()}');
    }
  }

  Future<List<QuizEntity>> fetchRussianQuiz() async {
    try {
      final List<QuizEntity> russianQuiz = await _quizRepository.getRussianQuiz();
      return russianQuiz;
    } catch (e) {
      throw Exception('Error russian quiz \n\n${e.toString()}');
    }
  }

  Future<void> fetchRuArAnswer({required int answerId, required int answerState}) async {
    try {
      return await _quizRepository.setRuArAnswer(answerId: answerId, answerState: answerState);
    } catch (e) {
      throw Exception('Error ru-ar answer \n\n${e.toString()}');
    }
  }

  Future<void> fetchRuArResetAnswer() async {
    try {
      return await _quizRepository.resetRuArAnswer();
    } catch (e) {
      throw Exception('Error reset ru-ar answer \n\n${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> fetchRuArTrueAnswers() async {
    try {
      return await _quizRepository.getRuArTrueAnswers();
    } catch (e) {
      throw Exception('Error ru-ar true answer \n\n${e.toString()}');
    }
  }
}
