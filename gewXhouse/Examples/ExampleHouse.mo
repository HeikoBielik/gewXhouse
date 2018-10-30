within gewXhouse.Examples;

model ExampleHouse
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-53, 37}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.Greenhouse greenhouse annotation(
    Placement(visible = true, transformation(origin = {37, -23}, extent = {{-55, -55}, {55, 55}}, rotation = 0)));
equation
  connect(sun.Radiation, greenhouse.Radiation) annotation(
    Line(points = {{-18, 18}, {12, 18}, {12, -5}}, color = {87, 87, 87}));
end ExampleHouse;
