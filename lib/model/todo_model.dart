class ToDo {
  String? id;
  String? todoText;

  ToDo({
    required this.id,
    required this.todoText,
  });

  static List<ToDo> toDoList() {
    return [
      ToDo(id: '1', todoText: 'Купить бабуле подарок на др'),
      ToDo(id: '2', todoText: 'Прочесть 10 страниц Капитала'),
      ToDo(id: '3', todoText: 'Тренировка в черверг'),
      ToDo(id: '4', todoText: 'Помыть окна'),
      ToDo(id: '5', todoText: 'English 1 hour'),
    ];
  }
}