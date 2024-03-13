import 'package:flutter/material.dart';
import 'package:weather_siren/ui/utils/context_extensions.dart';

import 'loading_indicator.dart';

class LoadingBarrier extends StatelessWidget {
  const LoadingBarrier({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primaryContainer.withOpacity(.2),
      child: GestureDetector(
        child: const Center(child: LoadingIndicator(size: 55, dotSize: 3.5)),
      ),
    );
  }
}
