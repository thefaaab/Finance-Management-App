import 'package:finance_app/data/1.dart';

List<money> geterTop() {
  money mcFood = money();
  mcFood.time = 'March 09, 2023';
  mcFood.image = 'food.png';
  mcFood.buy = true;
  mcFood.fee = '- \₹ 597';
  mcFood.name = "McDonald's";

  money moneyTransfer = money();
  moneyTransfer.image = 'coin.png';
  moneyTransfer.time = 'Today';
  moneyTransfer.buy = true;
  moneyTransfer.fee = '- \₹ 2200';
  moneyTransfer.name = 'Money Transfer';
  return [moneyTransfer, mcFood];
}
