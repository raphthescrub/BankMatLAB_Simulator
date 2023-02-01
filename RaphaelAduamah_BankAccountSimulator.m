clear
clc

disp("Raphael Aduamah - Exam 2 Code - Fall 2022" + newline)
disp("I, [Raphael Aduamah], agree to respect the integrity of this exam " + ...
    "and maintain academic honesty." + newline + "I agree to not use any resources unauthorized by my instructor." + newline)

%Initializing default/given bank variables
checking = 5000; %Gives the original value of the amount of money in the checking account
savings = 3000; %Gives the original value of the amount of money in the savings account
PIN = 1100; %Gives PIN that is required to be used when wanting the application to function
InSuf = 0;%Determines wheter or not if the funds are suffiecient
quit = 1; %initializing loop control

pin = inputdlg("Please enter your PIN to proceed");
pin = str2double(pin);

%%This section checks to see if the pin is entered correctly. After three
%%tries the program quits. However, if on the second or third try the pin is correct,
%%the rest of the program will proceed
if pin ~= PIN
   count = 1;
   while quit ~= 3 %need to establish some loop control. Doesn't matter what it is
       if pin ~= PIN
           pin = inputdlg(newline + "Incorrect PIN. Please try again with the correct PIN." ...
               + newline + "Please enter your PIN to proceed: ");
           pin = str2double(pin);
           count = count + 1;
           if count == 3 && pin ~= PIN
               quit = 3;
               disp(newline + "You've entered the incorrect PIN too many times. Goodbye.")
           end
       else
           quit = 3; %enables you to quit the loop if pin is entered correctly and move on
           pin = PIN;
           
       end
   end
end

if pin == PIN %Checks if the PIN is inserted correctly(Edit coment)
    
    while quit ~= 0 
        accounttype = menu("Choose an option", "Checking", "Savings", ...
            "Check Balance" , "Transfer Money", "Quit"); %Creates an menu that gives the option to open their Checking, Savings, Balance, and money transfering
        if accounttype == 1
            
            disp("Your current checking balance is $" + checking + newline)
            accountaction = menu("Choose an option", "1) Withdraw", "2) Deposit");

            if accountaction == 1
                withdraw = inputdlg("How much money do you want to withdraw?");
                withdraw = str2double(withdraw); %Because the inputdlg() function is a string it has to be transferred to a double using the str2double functio
              
                %Checks Insufficient Funds on account and makes sure that
               %one does not go over
                if(withdraw > checking)
                    InSuf = 1;
                    while(InSuf == 1)
                        withdraw = inputdlg("Insufficient Funds! How much money do you want to withdraw from your account.");
                        withdraw = str2double(withdraw);   
                        if(withdraw > checking)
                            %Do Nothing
                        else
                            InSuf = 0;
                        end
                    end
                end
                %Ends the checking of Insufficient Funds
              
                checking = checking - withdraw;
                
                disp("Your current balance in checking is: $" + checking + newline)
            elseif accountaction == 2
                deposit = inputdlg("How much money do you want to deposit?");
                deposit = str2double(deposit);
                checking = checking + deposit;
                
                disp("Your current balance in checking is: $" + checking + newline);
            end
        elseif(accounttype == 2)
            %Executes in the Savings Account Area
            disp("Savings Account:");
            
            disp("Your current SAVINGS balance is $" + savings + newline)
            accountaction = menu("Choose an option", "1) Withdraw", "2) Deposit");

            if accountaction == 1
                withdraw = inputdlg("How much money do you want to withdraw?");
                withdraw = str2double(withdraw); %Because the inputdlg() function is a string it has to be transferred to a double using the str2double functio
              
                %Checks Insufficient Funds on account and makes sure that
               %one does not go over
                if(withdraw > savings)
                    InSuf = 1;
                    while(InSuf == 1)
                        withdraw = inputdlg("Insufficient Funds! How much money do you want to withdraw from your account.");
                        withdraw = str2double(withdraw);
                        if(withdraw > savings)
                            %Do Nothing
                        else
                            InSuf = 0;
                        end
                    end
                end
                %Ends the checking of Insufficient Funds
              
                savings = savings - withdraw;
                
                disp("Your current balance in checking is: $" + savings + newline)
            elseif accountaction == 2
                deposit = inputdlg("How much money do you want to deposit?");
                deposit = str2double(deposit);
                savings= savings + deposit;
                
                disp("Your current balance in savings is: $" + savings + newline);
            end
            %Ending of the savings
                
            
         elseif(accounttype == 3)%Display Balance
                %Display the current balance of the checking and savings
                %account
                DispBalance = msgbox("Here is the balance.  Checking: " + checking + "   Savings "+ savings);
                disp("Checkings: "+ checking);
                disp("Savings: " + savings);
                %Transfer Money to where you want it to go
       elseif(accounttype == 4)
                %Transferrring Money
                TransferMenu = menu("Choose an Option", "Transfer Money from Savings to Checkings","Transfer Money from Checkings to Savings");
                if(TransferMenu == 1)
                    %Savings to Chekings
                    TransferAmount = inputdlg("How much money would you like to transfer from your Savings account to Checking Account");
                    TransferAmount = str2double(TransferAmount);
                      errorcount = 0;
                    if(TransferAmount > savings)
                        InSuf = 1;
                        %makes sure that You aren't stuck if you
                        %continually do the input incorrectly

                        while(InSuf == 1 && errorcount < 3 )
                            TransferAmount = inputdlg("Insufficient funds! Transfer a Lower Amount of Money from your savings account." + "You have " + (3 - errorcount) + " tries left!");
                            disp((errorcount - 3) + " tries left!")
                            TransferAmount = str2double(TransferAmount);
                            if(TransferAmount < savings)
                                InSuf = 0;
                            end
                            errorcount = errorcount + 1;
                        end
                    end
                    if(errorcount < 3)
                        savings = savings - TransferAmount;
                        checking = checking + TransferAmount;
                        errorcount = 0;
                    else
                        disp("Too many unsuccessful transfers")
                        message = msgbox("Too many unsuccessful transfers!");
                        errorcount = 0;
                    end
                   
                elseif( TransferMenu == 2)
                     TransferAmount = inputdlg("How much money would you like to transfer from your Savings account to Checking Account");
                    TransferAmount = str2double(TransferAmount);
                     errorcount = 0;
                    if(TransferAmount > checking)
                        InSuf = 1;

                        while(InSuf == 1 && errorcount < 3)
                            TransferAmount = inputdlg("Insufficient funds! Transfer a Lower Amount of Money from your savings account." + "You have " + (3 - errorcount) + " tries left!");
                             disp((errorcount - 3) + " tries left!");
                            TransferAmount = str2double(TransferAmount);
                            if(TransferAmount < checking)
                                InSuf = 0;
                            end
                            errorcount = errorcount + 1;
                        end
                    end
                    if(errorcount < 3)
                    checking = checking - TransferAmount;
                    savings = savings + TransferAmount;
                    errorcount = 0;
                    else
                        disp("Too many insufficent funds!");
                        Message = msgbox("Too many insufficient funds");
                        errorcount = 0;
                    end
                end
        else
            quit = 0;
            
            disp("Thank you for being a valuable customer. Have a good day!");
        end
    end
end
