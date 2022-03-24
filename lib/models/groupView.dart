import './baseView.dart';

class GroupView extends BaseView {
  List<BaseView> children = [];

  GroupView({required name, required title, icon, List<BaseView>? children})
      : super(name: name, title: title, icon: icon) {
    if (children != null) {
      this.children = children;
      for (var child in children) {
        child.parent = this;
      }
    }
  }
}
