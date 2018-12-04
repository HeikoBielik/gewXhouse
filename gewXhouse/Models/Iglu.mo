within gewXhouse.Models;

model Iglu "Definition of the house dimensions and orientation"
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
  
  parameter Real surfacesPitch[N] = {90, 90, 90, 90, pitch, pitch};
  parameter Real surfacesNorth[N] = {0, 90, 180, 270, 90, 270};
  Real surfacesA[N];
  
  constant Integer N = 6 "number of surfaces";
  Real totalSurface "total surface";
  Real floorArea "floor area";
  Real volumeHouse "volume house";
  Modelica.SIunits.Area sD "Dormer house area";
  
  Models.Surface floorSurface(pitch = 0, north = 0) "Ground floor";
  //Models.Surface surfaces[N] "north, east, south, west, east roof, west roof";
  
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {68, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment_air annotation(
    Placement(visible = true, transformation(origin = {8, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput T_inside annotation(
    Placement(visible = true, transformation(origin = {110, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Connectors.Interfaces.HeatFluxInput I annotation(
    Placement(visible = true, transformation(origin = {-120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput sunPos[2] annotation(
    Placement(visible = true, transformation(origin = {-120, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput posHouse[2] annotation(
    Placement(visible = true, transformation(origin = {-120, -4}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  gewXhouse.Models.Floor floor(s.y = floorArea,w.y=floor_w, c.y=floor_c, rho.y= floor_rho, c_p.y=floor_c_p) annotation(
    Placement(visible = true, transformation(origin = {-20, -14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Air air(v.y = volumeHouse, rho.y=air_rho, c_p.y=air_c_p) annotation(
    Placement(visible = true, transformation(origin = {36, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Cover cover(w.y=cover_w, l.y=cover_l, rho.y= cover_rho, c_p.y=cover_c_p, N=N) annotation(
    Placement(visible = true, transformation(origin = {-20, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Ventilation ventilation(v.y = volumeHouse, nl.y=venti_nl, dl.y=venti_dl, c_p.y=venti_c_p)  annotation(
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
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}),Polygon(origin = {-3, -8}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-77, 18}, {-85, -22}, {-75, -48}, {-39, -68}, {13, -70}, {59, -60}, {85, -38}, {83, 4}, {61, 42}, {31, 64}, {3, 70}, {-31, 64}, {-57, 48}, {-57, 48}, {-77, 18}}), Line(origin = {-2.98, -44.01}, points = {{-85.0211, 14.0059}, {-73.0211, 34.0059}, {-75.0211, -11.9941}, {-55.0211, 8.00593}, {-39.0211, -31.9941}, {-13.0211, 8.00593}, {12.9789, -33.9941}, {38.9789, 10.0059}, {58.9789, -23.9941}, {70.9789, 18.0059}, {84.9789, -1.99407}}, thickness = 0.5), Line(origin = {0.2, -3.26}, points = {{79.7986, -0.739192}, {67.7986, -22.7392}, {35.7986, -30.7392}, {-16.2014, -32.7392}, {-58.2014, -32.7392}, {-76.2014, -6.73919}, {-80.2014, 13.2608}, {-60.2014, 35.2608}, {-76.2014, -6.73919}, {-44.2014, 9.26081}, {-58.2014, -32.7392}, {-58.2014, -32.7392}}, thickness = 0.5), Line(origin = {2.12, 2.22}, points = {{-62.1156, 37.7774}, {-62.1156, 29.7774}, {-46.1156, 3.77735}, {-18.1156, -38.2226}, {3.88442, 9.7774}, {33.8844, -36.2226}, {51.8844, 7.77735}, {65.8844, -28.2226}}, thickness = 0.5), Line(origin = {10.32, 29.75}, points = {{69.6756, -33.7476}, {43.6756, -19.7476}, {-4.32437, -17.7476}, {-54.3244, -23.7476}, {-30.3244, 14.2524}, {-70.3244, 2.25241}, {-44.3244, 26.2524}, {-30.3244, 14.2524}, {-10.3244, 32.2524}, {15.6756, 14.2524}, {17.6756, 26.2524}}, thickness = 0.5), Line(origin = {19.14, 27.18}, points = {{6.86036, 16.8179}, {-39.1396, 16.8179}, {-13.1396, -15.1821}, {6.86036, 16.8179}, {34.8604, -17.1821}, {38.8604, 6.81785}, {6.86036, 16.8179}}, thickness = 0.5), Text(origin = {-9, 80}, extent = {{47, -12}, {-47, 12}}, textString = "3V 4/9")}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Iglu;
