class TaskBoard {
  int? id;
  String name;
  String color;

  TaskBoard({
    this.id,
    required this.name,
    required this.color,
  });

  factory TaskBoard.fromMap(Map<String, dynamic> map) {
    return TaskBoard(
      id: map['id'],
      name: map['name'],
      color: map['color'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}
