import 'package:flutter/material.dart';
import '/models/effectiveView.dart' as model;

class Tag extends StatelessWidget {
  final model.EffectiveView view;
  final bool active;
  final Function()? onTap;
  final Function()? onRemove;

  const Tag(
      {Key? key,
      required this.view,
      this.active = false,
      this.onTap,
      this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      child: InkWell(
        onTap: onTap?.call,
        child: Container(
          padding: const EdgeInsets.only(left: 6, right: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(238, 238, 238, 1),
            ),
            color: active ? const Color(0xff42b983) : null,
          ),
          height: 50,
          child: Row(
            children: [
              Text(
                view.title,
                style: TextStyle(
                  color: active ? Colors.white : null,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: onRemove?.call,
                child: const Icon(
                  Icons.cancel,
                  size: 14,
                  color: Color(0xfff56c6c),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
