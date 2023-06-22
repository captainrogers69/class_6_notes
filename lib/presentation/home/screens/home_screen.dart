import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfapplication/general_providers.dart';
import 'package:pdfapplication/presentation/home/compo/app_drawer.dart';

import 'chapters/screen/chapter_screen.dart';

class SubjModel {
  const SubjModel(
      {required this.subjectName,
      required this.backasset,
      required this.frontasset,
      required this.subject});
  final String subjectName, frontasset, backasset;
  final Subject subject;
}

final _subjectData = [
  const SubjModel(
    subjectName: "Maths Notes",
    backasset: 'assets/images/mathsblur.jpg',
    frontasset: 'assets/images/mathsborder.jpg',
    subject: Subject.Maths,
  ),
  const SubjModel(
    subjectName: "Science Notes",
    backasset: 'assets/images/scienceblur.jpg',
    frontasset: 'assets/images/scienceborder.jpg',
    subject: Subject.Science,
  ),
  const SubjModel(
    subjectName: "Hindi Notes",
    backasset: 'assets/images/hindiblur.jpg',
    frontasset: 'assets/images/hindiborder.jpg',
    subject: Subject.Hindi,
  ),
  const SubjModel(
    subjectName: "Socials Notes",
    backasset: 'assets/images/socialblur.jpg',
    frontasset: 'assets/images/socialborder.jpg',
    subject: Subject.Socials,
  ),
  const SubjModel(
    subjectName: "English Notes",
    backasset: 'assets/images/englishblur.jpg',
    frontasset: 'assets/images/englishborder.jpg',
    subject: Subject.English,
  ),
  const SubjModel(
    subjectName: "English2 Notes",
    backasset: 'assets/images/english2blur.jpg',
    frontasset: 'assets/images/english2border.jpg',
    subject: Subject.English2,
  ),
];

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ref.watch(homeControllerProvider).primaryColor,
        title: const Text('Class 6 Notes'),
      ),
      drawer: AppDrawer(drawerKey: drawerKey),
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          _subjectData.length,
          (index) {
            final subj = _subjectData[index];
            return HomeCard(
              subjectName: subj.subjectName,
              backasset: subj.backasset,
              frontasset: subj.frontasset,
              subject: subj.subject,
            );
          },
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.subjectName,
      required this.backasset,
      required this.frontasset,
      required this.subject});
  final String subjectName, frontasset, backasset;
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChapterScreen(subject: subject.name),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset(
                  backasset,
                  height: 150,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 4),
                  child: Image.asset(
                    frontasset,
                    height: 125,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    subjectName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pangolin',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
