import 'package:task/task.dart' as task;
import 'dart:math';


double doubleInRange(Random source, num start, num end) => 
    source.nextDouble() * (end - start) + start;

void main() {
  double totalDistance = doubleInRange(Random(), 1, 30);
  double totalCost = calculateTotalCost(totalDistance);

  print("Пройденное расстояние: ${formatNumber(totalDistance)} км");
  print("Итоговая стоимость: ${formatNumber(totalCost)} тенге");
}

double calculateTotalCost(double totalDistance) {
  double shortDistanceTariff = 250.0;
  double mediumDistanceTariff = 200.0;
  double longDistanceTariff = 150.0;

  double economyRate = 1.0;
  double standardRate = 2.0;
  double premiumRate = 3.0;

  double totalCost = 0.0;

  for (double currentDistance = 0; currentDistance < totalDistance; currentDistance += 1.0) {
    double currentTariff = getCurrentTariff(currentDistance, shortDistanceTariff, mediumDistanceTariff, longDistanceTariff);
    double currentRate = getCurrentRate(currentTariff, economyRate, standardRate, premiumRate);

    totalCost += calculateSegmentCost(currentTariff, currentRate);
  }

  return totalCost;
}

double getCurrentTariff(double currentDistance, double shortDistanceTariff, double mediumDistanceTariff, double longDistanceTariff) {
  if (currentDistance < 10) {
    return shortDistanceTariff;
  } else if (currentDistance < 20) {
    return mediumDistanceTariff;
  } else {
    return longDistanceTariff;
  }
}

double getCurrentRate(double currentTariff, double economyRate, double standardRate, double premiumRate) {
  switch (currentTariff) {
    case 250.0:
      return economyRate;
    case 200.0:
      return standardRate;
    case 150.0:
      return premiumRate;
    default:
      return 1.0;
  }
}

double calculateSegmentCost(double currentTariff, double currentRate) {
  return currentTariff * currentRate;
}

String formatNumber(double number) {
  return number.toStringAsFixed(2);
}