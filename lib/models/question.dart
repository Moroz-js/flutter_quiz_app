class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shufferedList = List.of(answers);

    shufferedList.shuffle();

    return shufferedList;
  }
}
