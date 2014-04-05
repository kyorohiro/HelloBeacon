Bleacon = require('bleacon');

var uuid = "AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE";
var major = 1;
var minor = 1;
var measuredPower = -59;

Bleacon.startAdvertising(
uuid,
major,
minor,
measuredPower);
