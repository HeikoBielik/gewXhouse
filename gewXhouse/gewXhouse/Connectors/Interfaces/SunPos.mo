within gewXhouse.Connectors.Interfaces;

class SunPos
    Modelica.SIunits.Angle elevation "elevation";
    Modelica.SIunits.Angle azimuth "azimuth";
    Real lat "latitude" ;
    Real long "longitude";
    annotation(
    Icon(graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {0, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
end SunPos;
