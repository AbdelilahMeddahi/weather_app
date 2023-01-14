class AutocompletePrediction {
  final String? description;

  final String? placeId;
  final String? reference;

  AutocompletePrediction(
      {
      this.description,
      this.placeId,
      this.reference});

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutocompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,

    );
  }
}

