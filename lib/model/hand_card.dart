enum CardType { goods, weapon, trade, armor }

class HandCard {
  int? id;
  String? type;
  bool isSelected; //カードが選択されているか
  bool isDisabled; //カードが無効化されているか

  //コンストラクタ
  HandCard({
    required this.id,
    required this.type,
    this.isSelected = false,
    this.isDisabled = false,
  });
}