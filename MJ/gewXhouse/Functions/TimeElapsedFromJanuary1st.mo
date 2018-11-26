within gewXhouse.Functions;

function TimeElapsedFromJanuary1st
  input String date = "01/01_00:00:00" "Date at t=0s (start of the simulation) in the form de dd/mm_hh:mm:ss";
  output Modelica.SIunits.Time Instant0 "Elapsed time in seconds since 01/01_00:00:00";
end TimeElapsedFromJanuary1st;
