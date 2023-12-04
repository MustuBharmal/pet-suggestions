class Dogs {
  String id;
  final String dogBreed;
  final String lifeSpan;
  final String color;
  final String behaviour;
  final String suitableEnv;

  Dogs(
    this.id, {
    required this.dogBreed,
    required this.lifeSpan,
    required this.color,
    required this.behaviour,
    required this.suitableEnv,
  });
}
