import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfapplication/general_providers.dart';

class AppDrawer extends HookConsumerWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const AppDrawer({required this.drawerKey, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      key: drawerKey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ref.watch(homeControllerProvider).primaryColor,
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                ),
                Text(
                  'TYB Institute',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pangolin',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/palette.png",
              height: 28,
            ),
            title: const Text(
              'Change Color',
              style: TextStyle(fontFamily: fontName),
            ),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    title: const Text(
                      "Change the color",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: fontName,
                      ),
                    ),
                    content: Wrap(
                      children: List.generate(
                        ref.watch(homeControllerProvider).colorOptions.length,
                        (index) {
                          // final rert = ref
                          //     .watch(homeControllerProvider)
                          //     .colorOptions[index];
                          return InkWell(
                            onTap: () {
                              ref
                                  .read(homeControllerProvider)
                                  .configColor(index);
                              Navigator.pop(context);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: ref
                                      .watch(homeControllerProvider)
                                      .colorOptions[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/privacy.png",
              height: 28,
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(fontFamily: fontName),
            ),
            onTap: () {
              Navigator.pop(context);
              // drawerKey.currentState!.closeDrawer();
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/gmail.png",
              height: 28,
            ),
            title: const Text(
              'Write to us',
              style: TextStyle(fontFamily: fontName),
            ),
            onTap: () {
              Navigator.pop(context);
              // drawerKey.currentState!.closeDrawer();
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/playstore.png",
              height: 28,
            ),
            title: const Text(
              'Rate this app',
              style: TextStyle(fontFamily: fontName),
            ),
            onTap: () {
              drawerKey.currentState!.closeDrawer();
            },
          ),
        ],
      ),
    );
  }
}

const String fontName = 'Pangolin';
