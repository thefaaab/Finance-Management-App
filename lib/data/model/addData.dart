import 'package:hive/hive.dart';
part 'addData.g.dart';

@HiveType(typeId: 1)
class AddData extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String iande;
  @HiveField(4)
  DateTime dateTime;

  AddData(this.iande, this.amount, this.dateTime, this.explain, this.name);
}
