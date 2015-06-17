
--  this ia the projects hardware definition file, 
--  in which all board definitions are collated.


with System;
with Finrod.Board;
--  with STM32F4;

--------------------------------------
--  with al individual boards here  --
--------------------------------------
with Hw_Definition.Node1;
with Hw_Definition.Node2;

---------------------------
--  the package proper.  --
---------------------------
package Hw_Definition.Project is
   package Board renames Finrod.Board;
   package Nod1 renames Hw_Definition.Node1;
   package Nod2 renames Hw_Definition.Node2;
   
   ---------------------------
   --  the board addresses  --
   ---------------------------
   
   Max_Nodes : constant Natural := 2; 
   -- the number of out-nodes in this project
   
   type Macaddr_Type is array (1 .. Max_Nodes) of Board.Mac_Address;
   --  the array of mac addresses.
   --  it is an array so the out-nodes may look up the next nodes' address
   --  by indexing into it with node_number + 1;
   --  note that the order of listing here determines the order of visiting
   --  of the individual nodes by the pdo packet.
   
   Mac_Addr_A : Macaddr_Type := (Node1.Mac_Addr, 
                                 Node2.Mac_Addr);
   
   
   
   --  let see if we can get away without ip addresses
   
   ------------------------------------------------
   --  process image for the whole installation  --
   ------------------------------------------------
   
   type Proc_Image is record
      Node1 : Nod1.Hw_Def_Sample_Data;
      Node2 : Nod2.Hw_Def_Sample_Data;
      -- more nodes
   end record;
   
   for Proc_Image use record
      Node1  at 0 range 0 .. 63;  -- we use word aligned, so here we have 
      Node2  at 8 range 0 .. 63;  -- 2 dummy bytes each
      -- more nodes
   end record;
   for Proc_Image'Bit_Order use System.High_Order_First;
   for Proc_Image'Scalar_Storage_Order use System.High_Order_First;
      -- its Big Endian
   
   
end Hw_Definition.Project;
