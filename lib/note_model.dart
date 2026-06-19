enum Category { personal, pekerjaan, lainnya }

class Note {
  final String id;
  final String title;
  final String content;
  final Category category;
  final DateTime createdAt;

  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.createdAt,
  });

  Note copyWith({String? title, String? content, Category? category}) {
    return Note(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      createdAt: createdAt,
    );
  }

  String get categoryName {
    switch (category) {
      case Category.personal:
        return 'Personal';
      case Category.pekerjaan:
        return 'Pekerjaan';
      case Category.lainnya:
        return 'Lainnya';
    }
  }

  String get categoryIcon {
    switch (category) {
      case Category.personal:
        return '👤';
      case Category.pekerjaan:
        return '💼';
      case Category.lainnya:
        return '📌';
    }
  }
}

class NoteRepository {
  NoteRepository._internal();
  static final NoteRepository instance = NoteRepository._internal();

  final List<Note> notes = [];

  Note? findById(String id) {
    for (final note in notes) {
      if (note.id == id) return note;
    }
    return null;
  }

  void add(Note note) => notes.insert(0, note);
  void delete(String id) => notes.removeWhere((n) => n.id == id);

  void update(Note updated) {
    final index = notes.indexWhere((n) => n.id == updated.id);
    if (index != -1) notes[index] = updated;
  }

  int countByCategory(Category cat) =>
      notes.where((n) => n.category == cat).length;
}