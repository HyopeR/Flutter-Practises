/// consolidated_weather : [{"id":4691675709440000,"weather_state_name":"Clear","weather_state_abbr":"c","wind_direction_compass":"E","created":"2020-10-22T13:16:58.765921Z","applicable_date":"2020-10-22","min_temp":9.225,"max_temp":22.075000000000003,"the_temp":19.64,"wind_speed":1.7474287536970756,"wind_direction":99.09418476835775,"air_pressure":1023,"humidity":57,"visibility":14.457754215382169,"predictability":68},{"id":4824900561797120,"weather_state_name":"Clear","weather_state_abbr":"c","wind_direction_compass":"E","created":"2020-10-22T13:17:01.645937Z","applicable_date":"2020-10-23","min_temp":10.83,"max_temp":24.03,"the_temp":23.130000000000003,"wind_speed":2.6626784096741694,"wind_direction":85.00152669071971,"air_pressure":1020.5,"humidity":41,"visibility":14.76005130040563,"predictability":68},{"id":5275296535150592,"weather_state_name":"Light Cloud","weather_state_abbr":"lc","wind_direction_compass":"E","created":"2020-10-22T13:17:04.647204Z","applicable_date":"2020-10-24","min_temp":10.254999999999999,"max_temp":24.755000000000003,"the_temp":22.98,"wind_speed":1.5491013016331294,"wind_direction":99.21205312696263,"air_pressure":1018,"humidity":38,"visibility":14.83741201383918,"predictability":70},{"id":6570175823347712,"weather_state_name":"Light Cloud","weather_state_abbr":"lc","wind_direction_compass":"ESE","created":"2020-10-22T13:17:07.746198Z","applicable_date":"2020-10-25","min_temp":10.96,"max_temp":24.78,"the_temp":23.04,"wind_speed":1.4407967680532359,"wind_direction":119.64191178632653,"air_pressure":1015.5,"humidity":35,"visibility":14.699778294758609,"predictability":70},{"id":4921694360698880,"weather_state_name":"Heavy Cloud","weather_state_abbr":"hc","wind_direction_compass":"SE","created":"2020-10-22T13:17:10.761360Z","applicable_date":"2020-10-26","min_temp":12.65,"max_temp":24.3,"the_temp":23.155,"wind_speed":3.326181353389538,"wind_direction":133.6644475430341,"air_pressure":1015,"humidity":33,"visibility":14.483230434263898,"predictability":71},{"id":4751734250405888,"weather_state_name":"Clear","weather_state_abbr":"c","wind_direction_compass":"SSW","created":"2020-10-22T13:17:14.385865Z","applicable_date":"2020-10-27","min_temp":11.915,"max_temp":23.42,"the_temp":22.56,"wind_speed":2.778171677403961,"wind_direction":193.49999999999997,"air_pressure":1016,"humidity":38,"visibility":9.999726596675416,"predictability":68}]
/// time : "2020-10-22T18:45:41.498458+03:00"
/// sun_rise : "2020-10-22T07:06:40.692612+03:00"
/// sun_set : "2020-10-22T17:58:41.969066+03:00"
/// timezone_name : "LMT"
/// parent : {"title":"Turkey","location_type":"Country","woeid":23424969,"latt_long":"38.957741,35.431702"}
/// sources : [{"title":"BBC","slug":"bbc","url":"http://www.bbc.co.uk/weather/","crawl_rate":360},{"title":"Forecast.io","slug":"forecast-io","url":"http://forecast.io/","crawl_rate":480},{"title":"Met Office","slug":"met-office","url":"http://www.metoffice.gov.uk/","crawl_rate":180},{"title":"OpenWeatherMap","slug":"openweathermap","url":"http://openweathermap.org/","crawl_rate":360},{"title":"Weather Underground","slug":"wunderground","url":"https://www.wunderground.com/?apiref=fc30dc3cd224e19b","crawl_rate":720},{"title":"World Weather Online","slug":"world-weather-online","url":"http://www.worldweatheronline.com/","crawl_rate":360}]
/// title : "Ankara"
/// location_type : "City"
/// woeid : 2343732
/// latt_long : "39.942928,32.860481"
/// timezone : "Europe/Istanbul"

class Weather {
  List<Consolidated_weather> _consolidatedWeather;
  String _time;
  String _sunRise;
  String _sunSet;
  String _timezoneName;
  Parent _parent;
  List<Sources> _sources;
  String _title;
  String _locationType;
  int _woeid;
  String _lattLong;
  String _timezone;

  List<Consolidated_weather> get consolidatedWeather => _consolidatedWeather;
  String get time => _time;
  String get sunRise => _sunRise;
  String get sunSet => _sunSet;
  String get timezoneName => _timezoneName;
  Parent get parent => _parent;
  List<Sources> get sources => _sources;
  String get title => _title;
  String get locationType => _locationType;
  int get woeid => _woeid;
  String get lattLong => _lattLong;
  String get timezone => _timezone;

  Weather({
      List<Consolidated_weather> consolidatedWeather, 
      String time, 
      String sunRise, 
      String sunSet, 
      String timezoneName, 
      Parent parent, 
      List<Sources> sources, 
      String title, 
      String locationType, 
      int woeid, 
      String lattLong, 
      String timezone}){
    _consolidatedWeather = consolidatedWeather;
    _time = time;
    _sunRise = sunRise;
    _sunSet = sunSet;
    _timezoneName = timezoneName;
    _parent = parent;
    _sources = sources;
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
    _timezone = timezone;
}

  Weather.fromJson(dynamic json) {
    if (json["consolidatedWeather"] != null) {
      _consolidatedWeather = [];
      json["consolidatedWeather"].forEach((v) {
        _consolidatedWeather.add(Consolidated_weather.fromJson(v));
      });
    }
    _time = json["time"];
    _sunRise = json["sunRise"];
    _sunSet = json["sunSet"];
    _timezoneName = json["timezoneName"];
    _parent = json["parent"] != null ? Parent.fromJson(json["parent"]) : null;
    if (json["sources"] != null) {
      _sources = [];
      json["sources"].forEach((v) {
        _sources.add(Sources.fromJson(v));
      });
    }
    _title = json["title"];
    _locationType = json["locationType"];
    _woeid = json["woeid"];
    _lattLong = json["lattLong"];
    _timezone = json["timezone"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_consolidatedWeather != null) {
      map["consolidatedWeather"] = _consolidatedWeather.map((v) => v.toJson()).toList();
    }
    map["time"] = _time;
    map["sunRise"] = _sunRise;
    map["sunSet"] = _sunSet;
    map["timezoneName"] = _timezoneName;
    if (_parent != null) {
      map["parent"] = _parent.toJson();
    }
    if (_sources != null) {
      map["sources"] = _sources.map((v) => v.toJson()).toList();
    }
    map["title"] = _title;
    map["locationType"] = _locationType;
    map["woeid"] = _woeid;
    map["lattLong"] = _lattLong;
    map["timezone"] = _timezone;
    return map;
  }

}

/// title : "BBC"
/// slug : "bbc"
/// url : "http://www.bbc.co.uk/weather/"
/// crawl_rate : 360

class Sources {
  String _title;
  String _slug;
  String _url;
  int _crawlRate;

  String get title => _title;
  String get slug => _slug;
  String get url => _url;
  int get crawlRate => _crawlRate;

  Sources({
      String title, 
      String slug, 
      String url, 
      int crawlRate}){
    _title = title;
    _slug = slug;
    _url = url;
    _crawlRate = crawlRate;
}

  Sources.fromJson(dynamic json) {
    _title = json["title"];
    _slug = json["slug"];
    _url = json["url"];
    _crawlRate = json["crawlRate"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["slug"] = _slug;
    map["url"] = _url;
    map["crawlRate"] = _crawlRate;
    return map;
  }

}

/// title : "Turkey"
/// location_type : "Country"
/// woeid : 23424969
/// latt_long : "38.957741,35.431702"

class Parent {
  String _title;
  String _locationType;
  int _woeid;
  String _lattLong;

  String get title => _title;
  String get locationType => _locationType;
  int get woeid => _woeid;
  String get lattLong => _lattLong;

  Parent({
      String title, 
      String locationType, 
      int woeid, 
      String lattLong}){
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
}

  Parent.fromJson(dynamic json) {
    _title = json["title"];
    _locationType = json["locationType"];
    _woeid = json["woeid"];
    _lattLong = json["lattLong"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["locationType"] = _locationType;
    map["woeid"] = _woeid;
    map["lattLong"] = _lattLong;
    return map;
  }

}

/// id : 4691675709440000
/// weather_state_name : "Clear"
/// weather_state_abbr : "c"
/// wind_direction_compass : "E"
/// created : "2020-10-22T13:16:58.765921Z"
/// applicable_date : "2020-10-22"
/// min_temp : 9.225
/// max_temp : 22.075000000000003
/// the_temp : 19.64
/// wind_speed : 1.7474287536970756
/// wind_direction : 99.09418476835775
/// air_pressure : 1023
/// humidity : 57
/// visibility : 14.457754215382169
/// predictability : 68

class Consolidated_weather {
  int _id;
  String _weatherStateName;
  String _weatherStateAbbr;
  String _windDirectionCompass;
  String _created;
  String _applicableDate;
  double _minTemp;
  double _maxTemp;
  double _theTemp;
  double _windSpeed;
  double _windDirection;
  int _airPressure;
  int _humidity;
  double _visibility;
  int _predictability;

  int get id => _id;
  String get weatherStateName => _weatherStateName;
  String get weatherStateAbbr => _weatherStateAbbr;
  String get windDirectionCompass => _windDirectionCompass;
  String get created => _created;
  String get applicableDate => _applicableDate;
  double get minTemp => _minTemp;
  double get maxTemp => _maxTemp;
  double get theTemp => _theTemp;
  double get windSpeed => _windSpeed;
  double get windDirection => _windDirection;
  int get airPressure => _airPressure;
  int get humidity => _humidity;
  double get visibility => _visibility;
  int get predictability => _predictability;

  Consolidated_weather({
      int id, 
      String weatherStateName, 
      String weatherStateAbbr, 
      String windDirectionCompass, 
      String created, 
      String applicableDate, 
      double minTemp, 
      double maxTemp, 
      double theTemp, 
      double windSpeed, 
      double windDirection, 
      int airPressure, 
      int humidity, 
      double visibility, 
      int predictability}){
    _id = id;
    _weatherStateName = weatherStateName;
    _weatherStateAbbr = weatherStateAbbr;
    _windDirectionCompass = windDirectionCompass;
    _created = created;
    _applicableDate = applicableDate;
    _minTemp = minTemp;
    _maxTemp = maxTemp;
    _theTemp = theTemp;
    _windSpeed = windSpeed;
    _windDirection = windDirection;
    _airPressure = airPressure;
    _humidity = humidity;
    _visibility = visibility;
    _predictability = predictability;
}

  Consolidated_weather.fromJson(dynamic json) {
    _id = json["id"];
    _weatherStateName = json["weatherStateName"];
    _weatherStateAbbr = json["weatherStateAbbr"];
    _windDirectionCompass = json["windDirectionCompass"];
    _created = json["created"];
    _applicableDate = json["applicableDate"];
    _minTemp = json["minTemp"];
    _maxTemp = json["maxTemp"];
    _theTemp = json["theTemp"];
    _windSpeed = json["windSpeed"];
    _windDirection = json["windDirection"];
    _airPressure = json["airPressure"];
    _humidity = json["humidity"];
    _visibility = json["visibility"];
    _predictability = json["predictability"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["weatherStateName"] = _weatherStateName;
    map["weatherStateAbbr"] = _weatherStateAbbr;
    map["windDirectionCompass"] = _windDirectionCompass;
    map["created"] = _created;
    map["applicableDate"] = _applicableDate;
    map["minTemp"] = _minTemp;
    map["maxTemp"] = _maxTemp;
    map["theTemp"] = _theTemp;
    map["windSpeed"] = _windSpeed;
    map["windDirection"] = _windDirection;
    map["airPressure"] = _airPressure;
    map["humidity"] = _humidity;
    map["visibility"] = _visibility;
    map["predictability"] = _predictability;
    return map;
  }

}