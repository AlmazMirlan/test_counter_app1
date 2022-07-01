import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_counter_app/providers/counter.dart';
import 'package:test_counter_app/ui/widgets/floating_action_button.dart';

import 'providers/change_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
        ChangeNotifierProvider.value(value: ChangesTheme(),
        ),
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
              home: MyHomePage(title: ""),);
          }
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
   MyHomePage({required this.title});

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  void _decrementCounter(BuildContext context){
    Provider.of<Counter>(context,listen: false).decrementCounter();
  }



  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
        //crossAxisAlignment: CrossAxisAlignment.end,
        children:<Widget> [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // FloatingActionButtonWidget(
              //   onPressed: (){} ,
              //   tooltip: 'trash',
              //   child: Icon(Icons.delete),
              // ),
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
            // crossAxisAlignment: CrossAxisAlignment.end,
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
