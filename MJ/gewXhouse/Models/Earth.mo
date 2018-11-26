within gewXhouse.Models;
  

model Earth


  parameter Real lat   = 48.8785888 "latitude";
  parameter Real long  = 8.7172797 "longitude";

  gewXhouse.Connectors.Interfaces.Position pos annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(
    Icon(graphics = {Ellipse(lineColor = {0, 0, 255}, fillColor = {0, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, endAngle = 360), Polygon(origin = {3, 0}, lineColor = {0, 85, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, points = {{-29, -4}, {-27, -12}, {-15, -18}, {-11, -34}, {3, -36}, {3, -12}, {15, 0}, {25, -6}, {35, 4}, {31, 18}, {19, 32}, {9, 36}, {3, 20}, {-7, 26}, {-13, 20}, {-11, 10}, {-17, 10}, {-23, 20}, {-25, 10}, {-35, 4}, {-33, 0}, {-15, 2}, {-11, -2}, {-7, 4}, {3, 4}, {-1, -6}, {-23, -2}, {-29, -4}})}));
end Earth;
