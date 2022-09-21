import 'package:flutter/material.dart';

void main() => runApp(const LogoApp());

class LogoApp extends StatefulWidget {

  // Constructor
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() {
    return _LogoAppState();
  }
}


class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
  //
  //   // .. -> cascading operator, alternative dari syntax: // this.animation.addListener(() { });
  //   animation = Tween<double>(begin: 0.0, end: 300.0).animate(controller)..addListener(() {
  //     // Setiap kali angkanya berubah, mau ngapain?
  //     // Yang paling umum adalah memanggil method setState() -> Mentrigger update tampilan
  //     setState(() {
  //
  //     });
  //   });
  //
  //   controller.forward();
  // }

  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 500).animate(controller)..addListener(() {
      setState(() {
      // The state that has changed here is the animation object’s value.
      });
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
