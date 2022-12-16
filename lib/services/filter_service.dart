import '../core.dart';

class FilterService {
  List<Filter> getFilterList() {
    return <Filter>[
      // Filter("Best Match"),
      Filter("Highest Price"),
      Filter("Lowest Price"),
      Filter("Fuel"),
      Filter("Seating Capacity"),
      Filter("Brand"),
      Filter("Models"),
      Filter("Transmission"),
    ];
  }
}
