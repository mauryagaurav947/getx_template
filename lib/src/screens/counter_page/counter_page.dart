import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/src/controllers/controllers.dart';
import 'package:getx_template/src/l10n/app_localizations.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late List<CounterController> _counters;

  @override
  void initState() {
    super.initState();
    _counters = List.generate(5, (index) => CounterController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.counters),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
        },
        child: GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          itemCount: _counters.length,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return _card(_counters[index]);
          },
        ),
      ),
    );
  }

  Widget _card(CounterController controller) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Obx(() => _counterText(controller.counter)),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: controller.increment,
                icon: const Icon(Icons.add),
              ),
              const Spacer(),
              IconButton(
                onPressed: controller.decrement,
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _counterText(int counter) {
    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
