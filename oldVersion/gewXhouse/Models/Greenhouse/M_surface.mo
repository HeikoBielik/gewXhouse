within gewXhouse.Models.Greenhouse;

model M_surface

  parameter Real l;
  parameter Real h;
  parameter Real hr;
  Real A;
  parameter Real a "angular position relative to ground";
  parameter Real o "angular position relative to north";

  Modelica.SIunits.RadiantEnergyFluenceRate I "surface radiation roof west";
  Modelica.SIunits.HeatFlowRate Q "J/s";
  Real Ip;
  
equation

  A = l*h + 0.5*l*hr;
  
end M_surface;
