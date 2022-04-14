import 'dart:io';

class Settings{

  String? updatedInfo;
  var files = File('values.txt').readAsLinesSync();


  set newInformation(String info) => updatedInfo = info;
  set toUpdate(int count) => files[count] = updatedInfo.toString();

  changeUsername(){
    var temp;
    stdout.write("Please Enter the New Username: ");
    temp = stdin.readLineSync();
    newInformation = temp;
    toUpdate = 0;
    confirmation("""
    \n
    ------------------------------------
    Username Has Been Changed to: $temp
    ------------------------------------
    """);
    updating();
  }

  changePass(){
    var temp;
    stdout.write("Please Enter the New Pasword: ");
    temp = stdin.readLineSync();
    newInformation = temp;
    toUpdate = 1;
    confirmation("""
    \n
    ------------------------------------
    Password Has Been Changed to: $temp
    ------------------------------------
    """);
    updating();
  }

  showUserInfo(){
    print("\nUsername: " + files[0]);
    print("Password: " + files[1]);
    print("Account Type: " + files[3]);
  }

  confirmation(String line) => print(line);

  updating(){
    var cont = File('values.txt').openWrite();
    cont.write(files.join("\n"));
    cont.close();
  }

}