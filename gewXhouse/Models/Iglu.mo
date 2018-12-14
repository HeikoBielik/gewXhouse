within gewXhouse.Models;

model Iglu
  parameter Real long = 8.7172797 "longitude" annotation(
    Dialog(group = "Position", tab = "Global"));
  parameter Real lat = 48.8785888 "latitude" annotation(
    Dialog(group = "Position", tab = "Global"));
  parameter Modelica.SIunits.Length diameter = 3 "Diameter of the house";
  
  parameter Real cover_rho = 2600 "kg/m3 density" annotation(
    Dialog(group = "Parameter", tab = "Cover")); 
  parameter Real cover_c_p = 840 "J/Kg.K specific thermal capacity" annotation(
    Dialog(group = "Parameter", tab = "Cover")); 
  parameter Real G = 0.95 annotation(
    Dialog(group = "Parameter", tab = "Cover")); 
  parameter Real cover_w_cover = 18e-3 "m total cover width (glass + gas)" annotation(
    Dialog(group = "Glass", tab = "Cover")); 
  parameter Real cover_w_gas = 12e-3 "m gas gap" annotation(
    Dialog(group = "Glass", tab = "Cover")); 
  parameter Real cover_l_glass = 760e-3 "W/m.K lambda" annotation(
    Dialog(group = "Glass", tab = "Cover")); 
  parameter Real cover_l_gas = 26e-3 "W/m.K lambda (Krypton = 9.5e-3, Xenon = 5.5e-3)" annotation(
    Dialog(group = "Glass", tab = "Cover")); 
  
  parameter Real floor_w = 0.5 "m floor depth" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  parameter Real floor_c = 20 "W/m2.K heat transfer coefficient" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  parameter Real floor_c1 = 1.26 "W/m.K heat conductivity coefficient (Humus: 1.26)" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  parameter Real floor_rho = 1014.42 "kg/m3 density (Humus: 1014.42" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  parameter Real floor_c_p = 1000 "J/Kg.K specific thermal capacity" annotation(
    Dialog(group = "Parameter", tab = "Floor")); 
  parameter Real floor_r_v = 4 "1 roughness value" annotation(
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
  parameter Boolean venti_on_off = false "Ventilation Switch On/Off" annotation(
    Dialog(group = "Parameter", tab = "Ventilation")); 
    
  final constant Real pi = Modelica.Constants.pi;
     
  Real sTotal "total surface";
  Real sAFloor "floor area";
  Real vTotal "volume house";
  Real cTotal "house circumference";
  //Models.Surface floorSurface(pitch = 0, north = 0) "Ground floor";
  //Surface1 surface "north, east, south, west, east roof, west roof";
  Modelica.Blocks.Interfaces.RealInput I annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput pos[2] = {long, lat}annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput SunPos[2] annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {70, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput t_inside annotation(
    Placement(visible = true, transformation(origin = {120, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a out annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_b annotation(
    Placement(visible = true, transformation(origin = {-28, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0), iconTransformation(origin = {110, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  
  gewXhouse.Models.Floor floor(s.y = sAFloor,w.y=floor_w, c.y=floor_c, rho.y= floor_rho, c_p.y=floor_c_p, u.y=cTotal, c1.y=floor_c1, r_v.y=floor_r_v) annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Cover cover( c_p.y = cover_c_p, l_glass = cover_l_glass, l_gas=cover_l_gas, rho.y = cover_rho,s.y=sTotal,w_cover=cover_w_cover,w_gas=cover_w_gas,G.y=G) annotation(
    Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Ventilation ventilation(v.y = vTotal, nl.y=venti_nl, dl.y=venti_dl, c_p.y=venti_c_p, V_on_off.y=venti_on_off) annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  gewXhouse.Models.Air air(v.y = vTotal, rho.y=air_rho, c_p.y=air_c_p) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation
  connect(air.port, floor.heatPort) annotation(
    Line(points = {{40, -10}, {40, 8}, {-20, 8}, {-20, -20}}, color = {191, 0, 0}));
  connect(cover.heatPort, air.port) annotation(
    Line(points = {{-20, 40}, {-20, 8}, {40, 8}, {40, -10}}, color = {191, 0, 0}));
  connect(ventilation.heatPort, air.port) annotation(
    Line(points = {{40, 40}, {40, -10}}, color = {191, 0, 0}));
  connect(temperatureSensor.port, air.port) annotation(
    Line(points = {{60, 8}, {40, 8}, {40, -10}}, color = {191, 0, 0}));
  connect(port_b, floor.environment) annotation(
    Line(points = {{-28, -50}, {-28, -26}}, color = {191, 0, 0}));
  connect(ventilation.environment, out) annotation(
    Line(points = {{26, 40}, {10, 40}, {10, 70}}, color = {191, 0, 0}));
  connect(cover.environment, out) annotation(
    Line(points = {{-6, 40}, {10, 40}, {10, 70}}, color = {191, 0, 0}));
  connect(temperatureSensor.T, t_inside) annotation(
    Line(points = {{80, 8}, {120, 8}}, color = {0, 0, 127}));
  connect(cover.sunPos, SunPos) annotation(
    Line(points = {{-38, 40}, {-120, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(cover.I_Intern, floor.I) annotation(
    Line(points = {{-28, 34}, {-28, 34}, {-28, -14}, {-28, -14}}, color = {0, 0, 127}));
  connect(I, cover.I_glob) annotation(
    Line(points = {{-120, 80}, {-28, 80}, {-28, 46}, {-28, 46}}, color = {0, 0, 127}));

  sAFloor = pi*(diameter/2)^2;
  sTotal = (pi*diameter^2)/2;
  vTotal = pi*(diameter^3)/12;
  cTotal = pi*diameter;
  
    annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}),Polygon(origin = {-3, -8}, fillColor = {223, 223, 223}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-77, 18}, {-85, -22}, {-75, -48}, {-39, -68}, {13, -70}, {59, -60}, {85, -38}, {83, 4}, {61, 42}, {31, 64}, {3, 70}, {-31, 64}, {-57, 48}, {-57, 48}, {-77, 18}}), Line(origin = {-2.98, -44.01}, points = {{-85.0211, 14.0059}, {-73.0211, 34.0059}, {-75.0211, -11.9941}, {-55.0211, 8.00593}, {-39.0211, -31.9941}, {-13.0211, 8.00593}, {12.9789, -33.9941}, {38.9789, 10.0059}, {58.9789, -23.9941}, {70.9789, 18.0059}, {84.9789, -1.99407}}, thickness = 0.5), Line(origin = {0.2, -3.26}, points = {{79.7986, -0.739192}, {67.7986, -22.7392}, {35.7986, -30.7392}, {-16.2014, -32.7392}, {-58.2014, -32.7392}, {-76.2014, -6.73919}, {-80.2014, 13.2608}, {-60.2014, 35.2608}, {-76.2014, -6.73919}, {-44.2014, 9.26081}, {-58.2014, -32.7392}, {-58.2014, -32.7392}}, thickness = 0.5), Line(origin = {2.12, 2.22}, points = {{-62.1156, 37.7774}, {-62.1156, 29.7774}, {-46.1156, 3.77735}, {-18.1156, -38.2226}, {3.88442, 9.7774}, {33.8844, -36.2226}, {51.8844, 7.77735}, {65.8844, -28.2226}}, thickness = 0.5), Line(origin = {10.32, 29.75}, points = {{69.6756, -33.7476}, {43.6756, -19.7476}, {-4.32437, -17.7476}, {-54.3244, -23.7476}, {-30.3244, 14.2524}, {-70.3244, 2.25241}, {-44.3244, 26.2524}, {-30.3244, 14.2524}, {-10.3244, 32.2524}, {15.6756, 14.2524}, {17.6756, 26.2524}}, thickness = 0.5), Line(origin = {19.14, 27.18}, points = {{6.86036, 16.8179}, {-39.1396, 16.8179}, {-13.1396, -15.1821}, {6.86036, 16.8179}, {34.8604, -17.1821}, {38.8604, 6.81785}, {6.86036, 16.8179}}, thickness = 0.5), Text(origin = {-9, 80}, extent = {{47, -12}, {-47, 12}}, textString = "3V 4/9")}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
  Documentation(info = "<html><head></head><body><p><b>IGLU MODEL</b></p><p>The iglu model simulates a simplified interior from a greenhouse. It is simulare to the   <a href=\"modelica://gewXhouse.Models.House\">house</a> model with iglu specific dimensions. It needs a diameter to calculting the surface, volume to run the simulation. As mentioned in the house model the iglu has following inner components:</p><p></p><ul><li><a href=\"modelica://gewXhouse.Models.Cover\">cover</a></li><li><a href=\"modelica://gewXhouse.Models.Ventilation\">ventilation</a></li><li><a href=\"modelica://gewXhouse.Models.Floor\" style=\"font-size: 12px;\">floor</a></li><li><a href=\"modelica://gewXhouse.Models.Air\" style=\"font-size: 12px;\">air</a></li></ul>This components are interacting together with connectors. The red lines connect the temperatures within the different components and the blue lines link the flux from.&nbsp;<br><p>Overview of iglu input/output&nbsp;</p>
<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79.1333px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 198.917px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 271.95px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 69px;\">
<td style=\"width: 79.1333px; text-align: center; height: 69px;\" rowspan=\"2\"><img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"><p></p><strong>Input<br><br></strong></td>
<td style=\"width: 198.917px; height: 69px; text-align: center;\">I</td>
<td style=\"width: 271.95px; height: 69px; text-align: center;\">Radiation from the sun will be transfered to other components in the greenhouse with the correct physical calculation</td>
</tr>
<tr style=\"height: 45px;\">
<td style=\"width: 198.917px; height: 45px; text-align: center;\">sunPos[2]</td>
<td style=\"width: 271.95px; height: 45px;\">The sunPos[] with azimuth and elevation provides the iglu model to calculate solar radiation from from different angles and a value of the solar radioation over the day</td>
</tr>

<tr style=\"height: 33.7167px;\">
<td style=\"width: 79.1333px; text-align: center; height: 78.7167px;\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"><strong>Output</strong></td>
<td style=\"width: 198.917px; height: 33.7167px;\">
<p style=\"text-align: center;\">t_inside</p>
</td>
<td style=\"width: 271.95px; height: 33.7167px; text-align: center;\">This value provides the user to see the simulated temperature in the iglu</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p></body></html>"));
end Iglu;
