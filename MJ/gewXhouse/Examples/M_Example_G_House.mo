within gewXhouse.Examples;

model M_Example_G_House
  gewXhouse.Models.Sun sol annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.M_greenhouse greenhouse annotation(
    Placement(visible = true, transformation(origin = {8.88178e-16, 8.88178e-16}, extent = {{-60, -60}, {60, 60}}, rotation = 0)));
  gewXhouse.Models.Environment outside annotation(
    Placement(visible = true, transformation(origin = {115, -5}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
equation
  connect(sol.Radiation, greenhouse.Radiation) annotation(
    Line(points = {{-40, 54}, {-48, 54}, {-48, -8}, {-48, -8}}, color = {87, 87, 87}));
  connect(outside.environment, greenhouse.environment) annotation(
    Line(points = {{144, -4}, {24, -4}, {24, -20}, {24, -20}}));

annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.4865));end M_Example_G_House;
