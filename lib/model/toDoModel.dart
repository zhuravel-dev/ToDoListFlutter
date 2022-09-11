class ToDo {
  String? id;
  String? text;
  bool isDone;

  ToDo({
    required this.id,
    required this.text,
    this.isDone = false,
  });

  static List<ToDo> toDoList() {
    return [
      ToDo(id: '1', text: 'Купить бабуле подарок на др', ),
      ToDo(id: '2', text: 'Cleaning'),
      ToDo(id: '3', text: 'Тренировка с резинками', isDone: true),
      ToDo(id: '4', text: 'pay the bills'),
      ToDo(id: '5', text: 'English 1 hour', isDone: true),
      ToDo(id: '6', text: 'Забрать посылку новая почта', ),
      ToDo(id: '7', text: 'Finish reading Verber'),
      ToDo(id: '8', text: 'find and buy celery', isDone: true),
      ToDo(id: '9', text: 'Go to grandma'),
      ToDo(id: '10', text: 'Прочесть 10 страниц Капитала'),
      ToDo(id: '11', text: 'Пробежка во вторник', isDone: true),
      ToDo(id: '12', text: 'Забрать уход для волос'),
      ToDo(id: '13', text: 'dinner with parents on saturday'),
      ToDo(id: '14', text: 'Тренировка в черверг', isDone: true),
      ToDo(id: '15', text: 'Помыть окна')
    ];
  }
}