class StepModel {
  final String image;
  final String? description;

  StepModel({required this.image, this.description});

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      image: json['image'],
      description: json['description'],
    );
  }
}
