int main() {
  runApp(MyApp());
}



  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: DiceApp() ,

      );
    }
  }

  class DiceApp extends StatefulWidget {
    const DiceApp({super.key});

    @override
    State<DiceApp> createState() => _DiceAppState();
  }

  class _DiceAppState extends State<DiceApp> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appbar:AppBar(
          
        )

      );
    }
  }



