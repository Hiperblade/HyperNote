 $$$$        $$$$  $$$$        $$$$  $$$$$$$$$$$$$$    $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$   
 $$$$        $$$$  $$$$        $$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$ 
                                                                                          
 $$$$$$$$$$$$$$$$    $$$$$$$$$$$$    $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$ 
 $$$$$$$$$$$$$$$$      $$$$$$$$      $$$$$$$$$$$$$$    $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$   
 $$$$        $$$$        $$$$        $$$$              $$$$              $$$$      $$$$   
 $$$$        $$$$        $$$$        $$$$              $$$$$$$$$$$$$$$$  $$$$        $$$$ 
 $$$$        $$$$        $$$$        $$$$              $$$$$$$$$$$$$$$$  $$$$        $$$$ 
                                                                                          
   $$$$$$    $$$$    $$$$$$$$$$$$    $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$                   
 $$$$$$$$$$  $$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$                   
                                                                                          
 $$$$  $$$$  $$$$  $$$$        $$$$        $$$$        $$$$$$$$$$$$$$$$                   
 $$$$  $$$$  $$$$  $$$$        $$$$        $$$$        $$$$$$$$$$$$$$$$                   
 $$$$  $$$$  $$$$  $$$$        $$$$        $$$$        $$$$                               
 $$$$  $$$$$$$$$$  $$$$$$$$$$$$$$$$        $$$$        $$$$$$$$$$$$$$$$     Hiperblade    
 $$$$    $$$$$$      $$$$$$$$$$$$          $$$$        $$$$$$$$$$$$$$$$        2011       


A manager for Asus Eee Note 800 by Hyperblade
You can find update at: https://github.com/Hiperblade/HyperNote

=== LIB =====================
To add generic functions:
Add a script file in the LIB directory
The file must contain a line like this:

HyperNote_AddLib "HyperNoteConsole 1.0                     by Hiperblade"

to preserve the alignment, the string must be of 55 char

=== PACKAGE =================
To add a package:
Make a subdirectory in the HyperNote\package directory
and create a script named main.sh
use the template TestUI (if possible add uninstall functionality) or TestCustom
In your script can use all the function declared in the lib files