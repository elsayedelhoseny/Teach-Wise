import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

////////////////////////////////controls of screen////////////////////////
///highlightColor of default button
Color highLightOfDefaultButton = Colors.transparent;

///splashColor of default button
Color splashColorOfDefaultButton = Colors.transparent;

/// function for onpressed
void Function() onPressed({required setState, required widget}) => () {
      setState(() {
        isPressed = true;
        Future.delayed(
            const Duration(
              milliseconds: 50,
            ), () {
          setState(() {
            isPressed = false;
          });
        }).then((value) => widget.onPressed!());
      });
    };

///duration of default button
Duration durationOfDefaultButton = const Duration(milliseconds: 100);

///alignment of default button
AlignmentGeometry alignmentOfDefaultButton = AlignmentDirectional.center;

///height of container
double heightOfContainer({required widget, required context}) =>
    widget.height ?? MediaQuery.of(context).size.height * 0.06;

///width of container
double widthOfContainer({required widget, required context}) =>
    widget.width ?? MediaQuery.of(context).size.width * 0.35;

///padding of container
EdgeInsetsGeometry paddingOfContainer(context) =>
    EdgeInsetsDirectional.all(screenWidth(context, dividedBy: 300));

///clipBehavior of container
Clip clipBehaviorOfContainer = Clip.hardEdge;

///border of box decoration
BoxBorder borderOfBoxDecoration({required widget}) => Border.all(
      color: widget.colorModel == null
          ? AppColor.buttonBlueBorderColor
          : widget.colorModel!.borderColor!,
      width: widget.isWhiteBackground ? 1 : 2,
      style: BorderStyle.solid,
    );

///offset of box shadow
Offset offsetOfBoxShadow = const Offset(0, 5);

///blurRadius of box shadow
double blurRadiusOfBoxShadow = 2;

///color of box shadow
Color colorOfBoxShadow = Colors.grey.shade300;

///spreadRadius of box shadow
double spreadRadiusOfBoxShadow = 1;

///blurStyle of box shadow
BlurStyle blurStyleOfBoxShadow = BlurStyle.inner;

///duration of animation container
Duration durationOfAnimationContainer = const Duration(milliseconds: 100);

///alignment of animation container
AlignmentGeometry alignmentOfAnimationContainer = AlignmentDirectional.center;

///padding of animation container
EdgeInsetsGeometry paddingOfAnimationContainer = EdgeInsetsDirectional.zero;

///clipBehavior of animation container
Clip clipBehaviorOfAnimationContainer = Clip.antiAlias;

///decoration of animation container
Decoration decorationOfAnimationContainer({required widget}) => BoxDecoration(
      borderRadius: BorderRadius.circular(widget.radius),
      gradient: AppGradient.buttonColor,
    );

///fit of animation container
StackFit fitOfAnimationContainer = StackFit.loose;

///padding of animatin container
EdgeInsetsGeometry paddingOfAnimation(context) => EdgeInsetsDirectional.only(
      bottom: screenHeight(context, dividedBy: 122),
      start: screenHeight(context, dividedBy: 122),
    );

///color of text button
Color colorOfText = Colors.grey;

///fontWeight of text button
FontWeight fontWeightOfText = FontWeight.w900;

///padding of text button
EdgeInsetsGeometry paddingOfTextButton(context) =>
    EdgeInsetsDirectional.only(bottom: screenHeight(context, dividedBy: 122));

///fontWeight of second text button
FontWeight fontWeightOfSecondTextButton = FontWeight.w900;

///image up path
String imageUpPath = 'assets/images/buttons-up-dot.png';

///top padding of image up
double topOfTopImage(context) => screenHeight(context, dividedBy: 3000);

///end padding of image up
double endOfTopImage(context) => screenWidth(context, dividedBy: 150);

///height of image up
double heightOfTopImage(context) => screenHeight(context, dividedBy: 150);

///width of image up
double widthOfTopImage(context) => screenHeight(context, dividedBy: 80);

///image down path
String imageDownPath = 'assets/images/buttons-down-dot.png';

///bottom padding of image down
double buttonOfDownImage(context) => screenHeight(context, dividedBy: 2000);

///start padding of image down
double startOfDownImage(context) => screenHeight(context, dividedBy: 200);

///height of image down
double heightOfDownImage(context) => screenHeight(context, dividedBy: 100);

///width of image down
double widthOfDownImage(context) => screenHeight(context, dividedBy: 200);

//////////////////////////////////////////////////////////////////////////////////////////////
class DefaultButton extends StatefulWidget {
  final String? label;
  final Widget? centerWidget;
  final void Function()? onPressed;
  final double? width;
  final ColorModel? colorModel;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isWhiteBackground;
  final bool withoutDots;
  final bool withoutShadow;
  final bool withoutBorder;
  final bool isLabelFitted;
  final Color? color;

  // final Color secondColor;
  final double radius;

  const DefaultButton({
    super.key,
    this.label,
    this.centerWidget,
    required this.onPressed,
    this.isWhiteBackground = false,
    this.withoutDots = false,
    this.withoutShadow = false,
    this.withoutBorder = false,
    this.isLabelFitted = true,
    this.colorModel,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.color,
    this.radius = 16,
  });

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

bool isPressed = false;

class _DefaultButtonState extends State<DefaultButton> {
  @override
  void initState() {
    super.initState();
    isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: highLightOfDefaultButton,
      splashColor: splashColorOfDefaultButton,
      onTap: widget.onPressed == null
          ? null
          : onPressed(setState: setState, widget: widget),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: durationOfDefaultButton,
          alignment: alignmentOfDefaultButton,
          height: heightOfContainer(widget: widget, context: context),
          width: widthOfContainer(widget: widget, context: context),
          padding: paddingOfContainer(context),
          clipBehavior: clipBehaviorOfContainer,
          decoration: BoxDecoration(
            border: widget.withoutBorder
                ? null
                : borderOfBoxDecoration(widget: widget),
            gradient: widget.colorModel == null
                ? widget.isWhiteBackground
                    ? null
                    : AppGradient.buttonColor
                : widget.colorModel!.mainGradient,
            // boxShadow: widget.withoutShadow ? null :
            // isPressed
            //     ? []
            //     : [
            //         BoxShadow(
            //             offset: offsetOfBoxShadow,
            //             blurRadius: blurRadiusOfBoxShadow,
            //             color: colorOfBoxShadow,
            //             spreadRadius: spreadRadiusOfBoxShadow,
            //             blurStyle: blurStyleOfBoxShadow),
            //       ],
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: AnimatedContainer(
            duration: durationOfAnimationContainer,
            alignment: alignmentOfAnimationContainer,
            padding: isPressed
                ? paddingOfAnimationContainer
                    .add(const EdgeInsetsDirectional.all(10))
                : paddingOfAnimationContainer,
            clipBehavior: clipBehaviorOfAnimationContainer,
            decoration: decorationOfAnimationContainer(widget: widget),
            child: Center(
              child: AnimatedContainer(
                duration: durationOfAnimationContainer,
                padding: const EdgeInsetsDirectional.all(2),
                height: isPressed
                    ? screenHeight(context, dividedBy: 6) - 10
                    : screenHeight(context, dividedBy: 6),
                width: isPressed
                    ? screenWidth(context, dividedBy: 3.5)
                    : screenWidth(context, dividedBy: 2.5),
                child: Center(
                  child: widget.centerWidget ??
                      Visibility(
                        visible: widget.isLabelFitted,
                        replacement: ButtonText(
                          text: widget.label ?? ' ',
                          textHeight: 1,
                          fontWeight: fontWeightOfSecondTextButton,
                          color: widget.isWhiteBackground
                              ? AppColor.priceColor
                              : null,
                          // shadows: [
                          //   BoxShadow(
                          //     offset: const Offset(0, 2),
                          //     blurRadius:  2,
                          //     color: Colors.grey,
                          //     spreadRadius: 1,
                          //     blurStyle: BlurStyle.inner,
                          //   ),
                          // ],
                          fontSize: isPressed
                              ? widget.fontSize != null
                                  ? widget.fontSize! - 5
                                  : 16
                              : widget.fontSize != null
                                  ? widget.fontSize!
                                  : 20,
                        ),
                        child: FittedBox(
                          child: ButtonText(
                            text: widget.label ?? ' ',
                            fontWeight: fontWeightOfSecondTextButton,
                            color: widget.isWhiteBackground
                                ? AppColor.priceColor
                                : null,
                            fontSize: isPressed
                                ? widget.fontSize != null
                                    ? widget.fontSize! - 5
                                    : 16
                                : widget.fontSize != null
                                    ? widget.fontSize!
                                    : 20,
                          ),
                        ),
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }
}
