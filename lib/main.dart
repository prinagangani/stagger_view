import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stagger_view/screens/provider/sta_provider.dart';
import 'package:stagger_view/screens/view/stagger_screen.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StagProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => StaggerScreen(),
        },
      ),
    ),
  );
}
