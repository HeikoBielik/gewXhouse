within gewXhouse.Models;

model Musterhaus "Definition of the house dimensions and orientation"
  parameter Real long = 8.7172797 "latitude" annotation(
    Dialog(group = "Position", tab = "Global"));
  parameter Real lat = 48.8785888 "longitude" annotation(
    Dialog(group = "Position", tab = "Global"));
  parameter Modelica.SIunits.Length length = 3 "Length of the house";
  parameter Modelica.SIunits.Length width = 3 "Width of the house";
  parameter Modelica.SIunits.Length height = 2 "Height of the house";
  parameter Modelica.SIunits.Angle pitch = 0.523599 "Roof pitch of the house";
  parameter Modelica.SIunits.Angle north = 0 "Orientation of the house 'north direction'";
  
  constant Integer N = 6 "number of surfaces";
  Modelica.SIunits.Area sD "Dormer house";
  Real surfacesA[N];
  parameter Real surfacesPitch[N] = {90, 90, 90, 90, pitch, pitch};
  parameter Real surfacesNorth[N] = {0, 90, 180, 270, 90, 270};
  Models.Surface floorSurface(pitch = 0, north = 0) "Ground floor";
  //Models.Surface surfaces[N] "north, east, south, west, east roof, west roof";
  
  gewXhouse.Models.Floor floor annotation(
    Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {78, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment annotation(
    Placement(visible = true, transformation(origin = {22, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Connectors.Interfaces.HeatFluxInput I annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  output Modelica.Blocks.Interfaces.RealOutput T_inside annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput sunPos[2] annotation(
    Placement(visible = true, transformation(origin = {-120, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput posHouse[2] annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Real totalSurface "total surface";
  Real floorArea "floor area";
  gewXhouse.Models.Air air annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Real volumeHouse "volume house";
  gewXhouse.Models.Cover cover annotation(
    Placement(visible = true, transformation(origin = {-20, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(air.heatPort, temperatureSensor.port) annotation(
    Line(points = {{0, 4}, {0, 10}, {68, 10}}, color = {191, 0, 0}));
  connect(cover.I_Intern, floor.I) annotation(
    Line(points = {{-28, 36}, {-28, 36}, {-28, -34}, {-28, -34}}, color = {255, 207, 14}));
  connect(I, cover.I_glob) annotation(
    Line(points = {{-120, 80}, {-28, 80}, {-28, 48}, {-28, 48}}, color = {255, 207, 14}));
  connect(sunPos, cover.sunPos) annotation(
    Line(points = {{-120, 50}, {-38, 50}}, color = {0, 0, 127}, thickness = 0.5));
  connect(environment, cover.environment) annotation(
    Line(points = {{22, 42}, {-6, 42}}, color = {191, 0, 0}));
  connect(cover.heatPort, temperatureSensor.port) annotation(
    Line(points = {{-20, 44}, {-13, 44}, {-13, 42}, {-20, 42}, {-20, 10}, {68, 10}}, color = {191, 0, 0}));
  connect(floor.heatPort, temperatureSensor.port) annotation(
    Line(points = {{-20, -40}, {-20, 10}, {68, 10}}, color = {191, 0, 0}));
  connect(T_inside, temperatureSensor.T) annotation(
    Line(points = {{110, 10}, {88, 10}, {88, 10}, {88, 10}}, color = {0, 0, 127}));
  floorSurface.A = length * width;
  floorArea = floorSurface.A;
  sD = length * length * tan(pitch) / 4;
  surfacesA[1] = length * height + sD;
  surfacesA[2] = width * height;
  surfacesA[3] = surfacesA[1];
  surfacesA[4] = surfacesA[2];
  surfacesA[5] = length / 2 / cos(pitch) * width;
  surfacesA[6] = surfacesA[5];
  totalSurface = (surfacesA[1] + surfacesA[2] + surfacesA[5]) * 2;
  volumeHouse = surfacesA[1] * width;
  posHouse[1] = lat;
  posHouse[2] = long;
  annotation(
    Icon(graphics = { Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}),Text(origin = {-33, -63}, extent = {{1, -15}, {-1, 15}}, textString = "L", fontSize = 15), Text(origin = {47, -49}, extent = {{1, -15}, {-1, 15}}, textString = "W", fontSize = 15), Text(origin = {69, -11}, extent = {{1, -15}, {-1, 15}}, textString = "H", fontSize = 15), Line(points = {{20, 0}, {-80, 0}}, color = {135, 135, 135}, pattern = LinePattern.Dash), Ellipse(origin = {20, 0}, lineColor = {135, 135, 135}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, startAngle = 180, endAngle = 135), Line(points = {{-80, -80}, {20, -80}, {80, -50}, {80, 30}}, color = {255, 0, 0}, thickness = 0.5), Line(points = {{-80, -80}, {-80, 0}, {-30, 50}, {30, 80}, {80, 30}, {20, 0}}, color = {135, 135, 135}), Line(points = {{-30, 50}, {20, 0}, {20, -80}}, color = {135, 135, 135}), Text(origin = {-31, 21}, extent = {{1, -15}, {-1, 15}}, textString = "P", fontSize = 15), Line(origin = {-0.33, 0}, points = {{0, 80}, {-60, 50}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Text(origin = {-69, 65}, extent = {{1, -15}, {-1, 15}}, textString = "N", fontSize = 15), Ellipse(origin = {0, 80}, lineColor = {135, 135, 135}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, startAngle = 180, endAngle = 206), Line(origin = {0, -0.33}, points = {{0, 80}, {-80, 80}}, color = {255, 0, 0}, thickness = 0.5), Text(origin = {1, -19}, lineColor = {180, 180, 180}, fillColor = {180, 180, 180}, extent = {{1, -15}, {-1, 15}}, textString = "M", fontSize = 15)}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Musterhaus;
