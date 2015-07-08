
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
   --  and the filler size        --
   --   if needed                 --
   ---------------------------------
   
   Nodes : constant Natural := 3;
   --  Number of field nodes.
   --  to be set when collating the board definitions.
   
   Filler_Size :constant Natural := 272 - (Nodes * 48);
   -- this will trip the compiler when no filler is needed, in that case
   --  set it to 0; since it is needed below.
   --
   -- Mac_Addr_Ary_Type must have min of 272 bits.
   -- and a node address is 48 bits long.
   
   Addr_Array_Size : constant Natural := Nodes * 48 + Filler_Size;
   
  
   
   ------------------------------------------
   --  the mac addresses of all the nodes  --
   --  in sequence of visiting             --
   ------------------------------------------
   type Mac_Addr_Ary_Type is record
      Sample : Hwt.Bits_48 := Hw_Definition.Sample.Mac_Addr;
      Node1  : Hwt.Bits_48 := Hw_Definition.Node1.Mac_Addr;
      Node2  : Hwt.Bits_48 := Hw_Definition.Node2.Mac_Addr;
      -- we need a filler to make the frame 38 octets. (304 bits)
      -- see niniel.discover for the reasoning (type Disco_Packet_Type)
      Filler : Reserved (1 .. Filler_Size);
   end record;
   
   for Mac_Addr_Ary_Type use record
      Sample at  0 range 0 .. 47;
      Node1  at  6 range 0 .. 47;
      Node2  at 12 range 0 .. 47;
      Filler at 18 range 0 .. Filler_Size - 1;
   end record;
   for Mac_Addr_Ary_Type'Size use 48 * Nodes + Filler_size;
   for Mac_Addr_Ary_Type'Bit_Order            use System.High_Order_First;
   for Mac_Addr_Ary_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   
   ----------------------------------------------
   --  the field data record as represented    --
   -- in the master, and as send to the nodes  --
   ----------------------------------------------
   type Field_Data_Image_Type is record
      S_Node : Hw_Definition.Sample.Hw_Def_Data_type;
      Node1  : Hw_Definition.Node1.Hw_Def_Data_type;
      Node2  : Hw_Definition.Node2.Hw_Def_Data_type;
   end record;
   
   for Field_Data_Image_Type use record
      S_Node at  0 range 0 .. 47;
      Node1  at  8 range 0 .. 47;
      Node2  at 16 range 0 .. 47;
   end record;
   for Field_Data_Image_Type'Bit_Order            use System.High_Order_First;
   for Field_Data_Image_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   
   -----------------------------------------
   --  the collation of field-node stata  --
   --  as it is returned to the master    --
   --  in a discovery cycle               --
   -----------------------------------------
   type Field_Status_Image_Type is record
      S_Node : Node_Status_Type := Hw_Definition.Sample.Node_Status;
      Node1  : Node_Status_Type := Hw_Definition.Node1.Node_Status;
      Node2  : Node_Status_Type := Hw_Definition.Node2.Node_Status;
      Filler : Reserved (1 .. Filler_Size);
      -- we leave the filler off here, thers no need for it??
   end record;
   
   for Field_Status_Image_Type use record
      S_Node at  0 range 0 .. 47;
      Node1  at  6 range 0 .. 47;
      Node2  at 12 range 0 .. 47;
      Filler at 18 range 0 .. Filler_Size - 1;
   end record;
   for Field_Status_Image_Type'Bit_Order            use System.High_Order_First;
   for Field_Status_Image_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
end Hw_Definition.Main;
