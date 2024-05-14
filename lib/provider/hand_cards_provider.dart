import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod2_test_drive/model/hand_card.dart';

part 'hand_cards_provider.g.dart';

@riverpod
class HandCards extends _$HandCards {
  @override
  List<HandCard> build () {
    return [];
  }

  // 空の手札を一枚生成する関数
  void openEmptyHandCard() {
    final oldState = state;

    final newState = [
      ...oldState,
      HandCard(
        id: null,
        type: null,
      )
    ];

    state = newState;
  }
}