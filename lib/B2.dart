import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ' Demo HD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String title_screen_2 = 'Cao Lobo';

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Card(
          child: ExpansionTile(
            title: Text('$title_screen_2'),
            leading: const Icon(Icons.movie_filter),
            children: [
              ListTile(
                title: Image.network(
                    'https://th.bing.com/th/id/R.aa47feea3a84710517f1530de005a118?rik=iqbyMz41p8Q0qw&pid=ImgRaw&r=0'),
                textColor: Color.fromARGB(255, 213, 28, 28),
                iconColor: Color.fromARGB(255, 213, 28, 28),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                // trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              ),
            ],
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$title_screen_2'),
      ),
      body: Container(
          margin: new EdgeInsets.only(top: 20.0),
          child: Center(
              child: Column(
            children: [
              Image.network(
                  'https://www.petdarling.com/wp-content/uploads/2014/07/perros-lobo-checoslovacos.jpg'),
              const Expanded(
                  child: Column(
                children: [Text('Dog')],
              ))
            ],
          ))),
    );
  }
}
