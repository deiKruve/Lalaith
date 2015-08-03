------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                               H W _ T Y P E S                            --
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
-- The package has some handy unsigned subtypes.
--


package Hw_Types is
   
   type Bits_1  is mod 2**1 with Size => 1;
   type Bits_2  is mod 2**2 with Size => 2;
   type Bits_3  is mod 2**3 with Size => 3;
   type Bits_4  is mod 2**4 with Size => 4;
   type Bits_5  is mod 2**5 with Size => 5;
   type Bits_6  is mod 2**6 with Size => 6;
   type Bits_7  is mod 2**7 with Size => 7;
   type Bits_8  is mod 2**8 with Size => 8;
   subtype Byte is Bits_8;    
   type Bits_9  is mod 2**9 with Size => 9;
   type Bits_11 is mod 2**11 with Size => 11;
   type Bits_12 is mod 2**12 with Size => 12;
   type Bits_13 is mod 2**13 with Size => 13;
   type Bits_14 is mod 2**14 with Size => 14;
   type Bits_15 is mod 2**15 with Size => 15;
   type Bits_16 is mod 2**16 with Size => 16;
   subtype Half_Word is Bits_16;
   type Bits_31 is mod 2**31 with Size => 31;
   type Bits_32 is mod 2**32 with Size => 32;
   subtype Word is Bits_32;
   type Bits_48 is mod 2**48 with Size => 48;
   
end Hw_Types;
