class Note {

  int noteId;
  int categoryId;
  String categoryTitle;
  String noteTitle;
  String noteContent;
  String noteDate;
  int noteImportance;

  // Verileri yazarken
  Note(
      this.categoryId,
      this.noteTitle,
      this.noteContent,
      this.noteDate,
      this.noteImportance);

  // Verileri okurken
  Note.withId(
      this.noteId,
      this.categoryId,
      this.noteTitle,
      this.noteContent,
      this.noteDate,
      this.noteImportance);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['noteId'] = noteId;
    map['categoryId'] = categoryId;
    map['noteTitle'] = noteTitle;
    map['noteContent'] = noteContent;
    map['noteDate'] = noteDate;
    map['noteImportance'] = noteImportance;

    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this.noteId = map['noteId'];
    this.categoryId = map['categoryId'];
    this.categoryTitle = map['categoryTitle'];
    this.noteTitle = map['noteTitle'];
    this.noteContent = map['noteContent'];
    this.noteDate = map['noteDate'];
    this.noteImportance = map['noteImportance'];
  }

  @override
  String toString() {
    return 'Note{noteId: $noteId, categoryId: $categoryId, noteTitle: $noteTitle, noteContent: $noteContent, noteDate: $noteDate, noteImportance: $noteImportance}';
  }
}
