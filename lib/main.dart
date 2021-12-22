import 'package:flutter/material.dart';
import 'package:kwg_softworks/app_router.dart';

void main() {
  runApp(KwgSoftWorks(
    appRouter: AppRouter(),
  ));
}

class KwgSoftWorks extends StatelessWidget {
  const KwgSoftWorks({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KWG SoftWorks",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
