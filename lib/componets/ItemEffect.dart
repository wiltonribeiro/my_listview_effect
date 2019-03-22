import 'package:flutter/material.dart';
import 'package:my_listview_effect/bloc/ListBloc.dart';

class ItemEffect extends StatefulWidget{
  final int position;
  final Widget child;
  final Duration duration;
  ItemEffect({this.position, this.child, this.duration});
  _ItemEffect createState() => new _ItemEffect();
}

class _ItemEffect extends State<ItemEffect> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetFloat = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
        .animate(_controller);
    
  }

    @override
    Widget build(BuildContext context){
      return new StreamBuilder(stream: new ListBloc().listenAnimation, initialData: -1, builder: (context, AsyncSnapshot<int> snapshot){
        if(snapshot.data >= widget.position && snapshot.data > -1) _controller.forward();
        return SlideTransition(position: _offsetFloat, child:
          widget.child
        );
      });
    }
  
}