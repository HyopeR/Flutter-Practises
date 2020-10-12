import 'package:flutter/material.dart';
import 'package:notebook_app/models/category.dart';
import 'package:notebook_app/utils/database_helper.dart';

class NoteDetailPage extends StatefulWidget {
  String title;

  NoteDetailPage({this.title});

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  DatabaseHelper dbHelper = DatabaseHelper();

  var formKey = GlobalKey<FormState>();
  int selectedCategoryId = 1;

  List<Category> categories;
  bool categoriesController = false;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              categoriesController
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<int>(
                        onChanged: (valueId) =>
                            setState(() => selectedCategoryId = valueId),
                        items: createDropDownItem(),
                        value: selectedCategoryId,
                        underline: Container(),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> createDropDownItem() {
    return categories
        .map((category) => DropdownMenuItem<int>(
              value: category.categoryId,
              child: Container(
                  child: Text(category.categoryTitle)
              ),
            ))
        .toList();
  }

  void getCategories() async {
    List<Category> categoriesData = await dbHelper.getCategories();
    setState(() {
      categories = categoriesData;
      categoriesController = true;
    });
  }
}
