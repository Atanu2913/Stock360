import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'color.dart';

textFromFieldDesign({String hint, iconWidget, iconWidget1}) {
  return TextFormField(
    cursorColor: appColor,
    style: TextStyle(
      color: white,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: gray,
        fontSize: 15,
        fontFamily: "Nunito",
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: iconWidget,
      suffixIcon: iconWidget1,
      /*Icon(
        Icons.email_outlined,
        color: gray,
      ),*/
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
          width: 1,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
    ),
  );
}

textFromFieldDesign1(TextEditingController textEditingController,
    {String hint,
    iconWidget,
    iconWidget1,
    bool number = false,
    int maxNumber = 1000,
    @required Function(String) onChange}) {
  return TextFormField(
      style: TextStyle(
      color: white,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w400,
    ),
    cursorColor: appColor,
    controller: textEditingController,
    onChanged: onChange,
    maxLength: maxNumber,
    keyboardType: number ? TextInputType.number : TextInputType.text,
    decoration: InputDecoration(
      hintText: hint,
      counterText: "",
      hintStyle: TextStyle(
        color: gray2,
        fontSize: 19,
        fontFamily: "Nunito",
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: iconWidget,
      suffixIcon: iconWidget1,
      /*Icon(
        Icons.email_outlined,
        color: gray,
      ),*/
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
    ),
  );
}

textFromFieldDesign2({String hint, iconWidget, iconWidget1}) {
  return TextFormField(
      style: TextStyle(
      color: white,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w400,
    ),
    cursorColor: appColor,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: gray2,
        fontSize: 19,
        fontFamily: "Nunito",
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: iconWidget,
      suffixIcon: iconWidget1,
      /*Icon(
        Icons.email_outlined,
        color: gray,
      ),*/
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: gray1,
          width: 1,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
    ),
  );
}

textForKeypad(String textNum, colorBackGround) {
  return Container(
    height: Get.height / 14.37,
    width: Get.width / 6.63,
    decoration: BoxDecoration(
      color: colorBackGround,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        textNum,
        style: TextStyle(
          color: appColor,
          fontSize: 36,
          fontFamily: "NunitoSemiBold",
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

textFromFieldDesign3({String label, iconWidget, iconWidget1}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: TextFormField(
      
      cursorColor: appColor,
      obscureText: true,
      obscuringCharacter: '●',
        style: TextStyle(
      color: white,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w400,
    ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: gray2,
          fontSize: 19,
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: iconWidget,
        suffixIcon: iconWidget1,
        /*Icon(
          Icons.email_outlined,
          color: gray,
        ),*/
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE7E8EB),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE7E8EB),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE7E8EB),
          ),
        ),
      ),
    ),
  );
}

class PassowrdTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final iconWidget;
  final Function(String) onChange;
  PassowrdTextField(
    this.textEditingController, {
    this.hint,
    @required this.onChange,
    this.iconWidget,
  });

  @override
  State<PassowrdTextField> createState() => _PassowrdTextFieldState();
}

class _PassowrdTextFieldState extends State<PassowrdTextField> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
          style: TextStyle(
      color: white,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w400,
    ),
        controller: widget.textEditingController,
        cursorColor: appColor,
        obscureText: !visible,
        obscuringCharacter: '●',
        onChanged: widget.onChange,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: gray2,
            fontSize: 19,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: widget.iconWidget,
          suffixIcon: GestureDetector(
            onTap: () {
              visible = !visible;
              setState(() {});
            },
            child: Icon(
              !visible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: gray9B9797,
            ),
          ),
          /*Icon(
          Icons.email_outlined,
          color: gray,
        ),*/
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE7E8EB),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE7E8EB),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE7E8EB),
            ),
          ),
        ),
      ),
    );
  }
}
