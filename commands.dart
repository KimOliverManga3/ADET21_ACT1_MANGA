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
    bool valid = false;
      try{
        do{
          stdout.write("Please Enter the Amount to be Withdrawn: ");
          amnt = stdin.readLineSync();
          amountWithdrawn = int.parse(amnt);
          if(amountWithdrawn > balance || amountWithdrawn <= 0){
            print("\n-Please Enter a Valid Amount-\n");
            continue;
          }
          else{
            withdrawBal = amountWithdrawn;
            printing("$amountWithdrawn has been Withrawn Successfully.");
            updating();
            valid = true;
          }   
        }while(valid == false);
      }
      on FormatException catch(e){
        print("\n-Invalid Input. Please Try Again-\n");
        withdraw();
      }
      catch(e){
        print(e);
      }
    
  }

  deposit(){
    var amnt, amountDeposited;
    bool valid = false;

      try{
        do{
          stdout.write("Please Enter the Amount to be Deposited: ");
          amnt = stdin.readLineSync();
          amountDeposited = int.parse(amnt);
          if(amountDeposited <= 0){
            print("\n-Please Enter a Valid Amount-\n");
            continue;
          }
          else{
            depositBal = amountDeposited;
            printing("$amountDeposited has been Deposited Successfully.");  
            updating();
            valid = true;
          }   
        }while(valid == false);
      }
      on FormatException catch(e){
        print("\n-Invalid Input. Please Try Again-\n");
        deposit();
      }
      catch(e){
        print(e);
      }
    
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