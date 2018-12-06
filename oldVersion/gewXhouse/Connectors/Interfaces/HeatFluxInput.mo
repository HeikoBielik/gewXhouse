within gewXhouse.Connectors.Interfaces;
connector HeatFluxInput // = input Modelica.SIunits.HeatFlux
  extends Modelica.Blocks.Interfaces.RealInput;
 // "'input Heat Flux' as connector"                                                
annotation (
  defaultComponentName="I",
  Icon(graphics={Polygon( lineColor = {255, 207, 14}, fillColor = {255, 207, 14}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}})},
    coordinateSystem(initialScale = 0.2)),
  Diagram(
    coordinateSystem(initialScale = 0.2),
      graphics={Polygon( lineColor = {255, 207, 14}, fillColor = {255, 207, 14}, fillPattern = FillPattern.Solid, points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}), Text(lineColor = {0, 0, 127}, extent = {{-10, 60}, {-10, 85}}, textString = "%name")}),
  Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
end HeatFluxInput;
