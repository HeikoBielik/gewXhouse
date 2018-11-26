within gewXhouse.Connectors.Interfaces;

  connector Position
    Real lat = 48.8785888 "latitude";
    Real long = 8.7172797 "longitude";
    annotation(
      Icon(graphics = {
      Rectangle(lineColor = {0, 0, 255}, fillColor = {0, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}),
      Ellipse(lineColor = {0, 85, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360) 
      }, 
      coordinateSystem(initialScale = 0.1)));
  end Position;
