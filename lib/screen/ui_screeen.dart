
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskcat2/cubit/cubit.dart';
import 'package:taskcat2/cubit/stata.dart';
import 'package:taskcat2/screen/action.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class FirstPage extends StatelessWidget {
  int duration = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Timer '),
      ),
      body: Stack(
        children: [
          buildWaveWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: BlocBuilder<TimerBloc, TimerStates>(
                    builder: (context, state) {
                  final String minPlace =
                      ((duration / 60) % 60).floor().toString().padLeft(2, '0');
                  final String secPlace =
                      ((duration % 60)).floor().toString().padLeft(2, '0');
                  return Text(
                    '$minPlace : $secPlace',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  );
                }),
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<TimerBloc, TimerStates>(
                buildWhen: (previousState, currentState) =>
                    currentState.runtimeType != previousState.runtimeType,
                builder: (context, state) {
                  return  Actionss();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  WaveWidget buildWaveWidget() {
    return WaveWidget(
          config: CustomConfig(
            gradients: const [
              [
                Color.fromRGBO(72, 74, 126, 1),
                Color.fromRGBO(125, 172, 206, 1),
                Color.fromRGBO(128, 198, 245, 0.7),
              ],
              [
                Color.fromRGBO(72, 74, 126, 1),
                Color.fromRGBO(125, 172, 206, 1),
                Color.fromRGBO(172, 182, 219, 0.7),
              ],
              [
                Color.fromRGBO(74, 75, 126, 1),
                Color.fromRGBO(130, 170, 206, 1),
                Color.fromRGBO(172, 170, 219, 0.7),
              ]
            ],
            durations: [19440, 10800, 6000],
            heightPercentages: [0.03, 0.01, 0.02],
            gradientBegin: Alignment.bottomCenter,
            gradientEnd: Alignment.topCenter,
          ),
          size: const Size(
            double.infinity,
            double.infinity,
          ),
        );
  }



}


