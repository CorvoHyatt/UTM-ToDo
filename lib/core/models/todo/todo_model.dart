class Todo {
  String titulo_nota;
  String contenido_nota;
  int id_categoria_nota;
  int prioridad_nota; // 0 ninguna, 1 baja, 2 media, 3 alta
  String color_nota; // Hexa

  // Constructor personalizado
  Todo({
    required this.titulo_nota,
    required this.contenido_nota,
    required this.id_categoria_nota,
    this.prioridad_nota = 0,
    required this.color_nota,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      titulo_nota: json['titulo_nota'],
      contenido_nota: json['contenido_nota'],
      id_categoria_nota: json['id_categoria_nota'],
      prioridad_nota: json['prioridad_nota'],
      color_nota: json['color_nota'],
    );
  }
}
