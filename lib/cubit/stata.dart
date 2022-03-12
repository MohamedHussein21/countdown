
abstract class TimerStates {
  final int duration;

  TimerStates(this.duration);
}


class TimerInitialState extends TimerStates{
  TimerInitialState(int duration) : super(duration);
}

class TimerReadyState extends TimerStates{
  TimerReadyState(int duration) : super(duration);

}

class TimerPauseState  extends TimerStates{
  TimerPauseState(int duration) : super(duration);

}
class TimerRunningState  extends TimerStates{
  TimerRunningState(int duration) : super(duration);

}

class TimerCompleteState  extends TimerStates{
  TimerCompleteState(int duration) : super(duration);

}

class TimerResetState  extends TimerStates{
  TimerResetState(int duration) : super(duration);

}

class TimerFinishState  extends TimerStates{
  TimerFinishState(int duration) : super(duration);

}

