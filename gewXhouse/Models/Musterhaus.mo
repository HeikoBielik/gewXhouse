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
  
  parameter Real cover_w = 6e-3 "m cover width" annotation(
    Dialog(group = "Parameter", tab = "Cover")); 
  parameter Real cover_l = 0.76 "W/m.K - lambda" annotation(
    Dialog(group = "Parameter", tab = "Cover")); 
  parameter Real cover_rho = 2600 "kg/m3 density" annotation(
    Dialog(group = "Parameter", tab = "Cover")); 
  parameter Real cover_c_p = 840 "J/Kg.K specific thermal capacity" annotation(
    Dialog(group = "Parameter", tab = "Cover")); 
  
  parameter Real floor_w = 1 "m floor depth" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  parameter Real floor_c = 0.76 "W/m.K heat transfer coefficient (Humus: 1.26)" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  parameter Real floor_rho = 1014.42 "kg/m3 density (Humus: 1014.42" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  parameter Real floor_c_p = 1000 "J/Kg.K specific thermal capacity" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  
  parameter Real air_rho = 1.2 "kg/m3 density (Humus: 1014.42" annotation(
    Dialog(group = "Parameter", tab = "Air")); 
  parameter Real air_c_p = 1005 "J/Kg.K specific thermal capacity" annotation(
    Dialog(group = "Parameter", tab = "Air")); 
  
  parameter Real venti_nl = 0.01 "1/s ventilation rate" annotation(
    Dialog(group = "Parameter", tab = "Ventilation")); 
  parameter Real venti_dl = 1.2041 "kg/m3 desity" annotation(
    Dialog(group = "Parameter", tab = "Ventilation")); 
  parameter Real venti_c_p = 1005 "J/Kg.K specific thermal capacity" annotation(
    Dialog(group = "Parameter", tab = "Ventilation")); 
  
  
  Real totalSurface "total surface";
  Real floorArea "floor area";
  Real volumeHouse "volume house";
  constant Integer N = 6 "number of surfaces";
  Modelica.SIunits.Area sD "Dormer house";
  Real surfacesA[N];
  parameter Real surfacesPitch[N] = {90, 90, 90, 90, pitch, pitch};
  parameter Real surfacesNorth[N] = {0, 90, 180, 270, 90, 270};
  Models.Surface floorSurface(pitch = 0, north = 0) "Ground floor";
  //Models.Surface surfaces[N] "north, east, south, west, east roof, west roof";
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {68, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment_air annotation(
    Placement(visible = true, transformation(origin = {8, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput T_inside annotation(
    Placement(visible = true, transformation(origin = {110, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.Interfaces.HeatFluxInput I annotation(
    Placement(visible = true, transformation(origin = {-120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput sunPos[2] annotation(
    Placement(visible = true, transformation(origin = {-120, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput posHouse[2] annotation(
    Placement(visible = true, transformation(origin = {-120, -4}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  gewXhouse.Models.Floor floor(s.y = floorArea) annotation(
    Placement(visible = true, transformation(origin = {-20, -14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Air air(v.y = 30) annotation(
    Placement(visible = true, transformation(origin = {36, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Cover cover(w.y=cover_w, l.y=cover_l, rho.y= cover_rho, c_p.y=cover_c_p, N=N) annotation(
    Placement(visible = true, transformation(origin = {-20, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Ventilation ventilation(v.y = 1)  annotation(
    Placement(visible = true, transformation(origin = {36, 42}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment_floor annotation(
    Placement(visible = true, transformation(origin = {-26, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cover.I_Intern, floor.I) annotation(
    Line(points = {{-28, 36}, {-28, -8}}, color = {255, 207, 14}));
  connect(floor.heatPort, temperatureSensor.port) annotation(
    Line(points = {{-20, -14}, {-20, 8}, {58, 8}}, color = {191, 0, 0}));
  connect(environment_floor, floor.environment) annotation(
    Line(points = {{-26, -62}, {-28, -62}, {-28, -20}}, color = {191, 0, 0}));
  connect(I, cover.I_glob) annotation(
    Line(points = {{-120, 70}, {-28, 70}, {-28, 48}}, color = {255, 207, 14}));
  connect(sunPos, cover.sunPos) annotation(
    Line(points = {{-120, 42}, {-38, 42}}, color = {0, 0, 127}, thickness = 0.5));
  connect(air.heatPort, temperatureSensor.port) annotation(
    Line(points = {{36, 0}, {36, 8}, {47, 8}, {47, 8}, {58, 8}}, color = {191, 0, 0}));
  connect(ventilation.heatPort, air.heatPort) annotation(
    Line(points = {{36, 42}, {36, 0}}, color = {191, 0, 0}));
  connect(T_inside, temperatureSensor.T) annotation(
    Line(points = {{110, 8}, {78, 8}}, color = {0, 0, 127}));
  connect(cover.heatPort, temperatureSensor.port) annotation(
    Line(points = {{-20, 42}, {-20, 8}, {58, 8}}, color = {191, 0, 0}));
  connect(ventilation.environment, environment_air) annotation(
    Line(points = {{22, 42}, {15, 42}, {15, 42}, {8, 42}, {8, 68}, {8, 68}, {8, 68}}, color = {191, 0, 0}));
  connect(environment_air, cover.environment) annotation(
    Line(points = {{8, 68}, {8, 55}, {8, 55}, {8, 42}, {1, 42}, {1, 42}, {-6, 42}}, color = {191, 0, 0}));
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
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-33, -63}, extent = {{1, -15}, {-1, 15}}, textString = "L", fontSize = 15), Text(origin = {47, -49}, extent = {{1, -15}, {-1, 15}}, textString = "W", fontSize = 15), Text(origin = {69, -11}, extent = {{1, -15}, {-1, 15}}, textString = "H", fontSize = 15), Line(points = {{20, 0}, {-80, 0}}, color = {135, 135, 135}, pattern = LinePattern.Dash), Ellipse(origin = {20, 0}, lineColor = {135, 135, 135}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, startAngle = 180, endAngle = 135), Line(points = {{-80, -80}, {20, -80}, {80, -50}, {80, 30}}, color = {255, 0, 0}, thickness = 0.5), Line(points = {{-80, -80}, {-80, 0}, {-30, 50}, {30, 80}, {80, 30}, {20, 0}}, color = {135, 135, 135}), Line(points = {{-30, 50}, {20, 0}, {20, -80}}, color = {135, 135, 135}), Text(origin = {-31, 21}, extent = {{1, -15}, {-1, 15}}, textString = "P", fontSize = 15), Line(origin = {-0.33, 0}, points = {{0, 80}, {-60, 50}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Text(origin = {-69, 65}, extent = {{1, -15}, {-1, 15}}, textString = "N", fontSize = 15), Ellipse(origin = {0, 80}, lineColor = {135, 135, 135}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, startAngle = 180, endAngle = 206), Line(origin = {0, -0.33}, points = {{0, 80}, {-80, 80}}, color = {255, 0, 0}, thickness = 0.5), Text(origin = {1, -19}, lineColor = {180, 180, 180}, fillColor = {180, 180, 180}, extent = {{1, -15}, {-1, 15}}, textString = "M", fontSize = 15)}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Musterhaus;
