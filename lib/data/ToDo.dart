class ToDo {
  static const String collectionName = 'ToDos';

  String id;
  String title;
  String description;
  DateTime datetime;
  bool isDone;

  ToDo(
      { // Constructor
      required this.id,
      required this.title,
      required this.description,
      required this.datetime,
      this.isDone = false});

  ToDo.fromJson(Map<String, Object?> json) // When we read from FireBase !!!!!!
      : this(
          id: json['id']! as String,
          title: json['title']! as String,
          description: json['description']! as String,
          datetime:
              DateTime.fromMicrosecondsSinceEpoch(json['datetime']! as int),
          isDone: json['isDone']! as bool,
        );

//----------------------------------------------------------------------------

  Map<String, Object?> toJson() {
    // when we write to FireBase !!!!!!
    return {
      'id': id,
      'title': title,
      'description': description,
      'datetime': datetime.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }
}
