within gewXhouse.Examples;

model Testhaus
  gewXhouse.Models.Sun sun(month = 7)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Musterhaus house(height = 2, length = 3, north = 0, pitch = 0.523599, width = 3) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment(filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt")  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(visible = true, transformation(origin = {46, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(house.T_inside, realValue.numberPort) annotation(
    Line(points = {{12, 6}, {16, 6}, {16, 36}, {34.5, 36}}, color = {0, 0, 127}));
  connect(sun.posHouse, house.posHouse) annotation(
    Line(points = {{-19, -4}, {-10, -4}}, color = {0, 0, 127}, thickness = 0.5));
  connect(house.I, sun.I_glob) annotation(
    Line(points = {{-10, 0}, {-19, 0}}, color = {255, 207, 14}));
  connect(sun.sunPos, house.sunPos) annotation(
    Line(points = {{-19, 4}, {-10, 4}}, color = {0, 0, 127}, thickness = 0.5));
  connect(house.environment, environment.port_a) annotation(
    Line(points = {{12, 0}, {22, 0}, {22, 0}, {24, 0}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Testhaus;
