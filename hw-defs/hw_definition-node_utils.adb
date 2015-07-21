
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
