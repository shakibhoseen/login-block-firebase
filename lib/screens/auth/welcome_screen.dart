import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(
      initialIndex: 0,
      length: 2, 
      vsync: this,
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(20, -1.2),
              child: Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.tertiary
                ),
              ),
            ),

            Align(
              alignment: const AlignmentDirectional(-2.7, -1.2),
              child: Container(
                height: MediaQuery.of(context).size.width/1.3,
                width: MediaQuery.of(context).size.width/1.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.secondary
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(2.7, -1.2),
              child: Container(
                height: MediaQuery.of(context).size.width/1.3,
                width: MediaQuery.of(context).size.width/1.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
            ),
            BackdropFilter(
              filter: ,
              child: Container(),),
          ],
          ),
        ),
      ),
    );
  }
}
