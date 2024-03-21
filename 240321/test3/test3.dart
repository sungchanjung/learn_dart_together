import'dart:io';


Future<String> timeoutFuture() async {
   Future.delayed(Duration(seconds:3), () {
   Future.delayed(Duration(seconds: 3)); print('time out');
  });
  return 'ok';
}

void main(){
  timeoutFuture();
}