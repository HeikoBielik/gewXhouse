within gewXhouse.Examples;

model Example
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.House house annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1 annotation(
    Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment(filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt")  annotation(
    Placement(visible = true, transformation(origin = {56, 20}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
equation
  connect(house.out, environment.air) annotation(
    Line(points = {{22, 24}, {42, 24}}, color = {191, 0, 0}));
  connect(realValue1.numberPort, house.t_inside) annotation(
    Line(points = {{38.5, 36}, {22, 36}}, color = {0, 0, 127}));
  connect(house.pos, sun.posHouse) annotation(
    Line(points = {{-22, 20}, {-38, 20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(house.SunPos, sun.sunPos) annotation(
    Line(points = {{-22, 12}, {-38, 12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sun.I_glob, house.I) annotation(
    Line(points = {{-38, 28}, {-22, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Example;
