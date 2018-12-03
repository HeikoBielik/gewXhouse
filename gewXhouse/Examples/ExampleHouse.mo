within gewXhouse.Examples;

model ExampleHouse
  gewXhouse.Models.Musterhaus house annotation(
    Placement(visible = true, transformation(origin = {-8, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-42, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment annotation(
    Placement(visible = true, transformation(origin = {18, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(house.posHouse, sun.posHouse) annotation(
    Line(points = {{-20, -2}, {-31, -2}}, color = {0, 0, 127}, thickness = 0.5));
  connect(house.I, sun.I_glob) annotation(
    Line(points = {{-20, 2}, {-31, 2}}, color = {255, 207, 14}));
  connect(sun.sunPos, house.sunPos) annotation(
    Line(points = {{-31, 6}, {-20, 6}}, color = {0, 0, 127}, thickness = 0.5));
  connect(environment.floor, house.environment_floor) annotation(
    Line(points = {{10, -2}, {6, -2}, {6, -4}, {4, -4}, {4, -4}}, color = {191, 0, 0}));
  connect(house.environment_air, environment.air) annotation(
    Line(points = {{4, 2}, {10, 2}, {10, 2}, {10, 2}}, color = {191, 0, 0}));

end ExampleHouse;
