import 'dart:convert';

import 'package:azkar/models/section_model.dart';
import 'package:azkar/screens/section_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel> sections = [];
  @override
  void initState() {
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'أذكار المسلم',
          style: TextStyle(fontFamily: 'Tajawal'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildSectionItem(model: sections[index]),
          itemCount: sections.length,
        ),
        // children: [
        // buildSectionItem(text: 'أذكار الصباح'),
        // buildSectionItem(text: "أذكار المساء"),
        // buildSectionItem(text: "أذكار الصلاة"),

        // Container(
        //   width: double.infinity,
        //   height: 100,
        //   color: Colors.red,
        //   child: const Center(
        //     child: Text('أذكار الصباح',
        //         style: TextStyle(
        //             fontSize: 22.0,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.white)),
        //   ),
        // )
        // ],
      ),
    );
  }

  Widget buildSectionItem({required SectionModel model}) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  SectionDetailScreen(id: model.id!, title: model.name!)));
        },
        child: Container(
            margin: const EdgeInsets.only(top: 12.0),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.blue,
                    Colors.lightBlue
                  ]),
            ),
            // color: Colors.red,
            child: Center(
              child: Text(
                '${model.name}',
                style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )));
  }

  loadSections() async {
    // DefaultAssetBundle.of(context).loadString(key)
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      print(response);
      response.forEach((section) {
        // print(section['name']);
        SectionModel _section =
            SectionModel.fromJson(section as Map<String, dynamic>);
        // print(_section.name);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
