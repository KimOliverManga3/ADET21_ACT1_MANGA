import 'dart:io';

class Testing{
  int balance;
  var newBal;

  Testing(this.balance);

  set withdrawBal(int amount) => newBal = balance - amount;
  set depositBal(int amount) => newBal = balance + amount;

  accountType(){

  }

  withdraw(){
    var amnt, amountWithdrawn;

    stdout.write("Please Enter the Amount to be Withdrawn: ");
    amnt = stdin.readLineSync();
    amountWithdrawn = int.parse(amnt);
    withdrawBal = amountWithdrawn;
    printing("$amountWithdrawn has been Withrawn Successfully.");
    updating();
  }

  deposit(){
    var amnt, amountDeposited;

    stdout.write("Please Enter the Amount to be Deposited: ");
    amnt = stdin.readLineSync();
    amountDeposited = int.parse(amnt);
    depositBal = amountDeposited;
    printing("$amountDeposited has been Deposited Successfully.");  
    updating();
  }

  printing(String line) => print("""
  \n $line \n
  ------------------------------------
  The New Balance is: $newBal
  ------------------------------------
  """);

  updating(){
    var files = File('values.txt').readAsLinesSync();
    files[2] = newBal.toString();
    var cont = File('values.txt').openWrite();
    cont.write(files.join("\n"));
    cont.close();
  }

}