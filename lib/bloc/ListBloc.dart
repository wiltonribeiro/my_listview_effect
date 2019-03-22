import 'package:rxdart/rxdart.dart';

class ListBloc {

  static ListBloc _listBloc;

  factory ListBloc(){
    if(_listBloc == null)
      _listBloc = new ListBloc._();

    return _listBloc;
  }

  PublishSubject<int> _positionItem;

  ListBloc._(){
    _positionItem = new PublishSubject<int>();
  }

  Observable<int> get listenAnimation => _positionItem.stream;

  void startAnimation(int limit, Duration duration) async {
    for(var i = -1; i<limit; i++){
      await new Future.delayed(duration, (){
        _updatePosition(i);
      });
    }
  }

  void _updatePosition(int position){
    _positionItem.add(position);
  }

  dispose(){
    _listBloc = null;
    _positionItem.close();
  }

}