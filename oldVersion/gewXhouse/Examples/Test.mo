within gewXhouse.Examples;

model Test
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Air air1 annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  gewXhouse.Models.Floor floor1(c_p = 10, w = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Cover cover1 annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.Environment environment1(filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt")  annotation(
    Placement(visible = true, transformation(origin = {80, -20}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
equation
  connect(environment1.port_a, cover1.environment) annotation(
    Line(points = {{66, -20}, {34, -20}, {34, -20}, {34, -20}}, color = {191, 0, 0}));
  connect(cover1.heatPort, air1.heatPort) annotation(
    Line(points = {{20, -18}, {20, 0}, {-6, 0}, {-6, 20}, {-30, 20}}, color = {191, 0, 0}));
  connect(temperatureSensor1.port, air1.heatPort) annotation(
    Line(points = {{20, 20}, {-28, 20}, {-28, 20}, {-30, 20}}, color = {191, 0, 0}));
  connect(floor1.heatPort, air1.heatPort) annotation(
    Line(points = {{-40, -20}, {-40, -20}, {-40, 0}, {-6, 0}, {-6, 20}, {-30, 20}, {-30, 20}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Test;
