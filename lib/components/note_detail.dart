import 'package:flutter/cupertino.dart';
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
  double sliderValue = 1.0;

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
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [

            Form(
              key: formKey,
              child: Column(
                children: [

                  // Kategori Seçme Row
                  titleWidget('Not Ekleme'),
                  Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [

                          Expanded(
                            flex: 1,
                            child: Text('Kategori Seçiniz: ',
                                style: TextStyle(fontSize: 18)),
                          ),

                          categoriesController
                              ? Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton<int>(
                                isExpanded: true,
                                onChanged: (valueId) =>
                                    setState(
                                            () => selectedCategoryId = valueId),
                                items: createDropDownItem(),
                                value: selectedCategoryId,
                                underline: Container(),
                              ),
                            ),
                          )
                              : Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      )
                  ),

                  // Başlık Input
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Başlık Giriniz',
                        labelText: 'Başlık',
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade400, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  // Content Input
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 4,

                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'İçerik Giriniz',
                        labelText: 'İçerik',
                        labelStyle: TextStyle(fontSize: 18, ),
                        border: OutlineInputBorder(),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme
                              .of(context)
                              .primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade400, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  // Slider Input
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2),
                        borderRadius: BorderRadius.circular(10)),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('Not Önceliği ($sliderValue)',
                              style: TextStyle(fontSize: 18)),
                        ),

                        Container(
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                flex: 1,
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () => setState(() => sliderValue = 1),
                                  child: Icon(Icons.skip_previous),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () =>
                                      setState(() =>
                                      sliderValue > 1
                                          ? sliderValue--
                                          : null),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Slider(
                                  value: sliderValue,
                                  onChanged: (value) =>
                                      setState(() => sliderValue = value),

                                  min: 1.0,
                                  max: 3.0,
                                  divisions: 2,
                                  label: sliderValue.toString(),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () =>
                                      setState(() =>
                                      sliderValue < 3
                                          ? sliderValue++
                                          : null),
                                  child: Icon(Icons.add),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () => setState(() => sliderValue = 3),
                                  child: Center(child: Icon(Icons.skip_next)),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Center(child: Text('1 Düşük - 2 Orta - 3 Yüksek')),
                      ],
                    ),
                  ),

                  // Button Area
                  Container(
                    child: Row(

                      children: [

                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: MaterialButton(
                              color: Theme.of(context).accentColor,
                              onPressed: () {},
                              child: Text('Vazgeç', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: MaterialButton(
                              color: Theme.of(context).accentColor,
                              onPressed: () {},
                              child: Text('Kaydet', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        )

                      ],

                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> createDropDownItem() {
    return categories
        .map((category) =>
        DropdownMenuItem<int>(
          value: category.categoryId,
          child: Container(child: Text(category.categoryTitle)),
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

  Widget titleWidget(String title) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.brightness_1,
                    size: 15,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                  SizedBox(width: 5),
                  Text(title,
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                ],
              ),
              Divider(thickness: 2)
            ],
          ),
        ),
      );
}
