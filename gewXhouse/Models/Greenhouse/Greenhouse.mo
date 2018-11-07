within gewXhouse.Models.Greenhouse;

model Greenhouse
  
  Modelica.SIunits.Length l = 3 "Groundarea Dimension";
  Modelica.SIunits.Length w = 3 "Groundarea Dimension";
  Modelica.SIunits.Area   A "Groundarea";
  Modelica.SIunits.Volume V "Volume";
  Modelica.SIunits.Area   S "Surcace outside";
  Real o = 0 "angular position relative to north";
  
  Modelica.SIunits.Temp_C T(start = 20)  "Temperature inside";
  Modelica.SIunits.HeatCapacity C_in "J/K";
  parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure cp = 1005 "air J/kg.K";
  
  parameter Modelica.SIunits.Pressure p = 100000;
  parameter Modelica.SIunits.Mass m = 29.14;
  parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure R = 287;
  
  parameter Real pi = 3.141592654;
  Real K;
  
  Modelica.SIunits.HeatFlowRate Q_tot "total_surface_radiation";
  
  //childobjects
  gewXhouse.Connectors.environment environment annotation(
    Placement(visible = true, transformation(origin = {80, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Connectors.heat_flow                Wall annotation(
    Placement(visible = true, transformation(origin = {-81, -45}, extent = {{-45, -45}, {45, 45}}, rotation = 0), iconTransformation(origin = {-80, -36}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  gewXhouse.Connectors.heat_radiation      Radiation annotation(
  Placement(visible = true, transformation(origin = {-81, -17}, extent = {{-61, -61}, {61, 61}}, rotation = 0), iconTransformation(origin = {-86, 34}, extent = {{-42, -42}, {42, 42}}, rotation = 0)));

  gewXhouse.Models.Greenhouse.surface_roof_west Srw  annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_roof_east Sre  annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_west      Sw   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_east      Se   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_north     Sn   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_south     Ss   annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.ground g;
  
equation

  K = pi/180;

  //surface_roof_west
  Srw.I  = Radiation.I_dir * (cos(Srw.a * K) + cos(abs(Radiation.azimuth * K - (Srw.o + o) * K)) * sin(Srw.a * K) * tan(Radiation.elevation * K));
  Srw.Ip = if Srw.I < 0 or Radiation.elevation < 0 then 0 else Srw.I;
  Srw.Q  = Srw.Ip*Srw.A;
  
  //surface_roof_east
  Sre.I  = Radiation.I_dir * (cos(Sre.a * K) + cos(abs(Radiation.azimuth * K - (Sre.o + o) * K)) * sin(Sre.a * K) * tan(Radiation.elevation * K));
  Sre.Ip = if Sre.I < 0 or Radiation.elevation < 0 then 0 else Sre.I;
  Sre.Q  = Sre.Ip*Sre.A;
    
  //surface_west
  Sw.I   = Radiation.I_dir * (cos(Sw.a * K) + cos(abs(Radiation.azimuth * K - (Sw.o + o) * K)) * sin(Sw.a * K) * tan(Radiation.elevation * K));
  Sw.Ip  = if Sw.I < 0 or Radiation.elevation < 0 then 0 else Sw.I;
  Sw.Q   = Sw.Ip*Sw.A;
  
  //surface_east
  Se.I   = Radiation.I_dir * (cos(Se.a * K) + cos(abs(Radiation.azimuth * K - (Se.o + o) * K)) * sin(Se.a * K) * tan(Radiation.elevation * K));
  Se.Ip  = if Se.I < 0 or Radiation.elevation < 0 then 0 else Se.I;
  Se.Q   = Se.Ip*Se.A;
  
  //surface_north
  Sn.I   = Radiation.I_dir * (cos(Sn.a * K) + cos(abs(Radiation.azimuth * K - (Sn.o + o) * K)) * sin(Sn.a * K) * tan((if Radiation.elevation < 0 then 0 else Radiation.elevation) * K));
  Sn.Ip  = if Sn.I < 0 or Radiation.elevation < 0 then 0 else Sn.I;
  Sn.Q   = Sn.Ip*Sn.A;
  
  //surface_south
  Ss.I   = Radiation.I_dir * (cos(Ss.a * K) + cos(abs(Radiation.azimuth * K - (Ss.o + o) * K)) * sin(Ss.a * K) * tan(Radiation.elevation * K));
  Ss.Ip  = if Ss.I < 0 or Radiation.elevation < 0 then 0 else Ss.I;
  Ss.Q   = Ss.Ip*Ss.A;
  
  Q_tot = Sn.Q  + 
          Se.Q  + 
          Ss.Q  + 
          Sw.Q  + 
          Sre.Q + 
          Srw.Q;
  
  A = l*w;
  V = Ss.A*l;
  S = Ss.A + Sn.A + Sw.A + Se.A + Srw.A + Sre.A;
  
  Wall.Q        = S * Wall.c * (environment.Tout - T) / Wall.w;
  C_in          = m * cp+g.Ce;
  C_in * der(T) = Wall.Q + Q_tot;
  
  annotation(
    Icon(graphics = {Line(origin = {-19.96, -79.75}, points = {{-60, 0}, {60, 0}}, thickness = 1), Line(origin = {-79.96, -39.75}, points = {{0, -40}, {0, 40}}, thickness = 1), Line(origin = {60, -60}, points = {{-20, -20}, {20, 20}}, thickness = 1), Line(origin = {80, -10}, points = {{0, 30}, {0, -30}}, thickness = 1), Line(origin = {-50, 20}, points = {{-30, -20}, {30, 40}}, thickness = 1), Line(origin = {20, -40}, points = {{60, 0}, {-60, 0}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-60, -60}, points = {{-20, -20}, {20, 20}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-40, -10}, points = {{0, -30}, {0, 30}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-60, 10}, points = {{20, 10}, {-20, -10}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-10, 50}, points = {{-30, -30}, {30, 20}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {10, 30}, points = {{-30, 30}, {30, -30}}, thickness = 1), Line(origin = {40, -40}, points = {{0, 40}, {0, -40}}, thickness = 1), Line(origin = {0, 70}, points = {{-20, -10}, {20, 0}}, thickness = 1), Line(origin = {50, 50}, points = {{-30, 20}, {30, -30}}, thickness = 1), Line(origin = {60, 10}, points = {{-20, -10}, {20, 10}}, thickness = 1), Line(origin = {-19.96, -89.04}, points = {{5.96394, 3.03549}, {-0.0360607, 7.03549}, {-10.0361, 1.03549}, {9.96394, -0.96451}, {-0.0360607, -6.96451}, {-6.0361, -2.96451}}, thickness = 0.75, smooth = Smooth.Bezier), Line(origin = {20, -29.58}, points = {{-6, -6.41958}, {-6, 5.58042}, {6, -6.41958}, {6, 5.58042}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 0.75), Ellipse(origin = {74, -59}, lineThickness = 1, extent = {{-4, 5}, {4, -7}}, endAngle = 360), Line(origin = {-71.5803, -58.316}, points = {{-6.13986, 4.3959}, {-2.13986, -5.6041}, {-0.139859, 0.395903}, {1.86014, -5.6041}, {5.86014, 4.3959}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1)}, coordinateSystem(initialScale = 0.1)));

end Greenhouse;
