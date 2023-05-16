import 'package:flutter/material.dart';
 class defaultFromField extends StatelessWidget {
   final TextEditingController? controller;
   final Function? validate ;
   final Function? onChange ;
   final Function? onClick;
   final IconData? prefIcon ;
   final String? hint;
   final String? label;
   final TextInputType? typeInput;
   final String? error;


   defaultFromField({
     @required this.controller,
     @required this.validate ,
     this.onChange,
     @required this.prefIcon,
     @required this.hint,
     @required this.label,
     this.onClick,
     @required this.typeInput,
     this.error


   });

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
        onTap:() => onClick!(),
        cursorColor: Colors.black,
        validator: (v) => validate!(v),
        controller: controller,
        keyboardType: typeInput,
        style: TextStyle(
            fontSize: media.size.height * 0.02,
            color: Colors.black,
            fontWeight: FontWeight.w200,
            fontFamily: 'Cairo'
        ),
      //  onChanged: (v) => onChange!(v),
        decoration: InputDecoration(
          focusColor: Colors.white,
          prefixIcon: Icon(prefIcon, color: Colors.grey,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE31CD6), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: media.size.height * 0.02,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w400,
          ),
          labelText:label,
        //  errorText: error,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: media.size.height * 0.02,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }


}
