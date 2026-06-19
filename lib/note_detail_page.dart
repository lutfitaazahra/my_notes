import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'note_model.dart';

class NoteDetailPage extends StatelessWidget {
  final String noteId;

  const NoteDetailPage({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    final note = NoteRepository.instance.findById(noteId);

    if (note == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Catatan tidak ditemukan')),
        body: const Center(child: Text('Catatan ini sudah dihapus.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${note.categoryIcon} ${note.categoryName}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/home/note/${note.id}/edit'),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () => _confirmDelete(context, note),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              '${note.createdAt.day}/${note.createdAt.month}/${note.createdAt.year}',
              style: TextStyle(fontSize: 13, color: Colors.grey[500]),
            ),
            const Divider(height: 32),
            Text(
              note.content.isEmpty ? '(Tidak ada isi catatan)' : note.content,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, Note note) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus catatan?'),
        content: Text('Catatan "${note.title}" akan dihapus permanen.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              NoteRepository.instance.delete(note.id);
              Navigator.pop(ctx);
              context.pop();
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}