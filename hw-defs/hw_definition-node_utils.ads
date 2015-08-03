------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                H W _ D E F I N I T I O N . N o d e _ U t i l s           --
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
-- These are some utility programs to use on the user side of things
-- they cannot be used on the kernel side since 'Ada.Text_Io' is withed.
--

with Hw_Definition.Main;

package Hw_Definition.Node_Utils is
   
   procedure Print_Node_Status (Name : String; Ns : Node_Status_Type);
   --  prints out the status of a single node.
   
   procedure Print_Field_Status_Image (Fs : Main.Field_Status_Image_Type);
   --  displays the field status image.
   --  for use in case of error.
   --
   --   This routine must be adjusted at appl design time
   
   
end Hw_Definition.Node_Utils;
