within gewXhouse.Tests;

model Test1
  gewXhouse.Models.Environment environment1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-100, -100}, {100, 100}}, rotation = 0)));
  gewXhouse.Models.Greenhouse.Greenhouse greenhouse1 annotation(
    Placement(visible = true, transformation(origin = {14, 20}, extent = {{-60, -60}, {60, 60}}, rotation = 0)));
equation
  connect(environment1.Wall, greenhouse1.Wall) annotation(
    Line(points = {{-60, 0}, {-34, 0}, {-34, -2}}, color = {87, 87, 87}));
  annotation(
      Icon(graphics = {Ellipse(origin = {-28, -36}, lineThickness = 3, extent = {{-32, -44}, {88, 76}}, endAngle = 360), Line(origin = {19.26, 20.59}, points = {{-80.0137, -0.0233647}, {-40.0137, -60.0234}, {79.9863, 59.9766}}, color = {0, 85, 0}, thickness = 10)}, coordinateSystem(initialScale = 0.1)));
  
end Test1;
