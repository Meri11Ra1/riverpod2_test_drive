import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_test_drive/provider/hand_cards_provider.dart';

enum CardType { goods, weapon, trade, armor }

void main() {

  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handCardsNotifier = ref.read(handCardsProvider.notifier);
    final handCards = ref.watch(handCardsProvider);

    final listView = ListView.builder(
      itemCount: handCardsNotifier.state.length,
      itemBuilder: (_, index) {
        // index番目の文字
        final text = Text(handCardsNotifier.state[index].type.toString());
        return Card(child: text);
      },
    );

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: listView),
              ElevatedButton(
                onPressed: () {
                  handCardsNotifier.openEmptyHandCard();
                },
                child: Text('Add Empty Card'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  handCardsNotifier.state.asMap().forEach((index, e) { 
                    handCardsNotifier.state[index].id = 1;
                    handCardsNotifier.state[index].type = 'goods';
                    debugPrint('state: ${handCardsNotifier.state[index].id}');
                  });
                },
                child: Text('Add Card Detail'),
              ),
            ],
          ),
        )
          //   ElevatedButton(
          //     onPressed: () {
          //       ref.read(handCardsProvider.notifier).openEmptyHandCard();
          //     },
          //     child: Text('Add HandCard'),
          //   ),
          // ],
      ),
    );
  }
}
