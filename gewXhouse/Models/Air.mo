within gewXhouse.Models;

model Air

  parameter Modelica.Blocks.Sources.RealExpression rho (y= 1.2) "air density" annotation(
    Placement(visible = true, transformation(origin = {-50, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c_p (y= 1e3) "specific thermal capacity" annotation(
    Placement(visible = true, transformation(origin = {-50, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression v (y= 30) "m3 volume house" annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port "Heat port for sensible heat input" annotation(
    Placement(visible = true, transformation(extent = {{-10, -80}, {10, -60}}, rotation = 0), iconTransformation(extent = {{-10, 40}, {10, 60}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor annotation(
    Placement(visible = true, transformation(origin = {0, -7.10543e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(rho.y, heatCapacitor.rho) annotation(
    Line(points = {{-50, -26}, {-32, -26}, {-32, -12}, {-16, -12}, {-16, -12}}, color = {0, 0, 127}));
  connect(heatCapacitor.c_p, c_p.y) annotation(
    Line(points = {{-16, -4}, {-44, -4}, {-44, -4}, {-50, -4}}, color = {0, 0, 127}));
  connect(v.y, heatCapacitor.volume) annotation(
    Line(points = {{-50, 20}, {-38, 20}, {-38, 4}, {-16, 4}}, color = {0, 0, 127}));
  connect(port, heatCapacitor.port) annotation(
    Line(points = {{0, -70}, {0, -70}, {0, -20}, {0, -20}}, color = {191, 0, 0}));
  annotation(
    preferredView="default",
    defaultComponentName = "air",
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = true, initialScale = 0.1), graphics = {Text(extent = {{-110, -54}, {110, -114}}, textString = "%name"), Ellipse(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360)}),
  experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
  Documentation(info = "<html><head></head><body><p><b>AIR MODEL</b></p><p>The air model is a component in the greenhouse, which interact with all components in the greenhouse and influence each other. The user is able to change the medium in the<span style=\"font-size: 12px;\">&nbsp;</span><a href=\"modelica://gewXhouse.Models.House\" style=\"font-size: 12px;\">house</a>&nbsp;model.</p><p>The capacity of the air is calculated in this model with modelica <a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.HeatCapacitor\" style=\"font-size: 12px;\">heat capacity</a> Block, which needs the volume of house, specific thermal capacity and the density of the medium (material specific parameters). The model returns a resulting temperature and heat flux to the other components in the greenhouse via  <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\" style=\"font-size: 12px;\">heat port</a>.</p></body></html>"));
end Air;
