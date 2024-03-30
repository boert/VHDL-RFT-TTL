# VHDL-RFT-TTL
VHDL-Beschreibung für TTL-Schaltkreise aus Ostdeutschland zur Verwendung in Simulationen oder FPGA-Nachbauten.

Bauteil   | Beschreibung                                        | int. Typ
-------   | ------------                                        | --------
DL 000 D  | 4 NAND mit je 2 Eingängen                           | SN74LS00
DL 002 D  | 4 NOR mit je 2 Eingängen                            | SN74LS02
DL 003 D  | 4 NAND mit je 2 Eingängen, Kollektor offen          | SN74LS03
DL 004 D  | 6 Inverter                                          | SN74LS04 
DL 008 D  | 4 AND mit je 2 Eingängen                            | SN74LS08
DL 010 D  | 3 NAND mit je 3 Eingängen                           | SN74LS10
DL 011 D  | 3 AND mit je 3 Eingängen                            | SN74LS11
DL 020 D  | 2 NAND mit je 4 Eingängen                           | SN74LS20
DL 038 D  | 4 NAND Treiber mit je 2 Eingängen, Kollektor offen  | SN74LS38
DL 074 D  | 2 positiv flanken-getriggerte D-Flip-Flop           | SN74LS74N 
MH7442    | BCD-zu-Dezimal Dekoder                              
DL 051 D  | 2 AND-NOR mit je 2 x 3 und 2 x 2 Eingängen          | SN74LS51N 
DL 083 D  | 4-Bit Volladdierer                                  | DM74LS83
DL 086 D  | 4 Exklusiv-OR-Gatter mit je 2 Eingängen             | SN74LS86
DL 090 D  | Dezimalzähler                                       | SN74LS90
DL 093 D  | 4-Bit Binärzähler                                   | SN74LS93
DL 123 D  | 2 monostabile Multivibratoren                       | SN74LS123
DL 193 D  | 4-Bit synchroner Vor-/Rückwärtszähler               | SN74LS193
DL 251 D  | 8-auf-1 Multiplexer mit Tristate-Ausgängen          | SN74LS251N
DL 253 D  | zweifach 4-auf-1 Multiplexer mit Tristate-Ausgängen | SN74LS253N
