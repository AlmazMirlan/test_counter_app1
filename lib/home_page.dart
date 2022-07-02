import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_counter_app/provider/counter.dart';
import 'package:test_counter_app/provider/weather.dart';
import 'package:test_counter_app/ui/widgets/floating_action_button.dart';
import 'provider/change_theme.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
        ChangeNotifierProvider.value(value: ChangesTheme(),
        ),
        ChangeNotifierProvider.value(value: Weather(),
        )
      ],
      child: AnimatedBuilder(
          animation: ChangesTheme.instance,
          builder: (context, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  brightness: ChangesTheme.instance.isDarkTheme
                      ? Brightness.dark
                      : Brightness.light,
                  visualDensity: VisualDensity.adaptivePlatformDensity
              ),
              home: MyHomePage(title: "Counter App"),);
          }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

    MyHomePage({required this.title,});
   final String title;


   @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  void _decrementCounter(BuildContext context){
    Provider.of<Counter>(context,listen: false).decrementCounter();
  }
  void _weather (BuildContext context){
    Provider.of<Weather>(context,listen: false).updateWeather([]);
  }


  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    var weather = Provider.of<Weather>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$weather'
            ),
            const SizedBox(height: 8.0,),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButtonWidget(
                onPressed: ()=> _weather(context) ,
                tooltip: 'Weather',
                child: const Icon(Icons.delete),
              ),
              // const SizedBox(height: 10,),
              FloatingActionButtonWidget(
                onPressed: () =>  ChangesTheme.instance.changeTheme(),
                tooltip: 'DarkTheme',
                child: const Icon(Icons.color_lens),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget> [
              FloatingActionButtonWidget(
                onPressed: () => _incrementCounter(context),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10,),
              FloatingActionButtonWidget(
                onPressed: ()=> _decrementCounter(context),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              )
            ],
          ),
        ],
      ),
    );
  }
}

