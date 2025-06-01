import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final connectivityStatusProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  return Connectivity().onConnectivityChanged;
});


final isConnectedProvider = Provider<bool>((ref) {
  final connectivityResultList = ref.watch(connectivityStatusProvider); // هنا سنستقبل قائمة

  return connectivityResultList.when(
    data: (results) {

      return results.any((result) => result != ConnectivityResult.none);
    },
    loading: () => false,
    error: (err, stack) => false, 
  );
});