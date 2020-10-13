import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notebook_app/components/common/title_widget.dart';
import 'package:notebook_app/models/category.dart';
import 'package:notebook_app/utils/database_helper.dart';

class CategoryPage extends StatefulWidget {
  String title;
  CategoryPage({this.title});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();


  DatabaseHelper dbHelper = DatabaseHelper();
  TabController tabController;

  List<Category> categories;
  bool categoriesController = false;

  int categoryIndex;
  int categoryId;
  String categoryTitle;

  @override
  void initState() {
    super.initState();
    getCategories();
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print('hello');

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom: categoryTabbar(),
      ),

      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Container(
            child: categoriesList(),
          ),
          Container(
            child: categoriesForm(),
          ),
        ],
      ),
    );
  }

  TabBar categoryTabbar() {

    return TabBar(
      controller: tabController,
      tabs: [
        Tab(
          icon: Icon(Icons.list),
          child: Text('Liste'),
        ),
        Tab(
          icon: Icon(Icons.note),
          child: Text('Form'),
        ),
      ],
    );

  }

  Widget categoriesList() => Container(
    child: Column(
      children: [
        Expanded(
          child: Container(
              child: categoriesController
                  ? ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: ListTile(

                      onTap: () {},
                      title: Text(categories[index].categoryTitle),
                      leading: CircleAvatar(
                          backgroundColor:
                          Theme.of(context).accentColor,
                          child: Text(categories[index].categoryTitle[0], style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                              Theme.of(context).textTheme.headline6.fontSize))),
                      trailing: Container(
                        width: (MediaQuery.of(context).size.width * 3) / 10,
                        child: ButtonBar(
                          children: [

                            IconButton(
                              splashRadius: 22,
                              onPressed: () {
                                tabController.animateTo(tabController.index + 1);

                                setState(() {
                                  categoryTitle = categories[index].categoryTitle;
                                  categoryId = categories[index].categoryId;
                                  categoryIndex = index;
                                });

                              },
                              icon: Icon(Icons.edit),
                            ),

                            IconButton(
                              splashRadius: 22,
                              onPressed: () => deleteCategory(categories[index].categoryId, index),
                              icon: Icon(Icons.delete),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ))
                  : Center(child: CircularProgressIndicator())),
        )
      ],
    ),
  );

  Widget categoriesForm() => Container(
    padding: EdgeInsets.all(10),
    child: Column(

      children: [
        titleWidget(context, 'Kategori Formu'),
        Container(
          child: Form(
            key: formKey,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                key: Key(categoryTitle),
                initialValue: categoryTitle != null ? categoryTitle : '',

                validator: (value) => value.length < 1 ? 'Kategori adı boş olamaz.' : null,

                onSaved: (value) => categoryTitle = value,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Kategori Adı',
                  labelText: 'Kategori',
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
          ),
        ),

        Container(
          child: Row(

            children: [

              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      setState(() {
                        categoryTitle = '';
                        categoryId = null;
                        categoryIndex = null;
                      });
                    },
                    child: Text('Sıfırla', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).accentColor,
                    onPressed: () => categoryId == null ? addCategory() : updateCategory(),
                    child: Text(categoryId == null ? 'Ekle' : 'Güncelle', style: TextStyle(color: Colors.white)),
                  ),
                ),
              )

            ],

          ),
        )

      ],

    ),
  );

  addCategory() async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      Category newCategory = Category(categoryTitle);
      int result = await dbHelper.addCategory(newCategory);

      if(result != -1) {
        newCategory.categoryId = result;
        setState(() {
          categories.add(newCategory);
        });
        tabController.animateTo(tabController.index - 1);
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Kategori Eklendi'),
          duration: Duration(seconds: 2),
        ));
      } else {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Kategori Ekleme Başarısız'),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  updateCategory() async{
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      Category updatedCategory = Category.withId(categoryId, categoryTitle);
      int result = await dbHelper.updateCategory(updatedCategory);

      if(result != -1) {
        setState(() {
          categories[categoryIndex] = updatedCategory;
        });
        tabController.animateTo(tabController.index - 1);
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Kategori Güncellendi'),
          duration: Duration(seconds: 2),
        ));
      } else {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Kategori Güncelleme Başarısız'),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  deleteCategory(int categoryId, int index) async {
    int result = await dbHelper.deleteCategory(categoryId);
    if (result != -1) {
      setState(() {
        categories.removeAt(index);
      });

      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Kategori Silindi'),
        duration: Duration(seconds: 2),
      ));
    } else {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Kategori Silme Başarısız'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  getCategories() async {
    List<Category> categoryData = await dbHelper.getCategories();
    setState(() {
      categories = categoryData;
      categoriesController = true;
    });
  }
}
