within gewXhouse.Models;

model Floor
  parameter Modelica.Blocks.Sources.RealExpression w(y = 1) "m floor width (1)" annotation(
    Placement(visible = true, transformation(origin = {-88, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression s(y = 9) "m2 surface ground floor (9)" annotation(
    Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c(y = 18.285) "W/m2.K heat transfer coefficient" annotation(
    Placement(visible = true, transformation(origin = {-16, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression rho(y = 1014.42) "kg/m3 density (Humus: 1014.42" annotation(
    Placement(visible = true, transformation(origin = {-22, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c_p(y = 1000) "J/Kg.K specific thermal capacity (1000)" annotation(
    Placement(visible = true, transformation(origin = {-22, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression u(y = 12) "m circumference" annotation(
    Placement(visible = true, transformation(origin = {-50, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c1(y = 1.26) "W/m.K heat conductivity coefficient (Humus: 1.26)" annotation(
    Placement(visible = true, transformation(origin = {-16, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression r_v(y = 4) "1 roughness value" annotation(
    Placement(visible = true, transformation(origin = {-50, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));  
  
  Modelica.Blocks.Interfaces.RealInput I(start = 1000) "heat flux" annotation(
    Placement(visible = true, transformation(origin = {-24, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  gewXhouse.Models.Radiation radiation annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor annotation(
    Placement(visible = true, transformation(origin = {44, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor annotation(
    Placement(visible = true, transformation(origin = {62, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-2, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(visible = true, transformation(extent = {{80, -20}, {100, 0}}, rotation = 0), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment annotation(
    Placement(visible = true, transformation(extent = {{80, -80}, {100, -60}}, rotation = 0), iconTransformation(extent = {{-50, -40}, {-30, -20}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor1 annotation(
    Placement(visible = true, transformation(origin = {62, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {28, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(
    Placement(visible = true, transformation(origin = {-16, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product4 annotation(
    Placement(visible = true, transformation(origin = {-16, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(thermalConductor1.port_a, heatCapacitor.port) annotation(
    Line(points = {{52, -70}, {44, -70}, {44, 20}, {44, 20}}, color = {191, 0, 0}));
  connect(thermalConductor.port_a, heatCapacitor.port) annotation(
    Line(points = {{52, -10}, {44, -10}, {44, 20}, {44, 20}}, color = {191, 0, 0}));
  connect(radiation.port, heatCapacitor.port) annotation(
    Line(points = {{20, -10}, {44, -10}, {44, 20}, {44, 20}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatPort) annotation(
    Line(points = {{72, -10}, {88, -10}, {88, -10}, {90, -10}}, color = {191, 0, 0}));
  connect(I, radiation.I) annotation(
    Line(points = {{-24, -10}, {7, -10}}, color = {255, 207, 14}));
  connect(radiation.S, s.y) annotation(
    Line(points = {{7, -4}, {-35.8, -4}, {-35.8, 50}, {-56, 50}}, color = {0, 0, 127}));
  connect(product4.y, product1.u2) annotation(
    Line(points = {{-4, -46}, {16, -46}, {16, -46}, {16, -46}}, color = {0, 0, 127}));
  connect(r_v.y, product4.u2) annotation(
    Line(points = {{-38, -52}, {-28, -52}, {-28, -52}, {-28, -52}}, color = {0, 0, 127}));
  connect(u.y, product3.u1) annotation(
    Line(points = {{-38, -84}, {-28, -84}, {-28, -84}, {-28, -84}}, color = {0, 0, 127}));
  connect(product4.u1, s.y) annotation(
    Line(points = {{-28, -40}, {-36, -40}, {-36, 50}, {-44, 50}, {-44, 50}}, color = {0, 0, 127}));
  connect(c.y, product1.u1) annotation(
    Line(points = {{-5, -24}, {5.5, -24}, {5.5, -34}, {16, -34}}, color = {0, 0, 127}));
  connect(c1.y, product2.u1) annotation(
    Line(points = {{-5, -68}, {4, -68}, {4, -78}, {16, -78}}, color = {0, 0, 127}));
  connect(product1.y, thermalConductor.G) annotation(
    Line(points = {{39, -40}, {62, -40}, {62, -18}}, color = {0, 0, 127}));
  connect(product3.u2, w.y) annotation(
    Line(points = {{-28, -96}, {-70, -96}, {-70, 62}, {-78, 62}, {-78, 62}, {-76, 62}}, color = {0, 0, 127}));
  connect(product3.y, product2.u2) annotation(
    Line(points = {{-4, -90}, {16, -90}, {16, -90}, {16, -90}}, color = {0, 0, 127}));
  connect(product2.y, thermalConductor1.G) annotation(
    Line(points = {{39, -84}, {62, -84}, {62, -78}}, color = {0, 0, 127}));
  connect(environment, thermalConductor1.port_b) annotation(
    Line(points = {{90, -70}, {72, -70}}, color = {191, 0, 0}));
  connect(w.y, product.u1) annotation(
    Line(points = {{-76, 62}, {-14, 62}, {-14, 62}, {-14, 62}}, color = {0, 0, 127}));
  connect(product.u2, s.y) annotation(
    Line(points = {{-14, 50}, {-56, 50}}, color = {0, 0, 127}));
  connect(heatCapacitor.volume, product.y) annotation(
    Line(points = {{28, 44}, {20, 44}, {20, 56}, {9, 56}}, color = {0, 0, 127}));
  connect(rho.y, heatCapacitor.rho) annotation(
    Line(points = {{-22, 22}, {8, 22}, {8, 28}, {28, 28}}, color = {0, 0, 127}));
  connect(c_p.y, heatCapacitor.c_p) annotation(
    Line(points = {{-22, 36}, {28, 36}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(rotation = 90, fillColor = {170, 85, 0}, fillPattern = FillPattern.Backward, extent = {{-20, 80}, {20, -80}}), Text(extent = {{-100, -34}, {120, -94}}, textString = "%name")}),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
    Documentation(info = "<html><head></head><body><p><b>FLOOR MODEL</b></p><p>The floor model is an important part of the greenhouse model. The short wave radiation from the sun, which will be transfered to the cover to the floor turns into long wave radiation in the flloor. The floor is the main \"capacity\" in the greenhouse. If the temperature in the greenhouse is higher than in the floor, the floors save energy and the other way round. The user has the possiblity to enter different materials with the material specific variables: heat transfer coeffizient, density and specific thermal capacity. Those parameter can be changed in the <a href=\"modelica://gewXhouse.Models.House\" style=\"font-size: 12px;\">house</a> model. All needed paramters will transport automatically and the user does not have to connect the components in the floor. In the floor are interacting following modelica- standard components:</p><p></p><ul><li><a href=\"modelica://gewXhouse.Models.HeatCapacitor\">heat capacitor</a></li><li><a href=\"modelica://gewXhouse.Models.Radiation\">radiation</a></li><li><a href=\"modelica://gewXhouse.Models.ThermalConductor\" style=\"font-size: 12px;\">thermal conductor</a></li></ul><br><p>&nbsp;</p>
<p>Overview of house input/output&nbsp;</p>
<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79.1333px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 198.917px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 271.95px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 69px;\">
<td style=\"width: 79.1333px; text-align: center; height: 78.7167px;\"><img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" width=\"45\" height=\"42\"><strong>Input</strong></td>
<td style=\"width: 198.917px; height: 69px; text-align: center;\">I</td>
<td style=\"width: 271.95px; height: 69px; text-align: center;\">Radiation from the sun will be transfered to other components in the greenhouse with the correct physical calculation</td>
</tr>
<tr style=\"height: 45px;\">
<td style=\"width: 79.1333px; text-align: center; height: 45px;\"><strong>Equations</strong></td>
<td style=\"width: 198.917px; height: 45px;\">&nbsp;ja / nein? ich würde sagen nein!</td>
<td style=\"width: 271.95px; height: 45px;\">&nbsp;</td>
</tr>
<tr style=\"height: 33.7167px;\">
<td style=\"width: 79.1333px; text-align: center; height: 78.7167px;\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"><strong>Output</strong></td>
<td style=\"width: 198.917px; height: 33.7167px;\">
<p style=\"text-align: center;\">heat Port</p>
</td>
<td style=\"width: 271.95px; height: 33.7167px; text-align: center;\">The heat port transfers the Q_flow inner the greenhouse</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p></body></html>"));
end Floor;
