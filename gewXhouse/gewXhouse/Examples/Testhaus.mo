within gewXhouse.Examples;

model Testhaus
  gewXhouse.Models.Sun sun(month = 7)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Musterhaus house(height = 2, length = 3, north = 0, pitch = 0.523599, width = 3) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(house.posHouse, sun.posHouse) annotation(
    Line(points = {{-10, -4}, {-18, -4}, {-18, -6}, {-18, -6}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sun.sunPos, house.sunPos) annotation(
    Line(points = {{-18, 4}, {-12, 4}, {-12, 4}, {-10, 4}}, color = {0, 0, 127}, thickness = 0.5));
  connect(house.T_inside, realValue.numberPort) annotation(
    Line(points = {{12, 6}, {16, 6}, {16, 20}, {28, 20}, {28, 20}}, color = {0, 0, 127}));
  connect(house.I, sun.I_glob) annotation(
    Line(points = {{-11, 2}, {-19, 2}}, color = {255, 207, 14}));
  connect(house.environment, environment.environment) annotation(
    Line(points = {{11, 0}, {22, 0}}));
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731));
end Testhaus;
