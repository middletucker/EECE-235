/**********************************************************************
* Alarm Structural Description (Alarm_Struct)
* EECE 235
***********************************************************************/
module Alarm_Struct(Sensor, Enable, Alarm_State);

  input [3:0] Sensor; // HIGH if entry open
  input Enable;        // on/off switch to the system, HIGH when armed
  output Alarm_State;  // HIGH if active or alarm sounding
  wire ORout;

  // using gates. recall: outputs first.
  or(ORout, Sensor[0], Sensor[1], Sensor[2], Sensor[3]);
  and(Alarm_State, ORout, Enable);

endmodule