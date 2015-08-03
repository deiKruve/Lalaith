------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                H W _ D E F I N I T I O N . N o d e _ U t i l s           --
--                                                                          --
--                                   B o d y                                --
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
-- These are some utility programs to use on the user side of things
-- they cannot be used on the kernel side since 'Ada.Text_Io' is withed.
--

with Ada.Text_Io;

package body Hw_Definition.Node_Utils is
   package Tio renames Ada.Text_Io;
   
   procedure Print_Node_Status (Name : String; Ns : Node_Status_Type)
   is
      use type Hw_Types.Bits_1;
   begin
      Tio.Put_Line ("node: " & Name & "status :");
      if Ns.Node_Operational = 1 then
         Tio.Put_Line ("   node is operational.");
      end if;
      
      if Ns.Node_Pre_Op = 1 then
         Tio.Put_Line ("   node is pre-operational.");
      end if;
      
      if Ns.Node_Orphaned = 1 then
         Tio.Put_Line ("   node is orphaned.");
      end if;
      
      if Ns.Node_Soft_Error = 1 then
         Tio.Put_Line ("   node has a soft error.");
      end if;
   end Print_Node_Status;
   
   
   ----------------------------------------
   --  displays the field status image.  --
   --  for use in case of error.         --
   ----------------------------------------
   procedure Print_Field_Status_Image (Fs : Main.Field_Status_Image_Type)
   is
   begin
      Print_Node_Status ("S_Node", Fs.S_Node);
      Print_Node_Status ("Node1" , Fs.Node1);
      Print_Node_Status ("Node2" , Fs.Node2);
   end Print_Field_Status_Image;
   
   
end Hw_Definition.Node_Utils;
