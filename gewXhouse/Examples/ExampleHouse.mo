within gewXhouse.Examples;

model ExampleHouse
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-92, 90}, extent = {{-56, -56}, {56, 56}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.Greenhouse greenhouse annotation(
    Placement(visible = true, transformation(origin = {-1, 11}, extent = {{-55, -55}, {55, 55}}, rotation = 0)));
  gewXhouse.Models.Environment environment annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-98, -98}, {98, 98}}, rotation = 0)));
equation
  connect(greenhouse.environment, environment.environment) annotation(
    Line(points = {{44, 4}, {78, 4}, {78, 2}, {78, 2}}));
  connect(sun.Radiation, greenhouse.Radiation) annotation(
    Line(points = {{-37, 59}, {-26, 59}, {-26, 29}}, color = {87, 87, 87}));
  
end ExampleHouse;
