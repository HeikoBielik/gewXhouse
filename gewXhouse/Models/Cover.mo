within gewXhouse.Models;

model Cover
  parameter Modelica.Blocks.Sources.RealExpression w (y= 6e-3) "width" annotation(
    Placement(visible = true, transformation(origin = {-90, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression s(y = 37) "m2 total surface" annotation(
    Placement(visible = true, transformation(origin = {-60, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression l (y= 0.76)  "W/m.K - lambda" annotation(
    Placement(visible = true, transformation(origin = {-24, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression rho (y= 2600) "kg/m3 density" annotation(
    Placement(visible = true, transformation(origin = {-24, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c_p (y= 840) "specific thermal capacity" annotation(
    Placement(visible = true, transformation(origin = {-24, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression G(y = 0.95) annotation(
    Placement(visible = true, transformation(origin = {-90, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  final constant Real pi = Modelica.Constants.pi;
  
  parameter Integer N = 6;
  parameter Real sPitch[N] = {0,0,0,0,0,0};
  parameter Real sNorth[N] = {0,0,0,0,0,0};
  input Real sA[N];

  Real elevation;
  Real azimuth;
  
  Real K;
  //  Modelica.SIunits.RadiantEnergyFluenceRate I[N] "surface radiation";
  //  Modelica.SIunits.RadiantEnergyFluenceRate Ip[N] "positive surface radiation";
  Modelica.Blocks.Interfaces.RealInput I_glob annotation(
    Placement(visible = true, transformation(extent = {{-140, -100}, {-100, -60}}, rotation = 0), iconTransformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput sunPos[2] "elevation, azimuth" annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput I_Intern annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(visible = true,transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor annotation(
    Placement(visible = true, transformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-18, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {20, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {-24, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {-60, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Less less1 annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {50, -80}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression const(y = 0) annotation(
    Placement(visible = true, transformation(origin = {-30, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(switch1.u1, const.y) annotation(
    Line(points = {{38, -88}, {29.5, -88}, {29.5, -94}, {-11.75, -94}, {-11.75, -88}, {-19, -88}}, color = {0, 0, 127}));
  connect(switch1.u3, product2.y) annotation(
    Line(points = {{38, -72}, {28, -72}, {28, -66}, {-12, -66}, {-12, -74}, {-48, -74}}, color = {0, 0, 127}));
  connect(const.y, less1.u2) annotation(
    Line(points = {{-19, -88}, {-2, -88}}, color = {0, 0, 127}));
  connect(less1.u1, product2.y) annotation(
    Line(points = {{-2, -80}, {-12, -80}, {-12, -74}, {-48, -74}}, color = {0, 0, 127}));
  connect(switch1.u2, less1.y) annotation(
    Line(points = {{38, -80}, {21, -80}}, color = {255, 0, 255}));
  connect(switch1.y, I_Intern) annotation(
    Line(points = {{61, -80}, {100, -80}}, color = {0, 0, 127}));
  connect(product2.u2, I_glob) annotation(
    Line(points = {{-72, -80}, {-120, -80}}, color = {0, 0, 127}));
  connect(G.y, product2.u1) annotation(
    Line(points = {{-79, -68}, {-72, -68}}, color = {0, 0, 127}));
  connect(division.u1, s.y) annotation(
    Line(points = {{-36, -30}, {-44, -30}, {-44, 66}, {-49, 66}}, color = {0, 0, 127}));
  connect(product.u2, s.y) annotation(
    Line(points = {{-30, 66}, {-49, 66}}, color = {0, 0, 127}));
  connect(product1.u1, l.y) annotation(
    Line(points = {{8, -16}, {-13, -16}}, color = {0, 0, 127}));
  connect(product1.u2, division.y) annotation(
    Line(points = {{8, -28}, {0.5, -28}, {0.5, -36}, {-13, -36}}, color = {0, 0, 127}));
  connect(product1.y, thermalConductor.G) annotation(
    Line(points = {{31, -22}, {64, -22}, {64, -8}}, color = {0, 0, 127}));
  connect(division.u2, w.y) annotation(
    Line(points = {{-36, -42}, {-74, -42}, {-74, 78}, {-79, 78}}, color = {0, 0, 127}));
  connect(product.u1, w.y) annotation(
    Line(points = {{-30, 78}, {-79, 78}}, color = {0, 0, 127}));
  connect(heatPort, thermalConductor.port_a) annotation(
    Line(points = {{0, 0}, {54, 0}}, color = {191, 0, 0}));
  connect(heatCapacitor.port, thermalConductor.port_a) annotation(
    Line(points = {{20, 20}, {20, 0}, {54, 0}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, environment) annotation(
    Line(points = {{74, 0}, {90, 0}}, color = {191, 0, 0}));
  if cardinality(sunPos[1]) == 0 then
    elevation = 0;
  else
    elevation = sunPos[1];
  end if;
  if cardinality(sunPos[2]) == 0 then
    azimuth = 0;
  else
    azimuth = sunPos[2];
  end if;
  K = pi / 180;
  connect(heatCapacitor.c_p, c_p.y) annotation(
    Line(points = {{4, 36}, {-10, 36}, {-10, 44}, {-13, 44}}, color = {0, 0, 127}));
  connect(heatCapacitor.rho, rho.y) annotation(
    Line(points = {{4, 28}, {-13, 28}}, color = {0, 0, 127}));
  connect(heatCapacitor.volume, product.y) annotation(
    Line(points = {{4, 44}, {-2, 44}, {-2, 72}, {-6, 72}, {-6, 72}}, color = {0, 0, 127}));
//  for i in 1:N loop
//    I[i] = I_glob * (cos(sPitch[i] * K) + cos(abs(azimuth * K - sNorth[i])) * sin(sPitch[i] * K) * tan(elevation * K));
//    Ip[i] = if I[i] < 0 or elevation * K < 0 or abs(sPitch[i] * K - elevation * K) > 41 then 0 else I[i];
//  end for;
//  I_Intern = sum(Ip);
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(rotation = 90, lineColor = {0, 117, 227}, fillColor = {170, 213, 255}, fillPattern = FillPattern.Backward, extent = {{-20, 80}, {20, -80}}), Text(origin = {-60, 0}, extent = {{-50, -34}, {170, -94}}, textString = "%name")}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
  Documentation(info = "<html><head></head><body><p><b>COVER MODEL</b></p><p>The cover model simluates the cover of the greenhouse model. The user is able to adapt his own cover-parameters in the <a href=\"modelica://gewXhouse.Models.House\">house</a> model:&nbsp;</p><p></p><ul><li>width of the cover</li><li>specific thermal capacity</li><li>density</li><li>thermal transmittance, lambda [W/m²k]</li></ul><div>In addiotion the cover models receives from the&nbsp;<a href=\"modelica://gewXhouse.Models.Sun\" style=\"font-size: 12px;\">sun</a>&nbsp;the azimuth and elevation, which is needed for running the model and returns the I_Intern which influences the inner temperature of the greenhouse.&nbsp;</div><p>Overview of cover input/output&nbsp;</p>


<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79.1333px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 198.917px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 271.95px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 30.8px;\">
<td style=\"width: 79.1333px; text-align: center; height: 30.8px;\" rowspan=\"2\"><img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" width=\"45\" height=\"42\"><strong>Input</strong></td>
<td style=\"width: 198.917px; height: 30.8px; text-align: center;\">sunPos[]</td>
<td style=\"width: 271.95px; height: 30.8px; text-align: center;\">azimuth and elevantion of the sun</td>
</tr>
<tr style=\"height: 30.8px;\">
<td style=\"width: 198.917px; height: 30.8px; text-align: center;\">I_glob</td>
<td style=\"width: 271.95px; height: 30.8px; text-align: center;\">direct solar radiation</td>
</tr>
<tr style=\"height: 33px;\">
<td style=\"width: 79.1333px; text-align: center; height: 66px;\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"><strong>Output</strong></td>
<td style=\"width: 198.917px; height: 33px;\">
<p style=\"text-align: center;\">I_Intern</p>
</td>
<td style=\"width: 271.95px; height: 33px; text-align: center;\">transfers the passing solar radiation to the inner components of the greenhouse via thermal conductor </td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>


<p>&nbsp;</p></body></html>"));
end Cover;
