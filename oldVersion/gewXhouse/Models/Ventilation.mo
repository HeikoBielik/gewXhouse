within gewXhouse.Models;

model Ventilation
  parameter Modelica.Blocks.Sources.RealExpression v(y= 30) "m3 house volume" annotation(
    Placement(visible = true, transformation(origin = {-80, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -56}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  parameter Modelica.Blocks.Sources.RealExpression nl(y= 0.01) "1/s ventilation rate" annotation(
    Placement(visible = true, transformation(origin = {-80, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -56}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  parameter Modelica.Blocks.Sources.RealExpression dl(y=1.2041) "kg/m3 desity" annotation(
    Placement(visible = true, transformation(origin = {-80, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -56}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  parameter Modelica.Blocks.Sources.RealExpression c_p(y= 1005) "J/kg.K air" annotation(
    Placement(visible = true, transformation(origin = {-80, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -56}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  parameter Real V_on_off=1 "1: Ventilation On / 0:Ventilation Off";

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(visible = true,transformation(extent = {{-42, -10}, {-22, 10}}, rotation = 0), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment annotation(
    Placement(visible = true, transformation(origin = {62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor annotation(
    Placement(visible = true, transformation(origin = {18, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 4)  annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(thermalConductor.port_b, environment) annotation(
    Line(points = {{28, 0}, {62, 0}}, color = {191, 0, 0}));
  connect(v.y, multiProduct.u[4]) annotation(
    Line(points = {{-80, -54}, {-63, -54}, {-63, -40}, {-20, -40}}, color = {0, 0, 127}));
  connect(c_p.y, multiProduct.u[1]) annotation(
    Line(points = {{-80, -24}, {-64, -24}, {-64, -40}, {-20, -40}}, color = {0, 0, 127}));
  connect(nl.y, multiProduct.u[3]) annotation(
    Line(points = {{-80, -44}, {-63, -44}, {-63, -40}, {-20, -40}}, color = {0, 0, 127}));
  connect(dl.y, multiProduct.u[2]) annotation(
    Line(points = {{-80, -34}, {-64, -34}, {-64, -40}, {-20, -40}}, color = {0, 0, 127}));
  connect(multiProduct.y, thermalConductor.G) annotation(
    Line(points = {{2, -40}, {18, -40}, {18, -8}}, color = {0, 0, 127}));
  connect(heatPort, thermalConductor.port_a) annotation(
    Line(points = {{-32, 0}, {8, 0}, {8, 0}, {8, 0}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(rotation = 90, lineColor = {170, 170, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.CrossDiag, extent = {{-20, 80}, {20, -80}}), Text(origin = {-60, 0}, extent = {{-50, -34}, {170, -94}}, textString = "%name")}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Ventilation;
