
--  this ia the projects hardware definition's root file. 

with System;

with Hw_Types;

with Hw_Definition.Sample;
with Hw_Definition.Node1;
with Hw_Definition.Node2;
-- ..
-- ..


package Hw_Definition.Main is
   
   package Hwt renames Hw_Types;
   
   
   ---------------------------------
   --  the number of field nodes  --
   ---------------------------------
   Nodes : constant Natural := 3;
   --  to be set when collating the board definitions.
   
   
   --  type Mac_Addr_Ary_Type is array (1 .. Nodes) of Hwt.Bits_48;
   --  --for Mac_Addr_Ary_Type'Component_Size use 48;
   --  -- for Mac_Addr_Ary_Type'Bit_Order            use System.High_Order_First;
   --  for Mac_Addr_Ary_Type'Scalar_Storage_Order use System.High_Order_First;
   --  -- its Big Endian
   
   --  Mac_Addr_Ary : Mac_Addr_Ary_Type := (Hw_Definition.Sample.Mac_Addr,
   --                                       Hw_Definition.Node1.Mac_Addr,
   --                                       Hw_Definition.Node2.Mac_Addr);
   
   
   ------------------------------------------
   --  the mac addresses of all the nodes  --
   --  in sequence of visiting             --
   ------------------------------------------
   type Mac_Addr_Ary_Type is record
      Sample : Hwt.Bits_48 := Hw_Definition.Sample.Mac_Addr;
      Node1  : Hwt.Bits_48 := Hw_Definition.Node1.Mac_Addr;
      Node2  : Hwt.Bits_48 := Hw_Definition.Node2.Mac_Addr;
   end record;
   
   for Mac_Addr_Ary_Type use record
      Sample at  0 range 0 .. 47;
      Node1  at  6 range 0 .. 47;
      Node2  at 12 range 0 .. 47;
   end record;
   for Mac_Addr_Ary_Type'Size use 48 * Nodes;
   for Mac_Addr_Ary_Type'Bit_Order            use System.High_Order_First;
   for Mac_Addr_Ary_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   
   ----------------------------------------------
   --  the field data record as represented    --
   -- in the master, and as send to the nodes  --
   ----------------------------------------------
   type Field_Data_Image_Type is record
      S_Node : Hw_Definition.Sample.Hw_Def_Data;
      Node1  : Hw_Definition.Node1.Hw_Def_Data;
      Node2  : Hw_Definition.Node2.Hw_Def_Data;
   end record;
   
   for Field_Data_Image_Type use record
      S_Node at  0 range 0 .. 47;
      Node1  at  8 range 0 .. 47;
      Node2  at 16 range 0 .. 47;
   end record;
   for Field_Data_Image_Type'Bit_Order            use System.High_Order_First;
   for Field_Data_Image_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   
      
end Hw_Definition.Main;
