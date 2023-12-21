class Task {
  int? id;
  int user_id;
  int board_id;
  late String note;
  DateTime? date;
  String? startTime;
  String? endTime;
  bool? isCompleted;
  late String title;

  Task(this.user_id, this.board_id, this.title, this.note, this.date,
      this.startTime, this.endTime,
      {isCompleted = 0});

  Task.fromMap(Map map) {
    this.id = map["id"];
    this.board_id = map["board_id"];
    this.title = map["title"];
    this.isCompleted = map["done"];
    this.note = map["note"];
    this.date = map["date"];
    this.startTime = map["startTime"];
    this.endTime = map["endTime"];
    this.user_id = map["user_id"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "title": this.title,
      "isCompleted": this.isCompleted,
      "note": this.title,
      "date": this.isCompleted,
      "startTime": this.title,
      "endTime": this.isCompleted,
    };

    if (this.id != null) {
      map["id"] = this.id;
    }
    if (this.user_id != null) {
      map["user_id"] = this.id;
    }
    if (this.board_id != null) {
      map["board_id"] = this.id;
    }
    return map;
  }
}
