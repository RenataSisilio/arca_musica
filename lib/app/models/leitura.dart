final class Leitura {
  Leitura._({required this.ref, required this.text, required this.compl});

  /// Referência bíblica (livro, capítulo e versículo).
  ///
  /// Ex: ```"Lc 2, 41-51"```
  final String ref;

  /// Texto da leitura na íntegra, com marcação de versículos.
  final String text;

  /// Informação complementar:
  ///
  /// Para Salmos, é a *resposta*.
  ///
  /// Ex.: *"Meu coração se regozija no Senhor."*
  ///
  ///
  /// Para Leituras e Evangelho, é o *título*:
  ///
  /// Ex.: *"Leitura do Livro do Profeta Isaías"*
  final String compl;

  factory Leitura.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        "referencia": String ref,
        "titulo": String titulo,
        "texto": String text,
      } =>
        Leitura._(ref: ref, text: text, compl: titulo),
      {
        "referencia": String ref,
        "refrao": String refrao,
        "texto": String text,
      } =>
        Leitura._(ref: ref, text: text, compl: refrao),
      _ => throw UnimplementedError(),
    };
  }
}
