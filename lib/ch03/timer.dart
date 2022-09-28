import 'dart:async';
import './timerModel.dart';
class CountDownTimer {
 double _radius = 1;
 bool _isActive = true;
 late Timer timer;
 late Duration _time;
 late Duration _fullTime;

 String returnTime(Duration t) {
 String minutes = (t.inMinutes<10) ? '0' +
t.inMinutes.toString() :
 t.inMinutes.toString();
 int numSeconds = t.inSeconds - (t.inMinutes * 60);
 String seconds = (numSeconds < 10) ? '0' +
numSeconds.toString() : numSeconds.toString();
 String formattedTime = minutes + ":" + seconds;
 return formattedTime;
 }

}