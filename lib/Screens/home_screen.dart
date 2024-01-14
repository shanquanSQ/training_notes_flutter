import 'package:flutter/material.dart';
import 'package:trngprotocol_app/Screens/training_a.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Training Protocol',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            centerTitle: true,
            backgroundColor: Colors.blueGrey.shade700,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Notes'),
                        content: const Text(
                          'Training notes provided by \n'
                          'Huberman Training Protocol',
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.info_rounded,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: Column(children: [
            const TabBar(tabs: [
              Tab(
                child: Text('Protocol A',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    )),
              ),
              Tab(
                child: Text('Protocol B',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    )),
              )
              // Tab(icon: Icon(Icons.home, color: Colors.deepOrange)),
              // Tab(icon: Icon(Icons.home, color: Colors.deepOrange))
            ]),
            Expanded(
              child: TabBarView(children: <Widget>[
                TrainingA(),
                Container(child: Center(child: Text('2nd')))
              ]),
            )
          ])),
    );
  }
}
