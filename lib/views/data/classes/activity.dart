// ignore_for_file: avoid_print

class Activity {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    // Conversión segura de int a double para price y accessibility
    final price = json['price'] is int ? (json['price'] as int).toDouble() : json['price'] as double;
    final accessibility = json['accessibility'] is int
        ? (json['accessibility'] as int).toDouble()
        : json['accessibility'] as double;

    return Activity(
      activity: json['activity'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: price,
      link: json['link'] as String,
      key: json['key'] as String,
      accessibility: accessibility,
    );
  }
}
