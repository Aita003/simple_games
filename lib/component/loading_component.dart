import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//----------------------------------------------------------------------

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/animated/loading.json'),
    );
  }
}
