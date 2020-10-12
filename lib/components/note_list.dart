import 'package:flutter/material.dart';

class NoteListPage extends StatefulWidget {
  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => SimpleDialog(
                        title: Text('Kategori Ekle'),
                        titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        titleTextStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Theme.of(context).textTheme.headline6.fontSize
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            child: Form(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Kategori Adı',
                                  hintText: 'Kategori Adı',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) => value.length < 3
                                    ? 'Kategori adı 3 karakterden büyük olmalıdır.'
                                    : null,
                              ),
                            ),
                          ),

                          Container(
                            child: ButtonBar(
                              children: [

                                MaterialButton(
                                  child: Text('Vazgeç'),
                                  splashColor: Theme.of(context).accentColor,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),

                                MaterialButton(
                                  child: Text('Kaydet'),
                                  splashColor: Theme.of(context).accentColor,
                                  onPressed: (){},
                                )

                              ],
                            ),
                          )
                        ],
                      ));
            },
          ),
          SizedBox(height: 5),
          FloatingActionButton(
            heroTag: 'fab-2',
            child: Icon(Icons.add),
            tooltip: 'Not ekle',
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Center(child: Text('Notes area')),
        ],
      ),
    );
  }
}
