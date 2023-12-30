import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/data_class.dart';
import '../providers.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  List<DataClass> dataClass = [
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
    DataClass(rollNo: 12, fee: 12.77, name: "talah"),
  ];
  //int count = 0;

  @override
  Widget build(BuildContext context) {
   int count= ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: dataClass.length,
        itemBuilder: (context, index) {
          return MyWidget(
            name: dataClass[index].name,
            count: count,
            incrementFun: () {
              print(index);
                ref
                  .read(stateProvider.notifier)
                  .increment(index: index, list: dataClass);
              print(count);
            },
            decrementFun: () {
               ref
                  .read(stateProvider.notifier)
                  .decrement(index: index, list: dataClass);
              print(count);
            },
            widget: Text(dataClass[index].value.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

typedef IncrementFun = void Function();
typedef DecrementFun = void Function();

class MyWidget extends ConsumerStatefulWidget {
  final String name;
  final int count;
  final IncrementFun incrementFun;
  final DecrementFun decrementFun;
  final Widget widget;
  const MyWidget({
    super.key,
    required this.name,
    required this.count,
    required this.incrementFun,
    required this.widget,
    required this.decrementFun,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  late String name;
  late int count;
  late IncrementFun incrementFun;
  late DecrementFun decrementFun;
  @override
  void initState() {
    super.initState();
    name = widget.name;
    count = widget.count;
    incrementFun = widget.incrementFun;
    decrementFun = widget.decrementFun;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(name),
        subtitle: TextButton(
          onPressed: incrementFun,
          // onPressed: () {
          //   count = ref
          //       .read(stateProvider.notifier)
          //       .increment(index: index, list: list);
          //   // setState(() {
          //   //   count = count + 1;
          //   // });
          // },
          child: const Text('Increment'),
        ),
        title: TextButton(
          onPressed: decrementFun,
          child: const Text('decrement'),
        ),
        trailing: widget.widget);
  }
}

Future<dynamic> data({required String a}) {
  return Future.value(a);
}
