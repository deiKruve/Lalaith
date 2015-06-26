with System;
with Finrod.Board;
with STM32F4;
   
package Hw_Definition.Node2 is
   use type STM32F4.Bits_48;
   use type STM32F4.Bits_32;
      
      Typ      : Finrod.Board.Board_Type  := 01;
      --  the type of board as set on the jumpers.
      --  adapt on application.
      --  use for error detection on start-up.
      
      Id       : Finrod.Board.Board_Id    := 02;
      --  the hardware Id as set on the id selector.
      --  adapt on application.
      --  use for error detection on start-up.
      
      Mac_Addr : Finrod.Board.Mac_Address := 
        16#02_00_00_00_00_00# + 
        STM32F4.Bits_48 (Typ) * 16#1_00_00# + STM32F4.Bits_48 (Id) * 16#1_00#;
      --  the boards mac address.
      --  should calculate automatically, do not modify.
      
      Ip_Addr  : Finrod.Board.Ip_Address :=
        16#10_00_00_00# + 
        STM32F4.Bits_32 (Typ) * 16#1_00_00# + STM32F4.Bits_32 (Id) * 16#1_00#;
      --  the boards ip address.
      --  should calculate automatically, do not modify.
      
      
      --------------------------------------------------------------------
      --  here is a sample data frame type                              --
      --  as it will arrive in the eth frame,                           --
      --  it will be used in the application here to manipulate io.     --
      --  and in the mainstation application to compile the eth packet. --
      --------------------------------------------------------------------
      --  in the node it may be addressed by means of the
      --  project definition. or perhaps an address overlay can be used.
      type Hw_Def_Data is record
         Dig_In  : STM32F4.Bits_32;
         Dig_Out : STM32F4.Bits_16;
      end record;
      
      for Hw_Def_Data use record
         Dig_In   at 0 range 0 .. 31;
         Dig_Out  at 4 range 0 .. 15;
      end record;
      for Hw_Def_Data'Bit_Order use System.High_Order_First;
      for Hw_Def_Data'Scalar_Storage_Order use System.High_Order_First;
      -- its Big Endian
        
      
      
   
end Hw_Definition.Node2;
