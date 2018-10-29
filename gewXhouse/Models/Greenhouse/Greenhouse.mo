within gewXhouse.Models.Greenhouse;

model Greenhouse
  
  Modelica.SIunits.Length l = 3 "Groundarea Dimension";
  Modelica.SIunits.Length w = 3 "Groundarea Dimension";
  Modelica.SIunits.Area   A "Groundarea";
  Modelica.SIunits.Volume V "Volume";
  Modelica.SIunits.Area   S "Surcace outside";
  Modelica.SIunits.Temperature T(start = 273.15)  "Temperature inside";
  parameter Modelica.SIunits.Temperature Tout = 293.15  "Temperature outside";
  
  parameter Real p = 100000;
  parameter Real m = 29.14;
  parameter Real R = 287;
  
//childobjects
  gewXhouse.Connectors.heat_flow                Wall annotation(
    Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-30, -30}, {30, 30}}, rotation = 0), iconTransformation(origin = {-80, -36}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  
  gewXhouse.Models.Greenhouse.surface_north     Sn   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surcafe_east      Se   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_west      Sw   annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_roof_east Sre  annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_roof_west Srw  annotation(
    Placement(visible = false, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.surface_south     Ss   annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));

equation

  p*V = R*m*T;
  A = l*w;
  V = Ss.A*l;
  S = Ss.A + Sn.A + Sw.A + Se.A + Srw.A + Sre.A;
  Wall.dT = T-Tout;
  Wall.Q = S * Wall.c * Wall.dT / Wall.w;
  
  annotation(
    Icon(graphics = {Line(origin = {-19.96, -79.75}, points = {{-60, 0}, {60, 0}}, thickness = 1), Line(origin = {-79.96, -39.75}, points = {{0, -40}, {0, 40}}, thickness = 1), Line(origin = {60, -60}, points = {{-20, -20}, {20, 20}}, thickness = 1), Line(origin = {80, -10}, points = {{0, 30}, {0, -30}}, thickness = 1), Line(origin = {-50, 20}, points = {{-30, -20}, {30, 40}}, thickness = 1), Line(origin = {20, -40}, points = {{60, 0}, {-60, 0}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-60, -60}, points = {{-20, -20}, {20, 20}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-40, -10}, points = {{0, -30}, {0, 30}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-60, 10}, points = {{20, 10}, {-20, -10}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-10, 50}, points = {{-30, -30}, {30, 20}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {10, 30}, points = {{-30, 30}, {30, -30}}, thickness = 1), Line(origin = {40, -40}, points = {{0, 40}, {0, -40}}, thickness = 1), Line(origin = {0, 70}, points = {{-20, -10}, {20, 0}}, thickness = 1), Line(origin = {50, 50}, points = {{-30, 20}, {30, -30}}, thickness = 1), Line(origin = {60, 10}, points = {{-20, -10}, {20, 10}}, thickness = 1), Line(origin = {-19.96, -89.04}, points = {{5.96394, 3.03549}, {-0.0360607, 7.03549}, {-10.0361, 1.03549}, {9.96394, -0.96451}, {-0.0360607, -6.96451}, {-6.0361, -2.96451}}, thickness = 0.75, smooth = Smooth.Bezier), Line(origin = {20, -29.58}, points = {{-6, -6.41958}, {-6, 5.58042}, {6, -6.41958}, {6, 5.58042}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 0.75), Ellipse(origin = {74, -59}, lineThickness = 1, extent = {{-4, 5}, {4, -7}}, endAngle = 360), Line(origin = {-71.5803, -58.316}, points = {{-6.13986, 4.3959}, {-2.13986, -5.6041}, {-0.139859, 0.395903}, {1.86014, -5.6041}, {5.86014, 4.3959}}, color = {68, 68, 68}, pattern = LinePattern.Dash, thickness = 1)}, coordinateSystem(initialScale = 0.1)));

end Greenhouse;
