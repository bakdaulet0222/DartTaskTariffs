
import 'dart:math';
import 'task.dart';

double doubleInRange(Random source, num start, num end) => 
    source.nextDouble() * (end - start) + start;

void main() {
  double totalDistance = doubleInRange(Random(), 1 , 30);
  double totalCost = calculateTotalCost(totalDistance);

  print("Пройденное расстояние: ${formatNumber(totalDistance)} км");
  print("Итоговая стоимость: ${formatNumber(totalCost)} тенге");
}