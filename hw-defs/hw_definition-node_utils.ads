
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
