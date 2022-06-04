import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
class sent_Otp extends StatefulWidget {
  const sent_Otp({Key? key}) : super(key: key);

  @override
  _sent_OtpState createState() => _sent_OtpState();
}

class _sent_OtpState extends State<sent_Otp> {
  int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = true;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController textEditingController = new TextEditingController(text: "****");

  @override
  void initState() {
    super.initState();
    _getSignatureCode();
    _startListeningSms();
  }

  @override
  void dispose() {
    super.dispose();
    SmsVerification.stopListening();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Colors.grey.shade200,
      border: Border.all(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  /// get signature code
  _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    print("signature $signature");
  }

  /// listen sms
  _startListeningSms()  {
    SmsVerification.startListeningSms().then((message) {
      setState(() {
        _otpCode = SmsVerification.getCode(message, intRegex);
        textEditingController.text = _otpCode;
        _onOtpCallBack(_otpCode, true);
      });
    });
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  _onClickRetry() {
    _startListeningSms();
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

      _scaffoldKey.currentState?.showSnackBar(
          SnackBar(content: Text("Verification OTP Code $_otpCode Success")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,

        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 25,),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("We have sent an OTP to \nyour mobile ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center,),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 70),
                  child: Text("Please check your mobile number 071*****12 \ncontinue to reset your password",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                TextFieldPin(
                    textController: textEditingController,

                    autoFocus: true,
                    codeLength: _otpCodeLength,
                     alignment: MainAxisAlignment.center,

                    defaultBoxSize: 55.0,
                    margin: 10,
                    selectedBoxSize: 55.0,

                    textStyle: TextStyle(fontSize: 35,color: Colors.grey,),
                    defaultDecoration: _pinPutDecoration.copyWith(
                        border: Border.all(
                            color:Colors.grey.shade200)),
                    selectedDecoration: _pinPutDecoration,
                    onChange: (code) {
                      _onOtpCallBack(code,false);
                    }),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.deepOrange
                    ),
                    child: MaterialButton(
                      onPressed: _enableButton ? _onSubmitOtp : null,

                      child: _setUpButtonChild(),

                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Didn't Receive?",
                      style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                        text: "Click Here",
                        style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.of(context)
                            //     .pushReplacement(MaterialPageRoute(
                            //   builder: (context) => {},
                            // ));
                          })
                  ]),
                ),

              ],
            ),
          ),
        ),

    );
  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Next",
        style: TextStyle(color: Colors.white ,fontSize: 18,fontWeight: FontWeight.bold),
      );
    }
  }
}
