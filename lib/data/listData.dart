import 'package:finance_app/data/1.dart';

List<money> geter() {
  money transfer = money();
  transfer.buy = true;
  transfer.name = 'Angela';
  transfer.fee = '₹ 650';
  transfer.image = 'transfer.png';
  transfer.time = 'Today';

  money food = money();
  food.buy = true;
  food.fee = '₹ 289';
  food.image = 'burger.png';
  food.name = 'Starbucks';
  food.time = '2 days ago';

  money grocery = money();
  grocery.buy = true;
  grocery.fee = '₹ 686';
  grocery.image = 'grocery.png';
  grocery.name = 'Nesto hyper market';
  grocery.time = '4 days ago';

  money received = money();
  received.buy = false;
  received.fee = '₹ 250';
  received.image = 'received.png';
  received.name = 'Rico';
  received.time = '4 days ago';

  return [transfer, food, received, grocery, transfer, received, received];
}
