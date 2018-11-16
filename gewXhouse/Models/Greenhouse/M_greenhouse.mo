within gewXhouse.Models.Greenhouse;

model M_greenhouse

  Modelica.SIunits.HeatFlowRate Qv "Lüftungswärmeverlust W";
  Modelica.SIunits.Density      dl = 1.2041 "Dichte Luft kg/m^3";
  parameter Real nl = 0.1 "Lüftungsrate 1/s";
  parameter Boolean V_on_off = false "1: Ventilation On / 0:Ventilation Off";
  
  Modelica.SIunits.Length l = 3 "Groundarea Dimension";
  Modelica.SIunits.Length w = 3 "Groundarea Dimension";
  Modelica.SIunits.Area   A     "Groundarea";
  Modelica.SIunits.Volume V     "Volume";
  Modelica.SIunits.Area   S     "Surface outside";
  parameter Real          o = 0 "angular position relative to north";
  
  Modelica.SIunits.Temp_C T_air(start = 20) "Temperature air";
  Modelica.SIunits.HeatCapacity C_in "J/K";
  Modelica.SIunits.HeatCapacity Ce_in "J/K";
  parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure cp = 1005 "air J/kg.K";
  
  parameter Modelica.SIunits.Pressure p = 100000;
  parameter Modelica.SIunits.Mass m = 29.14;
  parameter Modelica.SIunits.SpecificHeatCapacityAtConstantPressure R = 287;
  
  parameter Real pi = 3.141592654;
  Real K;
  
  Modelica.SIunits.HeatFlowRate Q_tot "total_surface_radiation";
  
  //childobjects
    //connectors
  gewXhouse.Connectors.environment    environment annotation(
    Placement(visible = true, transformation(origin = {-84, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Connectors.heat_flow      Wall        annotation(
    Placement(visible = true, transformation(origin = {-64, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -50}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  gewXhouse.Connectors.heat_radiation Radiation   annotation(
    Placement(visible = true, transformation(origin = {-64, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -14}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  
    //surfaces
  gewXhouse.Models.Greenhouse.M_surface Srw(l = 3, h = sqrt(2 * 1.5 ^ 2), hr = 0,   a = 45, o = 270)  annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.M_surface Sre(l = 3, h = sqrt(2 * 1.5 ^ 2), hr = 0,   a = 45, o = 90)   annotation(
    Placement(visible = true, transformation(origin = {50, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.M_surface  Sw(l = 3, h = 2,                 hr = 0,   a = 90, o = 270)  annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.M_surface  Se(l = 3, h = 2,                 hr = 0,   a = 90, o = 90)   annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.M_surface  Sn(l = 3, h = 2,                 hr = 1.5, a = 90, o = 0)    annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.M_surface  Ss(l = 3, h = 2,                 hr = 1.5, a = 90, o = 180)  annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
    //ground
  gewXhouse.Models.Greenhouse.ground g annotation(
    Placement(visible = true, transformation(origin = {1, -61}, extent = {{-29, -29}, {29, 29}}, rotation = 0)));

equation

  K = pi/180;
//radiation surface_roof_west
  Srw.I  = Radiation.I_dir * (cos(Srw.a * K) + cos(abs(Radiation.azimuth * K - (Srw.o + o) * K)) * sin(Srw.a * K) * tan(Radiation.elevation * K));
  Srw.Ip = if Srw.I < 0 or Radiation.elevation < 0 then 0 else Srw.I;
  Srw.Q  = Srw.Ip*Srw.A;
//radiation surface_roof_east
  Sre.I  = Radiation.I_dir * (cos(Sre.a * K) + cos(abs(Radiation.azimuth * K - (Sre.o + o) * K)) * sin(Sre.a * K) * tan(Radiation.elevation * K));
  Sre.Ip = if Sre.I < 0 or Radiation.elevation < 0 then 0 else Sre.I;
  Sre.Q  = Sre.Ip*Sre.A;
//radiation surface_west
  Sw.I  = Radiation.I_dir * (cos(Sw.a * K) + cos(abs(Radiation.azimuth * K - (Sw.o + o) * K)) * sin(Sw.a * K) * tan(Radiation.elevation * K));
  Sw.Ip = if Sw.I < 0 or Radiation.elevation < 0 then 0 else Sw.I;
  Sw.Q  = Sw.Ip*Sw.A;
//radiation surface_east
  Se.I  = Radiation.I_dir * (cos(Se.a * K) + cos(abs(Radiation.azimuth * K - (Se.o + o) * K)) * sin(Se.a * K) * tan(Radiation.elevation * K));
  Se.Ip = if Se.I < 0 or Radiation.elevation < 0 then 0 else Se.I;
  Se.Q  = Se.Ip*Se.A;
//radiation surface_north
  Sn.I  = Radiation.I_dir * (cos(Sn.a * K) + cos(abs(Radiation.azimuth * K - (Sn.o + o) * K)) * sin(Sn.a * K) * tan((if Radiation.elevation < 0 then 0 else Radiation.elevation) * K));
  Sn.Ip = if Sn.I < 0 or Radiation.elevation < 0 then 0 else Sn.I;
  Sn.Q  = Sn.Ip*Sn.A;
//radiation surface_south
  Ss.I  = Radiation.I_dir * (cos(Ss.a * K) + cos(abs(Radiation.azimuth * K - (Ss.o + o) * K)) * sin(Ss.a * K) * tan(Radiation.elevation * K));
  Ss.Ip = if Ss.I < 0 or Radiation.elevation < 0 then 0 else Ss.I;
  Ss.Q  = Ss.Ip*Ss.A;
//Ground
  g.I  = Radiation.I_dir * (cos(g.a * K) + cos(abs(Radiation.azimuth * K - (g.o + o) * K)) * sin(g.a * K) * tan(Radiation.elevation * K));
  g.Ip = if g.I < 0 or Radiation.elevation < 0 then 0 else g.I;
  g.Q  = g.Ip*g.S;
  
  Q_tot = Sn.Q  + 
          Se.Q  + 
          Ss.Q  + 
          Sw.Q  + 
          Sre.Q + 
          Srw.Q;
  
  A = l*w;
  V = Ss.A*l;
  S = Ss.A + Sn.A + Sw.A + Se.A + Srw.A + Sre.A;
  
  Wall.Q = S * Wall.c * (environment.Tout - T_air) / Wall.w;
//flow wall -> air
  C_in = m * cp;
//capa air
  C_in * der(T_air) = Wall.Q + Q_tot + g.Qw + Qv;
  
  Ce_in            = g.Ce;
  Ce_in * der(g.T) = g.Q - g.Qw;
  
  g.Qw = g.Rue*g.S*(g.T - T_air);
//flow floor -> air
  Qv = if V_on_off then dl * cp * nl * V * (environment.Tout - T_air) else 0;

annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.4),
    Icon(graphics = {Line(origin = {-20, -10.15}, points = {{-60, 10.1464}, {-60, -69.8536}, {60, -69.8536}, {60, 10.1464}, {0, 70.1464}, {-60, 10.1464}}, thickness = 0.5), Line(origin = {-55, 10}, points = {{-25, -10}, {25, 10}}, pattern = LinePattern.Dash), Line(origin = {0, 65}, points = {{-20, -5}, {20, 5}}, thickness = 0.5), Line(origin = {60, 10}, points = {{-20, -10}, {20, 10}}, thickness = 0.5), Line(origin = {60, -60}, points = {{-20, -20}, {20, 20}}, thickness = 0.5), Line(origin = {-55, -60}, points = {{-25, -20}, {25, 20}}, pattern = LinePattern.Dash), Line(origin = {25, 15.21}, points = {{-5, 54.7929}, {-55, 4.79289}, {-55, -55.2071}, {55, -55.2071}}, pattern = LinePattern.Dash), Line(origin = {49.8, 15.2}, points = {{-29.7958, 54.7958}, {30.2042, 4.7958}, {30.2042, -55.2042}}, thickness = 0.5)}));
    
end M_greenhouse;
