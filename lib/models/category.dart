class Category {

  int categoryId;
  String categoryTitle;

  // Kategori eklerken kullanılır. Çünkü Id auto increminent.
  Category(this.categoryTitle);

  // Kategoriler db'den okunurken kullanılır.
  Category.withId(this.categoryId, this.categoryTitle);

  // Kategori nesnesini Map'e çevirirken kullanılır.
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['categoryId'] = categoryId;
    map['categoryTitle'] = categoryTitle;
    return map;
  }

  // Db'den okunan değerleri kategori nesnesine çevirmek.
  Category.fromMap(Map<String, dynamic> map) {
    this.categoryId = map['categoryId'];
    this.categoryTitle = map['categoryTitle'];
  }

  @override
  String toString() {
    return 'Category{categoryId: $categoryId, categoryTitle: $categoryTitle}';
  }
}
