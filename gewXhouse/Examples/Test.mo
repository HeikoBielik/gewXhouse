within gewXhouse.Examples;

model Test
  gewXhouse.Models.Cover cover1(totalSurface = 15)  annotation(
    Placement(visible = true, transformation(origin = {3.33067e-15, 8.88178e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Environment environment1(filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt")  annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Air air1 annotation(
    Placement(visible = true, transformation(origin = {-36, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 10) annotation(
    Placement(visible = true, transformation(origin = {-68, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Floor floor1(I_Intern = 10000, rho = 0.1, w = 10)  annotation(
    Placement(visible = true, transformation(origin = {-60, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(floor1.heatPort, air1.heatPort) annotation(
    Line(points = {{-60, 0}, {-26, 0}, {-26, 24}, {-30, 24}, {-30, 24}}, color = {191, 0, 0}));
  connect(realExpression1.y, air1.volumeHouse) annotation(
    Line(points = {{-56, 28}, {-42, 28}, {-42, 28}, {-42, 28}}, color = {0, 0, 127}));
  connect(air1.heatPort, cover1.heatPort) annotation(
    Line(points = {{-30, 24}, {0, 24}, {0, 2}, {0, 2}}, color = {191, 0, 0}));
  connect(temperatureSensor1.port, cover1.heatPort) annotation(
    Line(points = {{20, 30}, {0, 30}, {0, 2}, {0, 2}}, color = {191, 0, 0}));
  connect(cover1.environment, environment1.port_a) annotation(
    Line(points = {{14, 0}, {48, 0}, {48, 0}, {46, 0}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Test;
