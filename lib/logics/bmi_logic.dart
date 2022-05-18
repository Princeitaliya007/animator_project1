import '../variables.dart';

void bmiLogic(){
  double heightis = sliderval.toDouble() / 100;
  double weightis = weight.toDouble();

  heightsquare = heightis * heightis;
  result = weightis / heightsquare;

}