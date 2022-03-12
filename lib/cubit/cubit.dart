import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:taskcat2/cubit/event.dart';
import 'package:taskcat2/cubit/stata.dart';

import '../ticker.dart';

class TimerBloc extends Bloc<TimerEvent,TimerStates>{
  TimerBloc({required Ticker ticker}) : _ticker = ticker, super(TimerInitialState(_duration));

  final Ticker _ticker;
  static const int _duration = 60;
   StreamSubscription<int>? _tickerSubscription;


  @override
  TimerStates get initialState =>TimerReadyState(_duration);

  @override
  Stream<TimerStates> mapEventToState(TimerEvent event)async*{

    if(event is ReadyEvent) {

        yield TimerReadyState(event.duration);
        _tickerSubscription?.resume();
        _tickerSubscription =_ticker.tick(ticks: event.duration).listen((duration) {
          add(Tick(duration: duration));
        }) ;

    }else if (event is PauseEvent){
      if(state is TimerRunningState) {
        _tickerSubscription?.pause();
        yield TimerPauseState(state.duration);
      }
    }
    else if (event is CompleteEvent){
      if(state is TimerPauseState){
        _tickerSubscription?.resume();
        yield TimerRunningState(state.duration);
      }
    }else if (event is ResetEvent){
      _tickerSubscription?.cancel();
      yield TimerReadyState(state.duration);
    }else if (event is Tick){
      yield event.duration >0 ? TimerRunningState(state.duration): TimerFinishState(state.duration);
    }

    @override
    Future<void> close(){
      _tickerSubscription?.cancel();
      return super.close();
    }
  }







}











//   final Ticker _ticker;
//   static const int _duration = 60;
//
//   StreamSubscription<int>? _tickerSubscription;
//
//   Stream<void> start (int duration)async*{
//     emit(TimerReadyState(_duration));
//     _tickerSubscription?.cancel();
//     _tickerSubscription = _ticker.tick(ticks: _duration).listen((duration) {
//     });
//   }
//
//   Stream<void> pause (int duration)async*{
//     emit(TimerPauseState(_duration));
//     _tickerSubscription?.pause();
//
//   }
//
//   Stream<void> complete (int duration)async*{
//     emit(TimerPauseState(_duration));
//     if(state == TimerPauseState(_duration)) {
//     _tickerSubscription?.resume();
//     }
//
//   }
//
//   Stream<void> reset (int duration)async*{
//     emit(TimerPauseState(_duration));
//     _tickerSubscription?.cancel();
//
//     yield start(_duration);
//
//   }
//
//   bool isplay =false;
//   IconData readyIcon =Icons.play_arrow ;
//
//   void changeIcon() {
// emit(ChangeIconsState());
// if(isplay == false) {
//   readyIcon =Icons.play_arrow ;
//
// }else {
//   Row(
//     children: const [
//       Icon(Icons.pause),
//       SizedBox(width: 20,),
//       Icon(Icons.replay),
//
//     ],
//   );
// }
