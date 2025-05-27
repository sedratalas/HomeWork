import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final counterProvider = StateProvider<int>((ref) => 0);

class RiverpodCounter extends ConsumerWidget {
  const RiverpodCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$counter',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state--;
                  },
                  child: Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state = 0;
                  },
                  child: Text("Reset"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}