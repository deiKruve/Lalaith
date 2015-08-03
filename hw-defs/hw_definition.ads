------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                          H W _ D E F I N I T I O N                       --
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
--  this ia the project hardware definition's root file. 

with System;
with Interfaces.C.Extensions;
with Hw_Types;

package Hw_Definition is
   
   package Ice renames Interfaces.C.Extensions;
   package Hwt renames Hw_Types;
   
   type Reserved_Bit is range 0 .. 1 with Size => 1; 
   type Reserved is array (Natural range <>) of Reserved_Bit 
     with Component_Size => 1;
   for Reserved'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   
   --------------------------------------------------------------------
   --  here is a sample node status response frame type              --
   --  as it will arrive in the eth frame, from a discovery cycle    --
   --  From this the master should be able to work out the state     --
   --  of any node.                                                  --
   --  The data is read only.                                        --
   --------------------------------------------------------------------
   type Node_Status_Type is record
         Node_Operational : Hwt.Bits_1 := 0;
         Node_Pre_Op      : Hwt.Bits_1 := 0;
         Node_Orphaned    : Hwt.Bits_1 := 0;
         Node_Soft_Error  : Hwt.Bits_1 := 0;
         -- filler up to 48 bits,
         -- the size of the node address,
         -- in whose place it comes in the frame.
         Filler           : Reserved (4 .. 47);
         --Filler           : Ice.Unsigned_43;
      end record;
      
      for Node_Status_Type use record
         Node_Operational at 0 range 0 .. 0;
         Node_Pre_Op      at 0 range 1 .. 1;
         Node_Orphaned    at 0 range 2 .. 2;
         Node_Soft_Error  at 0 range 3 .. 3;
         Filler           at 0 range 4 .. 47;
      end record;
      for Node_Status_Type'Bit_Order use System.High_Order_First;
      for Node_Status_Type'Scalar_Storage_Order use System.High_Order_First;
      -- its Big Endian
      
      type Node_Status_A_Type is access all Node_Status_Type;
      
      
end Hw_Definition;
