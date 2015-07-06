
--  this ia the project hardware definition's root file. 

with System;

package Hw_Definition is
   
   type Reserved_Bit is range 0 .. 1 with Size => 1; 
   type Reserved is array (Natural range <>) of Reserved_Bit 
     with Component_Size => 1;
   for Reserved'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   
end Hw_Definition;
