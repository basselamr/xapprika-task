class Response {
  String responseId;
  String responseTitle;
  String responseTitleAr;
  double defaultScore;
  double score;
  bool isSelected;

  Response({
    required this.responseId,
    required this.responseTitle,
    required this.responseTitleAr,
    required this.defaultScore,
    required this.score,
    required this.isSelected,
  });
}
