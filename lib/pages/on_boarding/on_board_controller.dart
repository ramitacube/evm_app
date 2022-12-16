
import 'package:mvc_pattern/mvc_pattern.dart';

class OnBoardController extends ControllerMVC{

  List<String> obImages = <String>[];
  List<String> header = <String>[];
  List<String> subHeader = <String>[];

  void listenForobImages() async {
    obImages.add("assets/images/by_my_car.png");
    obImages.add("assets/images/off_road.png");
    obImages.add("assets/images/city_driver.png");

  }
  void listenForHeaderText() async {
    header.add("Rental Portal");
    header.add("Rental Portal");
    header.add("Rental Portal");
  }

  void listenForSubHeaderText() async {
    header.add("We take special care to make sure your booking experience with EVM Wheels is always Simple, Fast and 100% Secure");
    header.add("We process your refunds and payments without any hassles.");
    header.add("Our prices include taxes & insurance. We have no hidden charges.");
  }
}