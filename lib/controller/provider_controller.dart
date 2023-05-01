
import 'package:earncash/controller/scratch_card_controller.dart';
import 'package:earncash/controller/scratchcard_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersController = [
  ChangeNotifierProvider.value(value: PrivacyController()),
  ChangeNotifierProvider.value(value: ScratchCardController()),
];