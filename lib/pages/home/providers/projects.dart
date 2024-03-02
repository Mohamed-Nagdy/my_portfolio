import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';

final projectsProvider =
    FutureProvider<QuerySnapshot<Map<String, dynamic>>>((ref) async {
  final db = FirebaseFirestore.instance;
  return db.collection(Constants.projects.name).get();
});
