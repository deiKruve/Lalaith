with System;
--with Finrod.Board;
--with STM32F4;
with Hw_Types;
   
package Hw_Definition.Sample is
   
   package Hwt renames Hw_Types;
   
   use type Hwt.Bits_48;
   use type Hwt.Bits_32;
      
      Typ      : Hwt.Byte    := 00;
      --  the type of board as set on the jumpers.
      --  adapt on application.
      --  use for error detection on start-up.
      
      Id       : Hwt.Byte    := 00;
      --  the hardware Id as set on the id selector.
      --  adapt on application.
      --  use for error detection on start-up.
      
      Mac_Addr : Hwt.Bits_48 := 
        16#02_00_00_00_00_00# + 
        Hwt.Bits_48 (Typ) * 16#1_00_00# + Hwt.Bits_48 (Id) * 16#1_00#;
      --  the boards mac address.
      --  should calculate automatically, do not modify.
      
      Ip_Addr  : Hwt.Bits_32 :=
        16#10_00_00_00# + 
        Hwt.Bits_32 (Typ) * 16#1_00_00# + Hwt.Bits_32 (Id) * 16#1_00#;
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
         Dig_In  : Hwt.Bits_32;
         Dig_Out : Hwt.Bits_16;
      end record;
      
      for Hw_Def_Data use record
         Dig_In   at 0 range 0 .. 31;
         Dig_Out  at 4 range 0 .. 15;
      end record;
      for Hw_Def_Data'Bit_Order use System.High_Order_First;
      for Hw_Def_Data'Scalar_Storage_Order use System.High_Order_First;
      -- its Big Endian
        

end Hw_Definition.Sample;
