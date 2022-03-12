import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/event.dart';
import '../cubit/stata.dart';

class Actionss extends StatelessWidget {
  const Actionss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ActionButton(
          timerBloc: BlocProvider.of<TimerBloc>(context))!,
    );
  }
  List<Widget>? ActionButton ({required TimerBloc timerBloc}) {
    final TimerStates? currentState = timerBloc.state;
    if(currentState is TimerReadyState) {
      return [
        FloatingActionButton(
            child:const Icon(Icons.play_arrow),
            onPressed: (){
              timerBloc.add(ReadyEvent(duration: currentState.duration));
            }
        ),
      ];
    }
    if(currentState is TimerRunningState) {
      return [
        FloatingActionButton(
            child:const Icon(Icons.pause),
            onPressed: (){
              timerBloc.add(PauseEvent());
            }
        ),
        FloatingActionButton(
            child:const Icon(Icons.replay),
            onPressed: (){
              timerBloc.add(ResetEvent());
            }
        ),
      ];
    }
    if(currentState is TimerPauseState) {
      return [
        FloatingActionButton(
            child:const Icon(Icons.play_arrow),
            onPressed: (){
              timerBloc.add(CompleteEvent());
            }
        ),
        FloatingActionButton(
            child:const Icon(Icons.replay),
            onPressed: (){
              timerBloc.add(ResetEvent());
            }
        ),
      ];
    }

    if(currentState is TimerFinishState){
      return [
        FloatingActionButton(
            child:const Icon(Icons.play_arrow),
            onPressed: (){
              timerBloc.add(ResetEvent());
            }
        ),
      ];
    }
  }
}