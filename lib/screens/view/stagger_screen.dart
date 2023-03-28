import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:stagger_view/screens/provider/sta_provider.dart';

class StaggerScreen extends StatefulWidget {
  const StaggerScreen({Key? key}) : super(key: key);

  @override
  State<StaggerScreen> createState() => _StaggerScreenState();
}

StagProvider? sf;
StagProvider? st;

class _StaggerScreenState extends State<StaggerScreen> {
  @override
  Widget build(BuildContext context) {
    sf = Provider.of<StagProvider>(context, listen: false);
    st = Provider.of<StagProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text(
            "Staggered View",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            pattern: [
              WovenGridTile(1),
              WovenGridTile(
                6 / 9,
                crossAxisRatio: 0.8,
                alignment: AlignmentDirectional.center,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: 7,
            (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.grey.shade600,
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          child: Image.asset(
                            "${st!.image[index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                                child: Text(
                              "${st!.name[index]}",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
