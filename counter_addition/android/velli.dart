floatingActionButton: Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
FloatingActionButton(
onPressed: _incrementCounter,
tooltip: 'Increment',
child: const Icon(Icons.add),
),
const SizedBox(width: 16), // spacing between buttons
FloatingActionButton(
onPressed: decrementCounter,
tooltip: 'Decrement',
child: const Icon(Icons.remove),
),
],
),
