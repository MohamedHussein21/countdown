abstract class TimerEvent{
  const TimerEvent();
}

class ReadyEvent extends TimerEvent {
  final int duration;

  ReadyEvent({required this.duration});
}

class PauseEvent extends TimerEvent {}

class RunningEvent extends TimerEvent {}

class CompleteEvent extends TimerEvent {}

class ResetEvent extends TimerEvent {}

class Tick extends TimerEvent {
  final int duration;

  Tick({required this.duration});
}
