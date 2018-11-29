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
  gewXhouse.Models.Solar_model solar_model(surfacesPitch = surfacesPitch, surfacesNorth = surfacesNorth) annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Models.Floor floor annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment annotation(
    Placement(visible = true, transformation(origin = {106, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.Interfaces.HeatFluxInput I annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  output Modelica.Blocks.Interfaces.RealOutput T_inside annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput sunPos[2] annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput posHouse[2] annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Models.Cover cover annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner Modelica.Blocks.Interfaces.RealOutput totalSurface "total surface" annotation(
    Placement(visible = true, transformation(origin = {52, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Blocks.Interfaces.RealOutput floorArea "floor area" annotation(
    Placement(visible = true, transformation(origin = {-28, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Models.Air air annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner Modelica.Blocks.Interfaces.RealOutput volumeHouse annotation(
    Placement(visible = true, transformation(origin = {12, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cover.environment, environment) annotation(
    Line(points = {{74, -20}, {106, -20}}));
  connect(volumeHouse, air.volumeHouse) annotation(
    Line(points = {{12, -70}, {12, -70}, {12, -32}, {12, -32}}, color = {0, 0, 127}));
  connect(air.heatPort, floor.heatPort) annotation(
    Line(points = {{20, -10}, {20, -10}, {20, 10}, {-20, 10}, {-20, -20}, {-20, -20}}, color = {191, 0, 0}));
  connect(floor.surface, floorArea) annotation(
    Line(points = {{-28, -26}, {-28, -70}}, color = {0, 0, 127}));
  connect(cover.totalSurface, totalSurface) annotation(
    Line(points = {{52, -26}, {52, -70}}, color = {0, 0, 127}));
  connect(solar_model.sunPos, sunPos) annotation(
    Line(points = {{-82, 8}, {-90, 8}, {-90, 40}, {-110, 40}, {-110, 40}, {-120, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(floor.I_Intern, solar_model.I_Intern) annotation(
    Line(points = {{-28, -14}, {-28, -0.5}, {-38, -0.5}, {-38, 0}}, color = {255, 207, 14}));
  connect(solar_model.I_glob, I) annotation(
    Line(points = {{-82, 0}, {-120, 0}}, color = {255, 207, 14}));
  connect(cover.heatPort, floor.heatPort) annotation(
    Line(points = {{60, -20}, {60, 10}, {-20, 10}, {-20, -20}}, color = {191, 0, 0}));
  connect(temperatureSensor.T, T_inside) annotation(
    Line(points = {{100, 10}, {110, 10}}, color = {0, 0, 127}));
  connect(floor.heatPort, temperatureSensor.port) annotation(
    Line(points = {{-20, -20}, {-20, 10}, {80, 10}}, color = {191, 0, 0}));
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
