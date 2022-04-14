import 'dart:io';
import 'commands.dart';
import 'user.dart';


typedef choices(int choice);

withdraw(String bal){
  Testing b = Testing(int.parse(bal));
  b.withdraw();
}

deposit(String bal){
  Testing b = Testing(int.parse(bal));
  b.deposit();
}
settings(){
  var settingChoice;
  do{
  stdout.writeln("""\n
    -----Settings-----
    1.) Change Username 
    2.) Change Password 
    3.) Show User Info
    4.) Exit
    -------------------
    """);
  stdout.write("Chosen Number: ");
  settingChoice = stdin.readLineSync();
  Settings setting = Settings();
  if(settingChoice == "1"){
    setting.changeUsername();
    break;
  }    
  else if(settingChoice == "2"){
    setting.changePass();
    break;
  }
  else if(settingChoice == "3"){
    setting.showUserInfo();
    break;
  }
  else if(settingChoice == "4")
    break;
  else
    continue;
  }while(settingChoice != "1" || settingChoice != "2" || settingChoice != "3" || settingChoice != "4");
}

main(){
  var val = File('values.txt').readAsLinesSync(), choice;
  String user = val[0], bal = val[2], pass = val[1];
  String? inputUser, inputPass;
  bool validity = false;
  do{
    print("---Login---");
    stdout.write("Username: ");
    inputUser = stdin.readLineSync();
    stdout.write("Password: ");
    inputPass = stdin.readLineSync();

    if(inputUser != user && inputPass != pass)
      print("\n-Invalid Credentials. Please Try Again-\n");
    else if (inputUser != user && inputPass == pass)
      print("\n-Invalid Username. Please Try Again-\n");
    else if (inputUser == user && inputPass != pass)
      print("\n-Invalid Password. Please Try Again-\n");
    else
      validity = true;

  }while(validity == false);

  print("\nWelcome $user");
  print("-----------------------------------");
  print("   Your Current Balance is: $bal");
  print("-----------------------------------");
  
  
    stdout.write("""    -----MENU-----
    1.) Withdraw 
    2.) Deposit 
    3.) Setttings
    ---------------
    """);
    do{
    stdout.write("Chosen Number: ");
    choice = stdin.readLineSync();
    choices? a;
    if(choice == "1"){
      chosenType(val[3]);
      break;
    }
    else if(choice == "2"){
      chosenType(val[3]);
      break;
    }
    else if(choice == "3"){
      break;
    }
    else
      print("\n-Invalid Input. Please Try Again-\n");
    
  }while(choice != "1" || choice != "2" || choice != "3");

}

chosenType(String accType){

  bool valid = false;

  stdout.write("""\n
  ---Account Type---
  1.)Savings
  2.)Checkings
  ------------------
  """);
  do{
  stdout.write("Chosen Number: ");
  var type = stdin.readLineSync();

  
    if(type == "1" && accType.toLowerCase() == "savings"){
      valid = true;
      break;
    }
    else if (type == "2" && accType.toLowerCase() == "checkings"){
      valid = true;
      break;
    }
    else
      print("\nAccount Type Not Found. Please Choose Again.\n");

  }while(valid == false);
  

}