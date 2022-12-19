import 'package:dio_log/http_log_list_widget.dart';
import 'package:faneron_mobile/src/common/providers/perfomance.dart';
import 'package:faneron_mobile/src/core/presentation/widget/modals/dialog.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToolButtons extends StatelessWidget {
  const ToolButtons({Key? key}) : super(key: key);

  _onNetworkPressed(BuildContext context) {
    showDefaultDialog(
        context: context, builder: (context) => HttpLogListWidget());
  }

  _onPerformancePressed(BuildContext context) {
    final isShow = context.read<PerformanceProvider>().isShowPerformance;
    context.read<PerformanceProvider>().changeStatus(!isShow);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Debug mode',
            style: TextStyle(
              fontSize: 20,
              color: ColorsApp.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                label: Icon(Icons.network_wifi),
                onPressed: () => _onNetworkPressed(context),
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 50),
              PrimaryButton(
                label: Icon(Icons.remove_red_eye),
                onPressed: () => _onPerformancePressed(context),
                height: 40,
                width: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const double _defaultWidth = double.infinity;

class AppButtonEssential extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double width;
  final double height;
  final double? radius;
  final Function()? onPressed;

  AppButtonEssential({
    this.child,
    this.color,
    this.width = _defaultWidth,
    this.height = 40,
    this.radius,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: color,
            child: Center(child: child),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                highlightColor: Colors.white.withOpacity(.3),
                splashColor: Colors.white.withOpacity(.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    required this.label,
    required this.onPressed,
    this.color,
    this.width,
    this.height,
    this.radius,
  });

  final Widget label;
  final Function()? onPressed;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return AppButtonEssential(
      radius: radius,
      width: width ?? _defaultWidth,
      height: height ?? 40,
      onPressed: onPressed,
      color: color ?? Colors.grey,
      child: DefaultTextStyle(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
        child: label,
      ),
    );
  }
}
