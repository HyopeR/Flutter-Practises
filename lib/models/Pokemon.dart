/// id : 2
/// num : "002"
/// name : "Ivysaur"
/// img : "http://www.serebii.net/pokemongo/pokemon/002.png"
/// type : ["Grass","Poison"]
/// height : "0.99 m"
/// weight : "13.0 kg"
/// candy : "Bulbasaur Candy"
/// candy_count : 100
/// egg : "Not in Eggs"
/// spawn_chance : 0.042
/// avg_spawns : 4.2
/// spawn_time : "07:00"
/// multipliers : [1.2,1.6]
/// weaknesses : ["Fire","Ice","Flying","Psychic"]
/// prev_evolution : [{"num":"001","name":"Bulbasaur"}]
/// next_evolution : [{"num":"003","name":"Venusaur"}]

class Pokemon {
  int _id;
  String _num;
  String _name;
  String _img;
  List<String> _type;
  String _height;
  String _weight;
  String _candy;
  int _candyCount;
  String _egg;
  double _spawnChance;
  double _avgSpawns;
  String _spawnTime;
  List<double> _multipliers;
  List<String> _weaknesses;
  List<Prev_evolution> _prevEvolution;
  List<Next_evolution> _nextEvolution;

  int get id => _id;
  String get num => _num;
  String get name => _name;
  String get img => _img;
  List<String> get type => _type;
  String get height => _height;
  String get weight => _weight;
  String get candy => _candy;
  int get candyCount => _candyCount;
  String get egg => _egg;
  double get spawnChance => _spawnChance;
  double get avgSpawns => _avgSpawns;
  String get spawnTime => _spawnTime;
  List<double> get multipliers => _multipliers;
  List<String> get weaknesses => _weaknesses;
  List<Prev_evolution> get prevEvolution => _prevEvolution;
  List<Next_evolution> get nextEvolution => _nextEvolution;

  Pokemon({
      int id, 
      String num, 
      String name, 
      String img, 
      List<String> type, 
      String height, 
      String weight, 
      String candy, 
      int candyCount, 
      String egg, 
      double spawnChance, 
      double avgSpawns, 
      String spawnTime, 
      List<double> multipliers, 
      List<String> weaknesses, 
      List<Prev_evolution> prevEvolution, 
      List<Next_evolution> nextEvolution}){
    _id = id;
    _num = num;
    _name = name;
    _img = img;
    _type = type;
    _height = height;
    _weight = weight;
    _candy = candy;
    _candyCount = candyCount;
    _egg = egg;
    _spawnChance = spawnChance;
    _avgSpawns = avgSpawns;
    _spawnTime = spawnTime;
    _multipliers = multipliers;
    _weaknesses = weaknesses;
    _prevEvolution = prevEvolution;
    _nextEvolution = nextEvolution;
}

  Pokemon.fromJson(dynamic json) {
    _id = json["id"];
    _num = json["num"];
    _name = json["name"];
    _img = json["img"];
    _type = json["type"] != null ? json["type"].cast<String>() : [];
    _height = json["height"];
    _weight = json["weight"];
    _candy = json["candy"];
    _candyCount = json["candyCount"];
    _egg = json["egg"];
    _spawnChance = json["spawnChance"];
    _avgSpawns = json["avgSpawns"];
    _spawnTime = json["spawnTime"];
    _multipliers = json["multipliers"] != null ? json["multipliers"].cast<double>() : [];
    _weaknesses = json["weaknesses"] != null ? json["weaknesses"].cast<String>() : [];
    if (json["prevEvolution"] != null) {
      _prevEvolution = [];
      json["prevEvolution"].forEach((v) {
        _prevEvolution.add(Prev_evolution.fromJson(v));
      });
    }
    if (json["nextEvolution"] != null) {
      _nextEvolution = [];
      json["nextEvolution"].forEach((v) {
        _nextEvolution.add(Next_evolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["num"] = _num;
    map["name"] = _name;
    map["img"] = _img;
    map["type"] = _type;
    map["height"] = _height;
    map["weight"] = _weight;
    map["candy"] = _candy;
    map["candyCount"] = _candyCount;
    map["egg"] = _egg;
    map["spawnChance"] = _spawnChance;
    map["avgSpawns"] = _avgSpawns;
    map["spawnTime"] = _spawnTime;
    map["multipliers"] = _multipliers;
    map["weaknesses"] = _weaknesses;
    if (_prevEvolution != null) {
      map["prevEvolution"] = _prevEvolution.map((v) => v.toJson()).toList();
    }
    if (_nextEvolution != null) {
      map["nextEvolution"] = _nextEvolution.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// num : "003"
/// name : "Venusaur"

class Next_evolution {
  String _num;
  String _name;

  String get num => _num;
  String get name => _name;

  Next_evolution({
      String num, 
      String name}){
    _num = num;
    _name = name;
}

  Next_evolution.fromJson(dynamic json) {
    _num = json["num"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["num"] = _num;
    map["name"] = _name;
    return map;
  }

}

/// num : "001"
/// name : "Bulbasaur"

class Prev_evolution {
  String _num;
  String _name;

  String get num => _num;
  String get name => _name;

  Prev_evolution({
      String num, 
      String name}){
    _num = num;
    _name = name;
}

  Prev_evolution.fromJson(dynamic json) {
    _num = json["num"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["num"] = _num;
    map["name"] = _name;
    return map;
  }

}
