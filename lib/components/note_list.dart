import 'package:flutter/material.dart';
import 'package:notebook_app/components/note_detail.dart';
import 'package:notebook_app/models/category.dart';
import 'package:notebook_app/models/note.dart';
import 'package:notebook_app/utils/database_helper.dart';
import 'package:notebook_app/components/common/title_widget.dart';

class NoteListPage extends StatefulWidget {
  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  DatabaseHelper dbHelper = DatabaseHelper();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Note> notes;
  bool notesController = false;

  Note selectedNote;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Note Application'),
          centerTitle: true,
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              mini: true,
              heroTag: 'fab-1',
              child: Icon(Icons.category),
              tooltip: 'Kategori ekle',
              onPressed: () => addCategoryDialog(context),
            ),
            SizedBox(height: 5),
            FloatingActionButton(
              heroTag: 'fab-2',
              child: Icon(Icons.add),
              tooltip: 'Not ekle',
              onPressed: () => goNoteDetail(context),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              titleWidget(context, 'Kayıtlı Notlar'),
              Expanded(
                child: Container(
                  child: notesController
                      ? notes.length > 0
                          ? ListView.builder(
                              itemCount: notes.length,
                              itemBuilder: (context, index) => listItem(index))
                          : Center(child: Text('Kayıtlı not bulunmamaktadır.'))
                      : Center(child: CircularProgressIndicator()),
                ),
              )
            ],
          ),
        ));
  }

  Widget listItem(int index) => Container(
        child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Text(notes[index].noteImportance.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.headline6.fontSize))),
            title: Text(notes[index].noteTitle),
            subtitle: Text(notes[index].noteContent),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      );

  void addCategoryDialog(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    String newCategoryName;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text('Kategori Ekle'),
              titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              titleTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Theme.of(context).textTheme.headline6.fontSize),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Kategori Adı',
                        hintText: 'Kategori Adı',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value.length < 3
                          ? 'Kategori adı 3 karakterden büyük olmalıdır.'
                          : null,
                      onSaved: (value) => newCategoryName = value,
                    ),
                  ),
                ),
                Container(
                  child: ButtonBar(
                    children: [
                      MaterialButton(
                        child: Text('Vazgeç'),
                        splashColor: Theme.of(context).accentColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      MaterialButton(
                        child: Text('Kaydet'),
                        splashColor: Theme.of(context).accentColor,
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            dbHelper
                                .addCategory(Category(newCategoryName))
                                .then((newCategoryId) {
                              if (newCategoryId >= 0) {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text('Kategori Eklendi'),
                                  duration: Duration(seconds: 2),
                                ));
                              } else {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text('Kategori Eklenemedi'),
                                  duration: Duration(seconds: 2),
                                ));
                              }

                              Navigator.pop(context);
                            });
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ));
  }

  goNoteDetail(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NoteDetailPage(title: 'Not Ekle')));
  }

  getNotes() async {
    List<Note> notesData = await dbHelper.getNotes();
    print(notesData);
    setState(() {
      notes = notesData;
      notesController = true;
    });
  }
}
