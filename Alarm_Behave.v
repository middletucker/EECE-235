/**********************************************************************
* Alarm Behaviorial Description (Alarm_Behave)
* EECE 235
***********************************************************************/
module Alarm_Behave(Sensor, Enable, Alarm_State);

  input [3:0] Sensor;  // HIGH if entry open
  input Enable;        // on/off switch to the system, HIGH when armed
  output Alarm_State;  // HIGH if active or alarm sounding

  assign Alarm_State = (Sensor[0] | Sensor[1] | Sensor[2] | Sensor[3]) & Enable;

endmodule


