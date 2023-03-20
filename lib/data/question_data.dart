class QuestionData {
  final String question;
  final bool isSelected;

  QuestionData({
    required this.question,
    this.isSelected = false,
  });
}

final List<QuestionData> allQuestionData = [
  QuestionData(
    question: 'Kamu',
    isSelected: true,
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
