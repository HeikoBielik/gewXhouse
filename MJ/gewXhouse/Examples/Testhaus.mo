within gewXhouse.Examples;

model Testhaus
  gewXhouse.Models.Sun sun(month = 7)  annotation(
    Placement(visible = true, transformation(origin = {-64, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Solar_model solar_model annotation(
    Placement(visible = true, transformation(origin = {-30, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.StandardHouse house(height = 2, length = 3, north = 0, pitch = 0.523599, width = 3) annotation(
    Placement(visible = true, transformation(origin = {-62, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Earth earth annotation(
    Placement(visible = true, transformation(origin = {-90, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment annotation(
    Placement(visible = true, transformation(origin = {62, 82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  gewXhouse.Models.Floor floor annotation(
    Placement(visible = true, transformation(origin = {-6, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Air air annotation(
    Placement(visible = true, transformation(origin = {18, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.Cover cover annotation(
    Placement(visible = true, transformation(origin = {32, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {42, 46}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
equation
  connect(cover.environment, environment.environment) annotation(
    Line(points = {{40, 82}, {54, 82}}));
  connect(temperatureSensor.port, air.heatPort) annotation(
    Line(points = {{38, 46}, {18, 46}, {18, 40}, {18, 40}, {18, 40}}, color = {191, 0, 0}));
  connect(cover.heatPort, air.heatPort) annotation(
    Line(points = {{32, 82}, {32, 82}, {32, 46}, {18, 46}, {18, 40}, {18, 40}}, color = {191, 0, 0}));
  connect(floor.heatPort, air.heatPort) annotation(
    Line(points = {{-6, 22}, {-6, 22}, {-6, 46}, {18, 46}, {18, 40}, {18, 40}}, color = {191, 0, 0}));
  connect(solar_model.I_Intern, floor.I_Intern) annotation(
    Line(points = {{-18, 48}, {-10, 48}, {-10, 26}, {-10, 26}}, color = {255, 207, 14}));
  connect(house.house, cover.house) annotation(
    Line(points = {{-50, 10}, {26, 10}, {26, 82}, {26, 82}}));
  connect(house.house, air.house) annotation(
    Line(points = {{-50, 10}, {12, 10}, {12, 34}, {14, 34}}));
  connect(house.house, floor.house) annotation(
    Line(points = {{-50, 10}, {-14, 10}, {-14, 22}, {-12, 22}}));
  connect(solar_model.house, house.house) annotation(
    Line(points = {{-40, 44}, {-50, 44}, {-50, 10}, {-50, 10}}));
  connect(sun.I_glob, solar_model.I_glob) annotation(
    Line(points = {{-52, 54}, {-42, 54}, {-42, 54}, {-40, 54}}, color = {255, 207, 14}));
  connect(sun.sunPos, solar_model.sunPos) annotation(
    Line(points = {{-52, 52}, {-42, 52}, {-42, 52}, {-40, 52}}, color = {0, 0, 255}));
  connect(sun.pos, earth.pos) annotation(
    Line(points = {{-74, 54}, {-84, 54}, {-84, 54}, {-84, 54}}, color = {0, 0, 255}));
  annotation(
    Diagram(graphics = {Polygon(origin = {10, 60}, lineColor = {135, 135, 135}, lineThickness = 1, points = {{-40, -40}, {40, -40}, {40, 10}, {0, 40}, {-40, 10}, {-40, -40}})}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 173.146));
end Testhaus;
