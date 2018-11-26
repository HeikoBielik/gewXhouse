within gewXhouse.Models.Greenhouse;

connector Surface
  
  parameter Modelica.SIunits.Angle a "angular position relative to ground";
  parameter Modelica.SIunits.Angle o "angular position relative to north";

  Modelica.SIunits.RadiantEnergyFluenceRate I "surface radiation";
  Modelica.SIunits.HeatFlowRate Q "J/s";
  Modelica.SIunits.RadiantEnergyFluenceRate Ip "positive surface radiation";
  
  Modelica.SIunits.Area A;
  
end Surface;
