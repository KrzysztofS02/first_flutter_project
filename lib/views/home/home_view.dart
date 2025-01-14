import 'package:dsw_51744/utils/my_colours.dart';
import 'package:dsw_51744/views/database/notes_database.dart';
import 'package:dsw_51744/views/model/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../notes_pages/edit_note_page.dart';
import '../notes_pages/note_detail_page.dart';
import '../widgets/note_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(fontSize: 24),
        ),
        actions: [Icon(Icons.search),SizedBox(width: 12,)],
      ),
      //resizeToAvoidBottomInset: false,
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : notes.isEmpty
                ? Text(
                    'No Notes',
                     style: TextStyle(color: MyColors.whiteColor, fontSize: 24),
                )
                : buildNotes()
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddEditNotePage()),
          );

          refreshNotes();
        },
      ),
    );
  }

  Widget buildNotes() => StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(8),
    itemCount: notes.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final note = notes[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoteDetailPage(noteId: note.id!)
          ));

          refreshNotes();
        },
        child: NoteCardWidget(note: note, index: index),
      );
    },
  );
}