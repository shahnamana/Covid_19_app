class OpeningHours
{
  final String openingHrs;

  OpeningHours(this.openingHrs);
  
  OpeningHours.fromJson(Map<dynamic, dynamic> prasedJson):
    openingHrs = prasedJson['open_now'].toString();
}