within gewXhouse.UsersGuide;

class Requirements "Requirements"
  extends Modelica.Icons.Information;
  annotation(
preferredView="info",
    Documentation(info = "<html><head></head><body><ul><li>Temperature course in the greenhouse over 24 h on 26.07.2018</li><li>Location is Pforzheim University</li><li>Base area are 3x3m</li><li>Freestanding: no shadow</li><li>Sun</li><ul><li>Calculation of azimuth and height</li><li>Parameters are date of year (day + month), longitude and latitude for the University</li><li>Outputs are direct radiation (W/m²) over time</li></ul><li>Greenhouse</li><ul><li>Parameters are relevant geometric parameters and alignment (N, S, O, W)<div></div></li></ul><ul><li>Start temperature inside is 20 °C</li></ul><li>Environment (outdoor temperature should be able to be set over 24 h)</li><li>Optional (enthusiasm features)</li><ul><li>Cloudiness level</li><li>Ventilation of the greenhouse</li></ul></ul></body></html>"));
end Requirements;
