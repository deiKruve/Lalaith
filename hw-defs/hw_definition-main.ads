------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                     H W _ D E F I N I T I O N . M A I N                  --
--                                                                          --
--                                   S p e c                                --
--                                                                          --
--                     Copyright (C) 2015, Jan de Kruyf                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.                                               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
--          NINIEL - NIENOR  is maintained by J de Kruijf Engineers         --
--                     (email: jan.de.kruyf@hotmail.com)                    --
--                                                                          --
------------------------------------------------------------------------------

-- implementation of a fast Ethernet communication server
--
-- This part of the application interface.
--
--  this is the projects hardware definition's file, for use in the 
--  main station. 
-- It must be adapted for each new application, depending on the nodes.
-- see below.
--

with System;

with Hw_Types;

with Hw_Definition.Sample; --)
with Hw_Definition.Node1;  -- } replace with the actual list
with Hw_Definition.Node2;  --)
-- ..
-- ..
-- replace with the actual list:
--  for all marked entities the entries here must be replaced with
--  the data for your application.

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
      Sample : Hwt.Bits_48 := Hw_Definition.Sample.Mac_Addr; --)           
      Node1  : Hwt.Bits_48 := Hw_Definition.Node1.Mac_Addr;  -- } see above
      Node2  : Hwt.Bits_48 := Hw_Definition.Node2.Mac_Addr;  --)           
      -- we need a filler to make the frame 38 octets. (304 bits)
      -- see niniel.discover for the reasoning (type Disco_Packet_Type)
      Filler : Reserved (1 .. Filler_Size);
      -- but the space will be decided in the 'use record' stanza.
      -- Filler : Ice.Unsigned_8;
   end record;
   
   for Mac_Addr_Ary_Type use record
      Sample at  0 range 0 .. 47; --)           
      Node1  at  6 range 0 .. 47; -- } see above
      Node2  at 12 range 0 .. 47; --)           
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
      S_Node : Hw_Definition.Sample.Hw_Def_Data_type; --)           
      Node1  : Hw_Definition.Node1.Hw_Def_Data_type;  -- } see above
      Node2  : Hw_Definition.Node2.Hw_Def_Data_type;  --)           
   end record;
   
   for Field_Data_Image_Type use record
      S_Node at  0 range 0 .. 47; --)           
      Node1  at  8 range 0 .. 47; -- } see above
      Node2  at 16 range 0 .. 47; --)           
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
      S_Node : Node_Status_Type; --)           
      Node1  : Node_Status_Type; -- } see above
      Node2  : Node_Status_Type; --)           
      Filler : Reserved (1 .. Filler_Size);
      -- Filler : Ice.Unsigned_10;
      -- we leave the filler off here, thers no need for it??
   end record;
   
   for Field_Status_Image_Type use record
      S_Node at  0 range 0 .. 47; --)           
      Node1  at  6 range 0 .. 47; -- } see above
      Node2  at 12 range 0 .. 47; --)           
      Filler at 18 range 0 .. Filler_Size - 1;
   end record;
   for Field_Status_Image_Type'Bit_Order            use System.High_Order_First;
   for Field_Status_Image_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   -- not sure about this
   --
   --  Field_Status : Field_Status_Image_Type;
   --  --  master field status image
   --  --  for use any where
   
   
end Hw_Definition.Main;
