class Event {
  final int? id; // For SQFlite (optional)
  final String title;
  final String location;
  final String date;
  final String price;

  Event({
    this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.price, required String description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'date': date,
      'price': price,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      location: map['location'],
      date: map['date'],
      price: map['price'], description: '',
    );
  }

  String? get description => null;
}