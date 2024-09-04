
class tasbihModel{

   int _count;
   String _date;
   String _note;

   tasbihModel(
       this._count,
       this._date,
       this._note
       );

  String get note => _note;

  set note(String value) {
    _note = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  int get count => _count;

  set count(int value) {
    _count = value;
  }



}