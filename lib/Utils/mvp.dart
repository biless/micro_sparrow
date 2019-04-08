import 'package:micro_sparrow/View/ITeamView.dart';

abstract class IView<T> {
}

abstract class IPresenter{
  void attach(IView view);
  void detach();
}