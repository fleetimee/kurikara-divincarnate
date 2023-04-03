class QuestionData {
  final String question;
  bool isSelected;

  QuestionData({
    required this.question,
    this.isSelected = false,
  });
}

final List<QuestionData> allQuestionData = [
  QuestionData(
    question: 'Kamu',
    isSelected: false,
  ),
  QuestionData(
    question: 'Saya',
    isSelected: false,
  ),
  QuestionData(
    question: 'Dia',
    isSelected: false,
  ),
  QuestionData(
    question: 'Apa',
    isSelected: false,
  ),
];
