class Todo {
  int id_nota;
  int id_propietario_nota;
  bool compartida_nota;
  String titulo_nota;
  String contenido_nota;
  int id_categoria_nota;
  int prioridad_nota; // 0 ninguna, 1 baja, 2 media, 3 alta
  String color_nota; // Hexa
  DateTime fecha_creacion_nota;
  DateTime fecha_termino_nota;
  bool finalizado_nota;

  // Constructor personalizado
  Todo({
    required this.id_nota,
    required this.id_propietario_nota,
    this.compartida_nota = false,
    required this.titulo_nota,
    required this.contenido_nota,
    required this.id_categoria_nota,
    this.prioridad_nota = 0,
    required this.color_nota,
    required this.fecha_creacion_nota,
    required this.fecha_termino_nota,
    this.finalizado_nota = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id_nota: json['id_nota'],
      id_propietario_nota: json['id_propietario_nota'],
      compartida_nota: json['compartida_nota'],
      titulo_nota: json['titulo_nota'],
      contenido_nota: json['contenido_nota'],
      id_categoria_nota: json['id_categoria_nota'],
      prioridad_nota: json['prioridad_nota'],
      color_nota: json['color_nota'],
      fecha_creacion_nota: json['fecha_creacion_nota'],
      fecha_termino_nota: json['fecha_termino_nota'],
      finalizado_nota: json['finalizado_nota'],
    );
  }
}
