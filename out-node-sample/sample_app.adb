------------------------------------------------------------------------------
--                                                                          --
--                            FINROD COMPONENTS                             --
--                                                                          --
--                            S AM P L E _ A P P                            --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                     Copyright (C) 2015, Jan de Kruyf                     --
--                                                                          --
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
--                Finrod  is maintained by J de Kruijf Engineers            --
--                     (email: jan.de.kruyf@hotmail.com)                    --
--                                                                          --
------------------------------------------------------------------------------
--
with Hw_Definition.Sample; 
--  replace '.Sample' with the board's hardware definition 
--  for which this application is written.

with Hw_Definition.Project; pragma Unreferenced (Hw_Definition.Project);
--  this are the collated board definitions
--  they will be used to find the next node in the list
--  and perhaps to read other nodes' data, if needed.

--  with STM32F4;
with Finrod.Nmt;
with Finrod.Board;

package body Sample_App is

   --  package Stm  renames STM32F4;
   
   package Hwd      renames Hw_Definition.Sample;
   --  replace 'Hw_Def_Sample' with the board's hardware definition 
   --  for which this application is written.
   
   package Hwd_Proj renames Hw_Definition.Project;
   pragma Unreferenced (Hwd_Proj);
   
   package Board    renames Finrod.Board;
   
   procedure Init
   is
   begin
      Board.Set_Id (Hwd.Id);
      Board.Set_Type (Hwd.Typ);
      Board.Set_Mac_Address (Hwd.Mac_Addr);
      Board.Set_Ip_Address (Hwd.Ip_Addr);
      null;
   end Init;
   
begin
   Finrod.Nmt.App_Init := Init'Access; -- uplink to the library for initing
				   -- from there
end Sample_App;
