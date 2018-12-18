within gewXhouse;

package UserGuide
  extends Modelica.Icons.Info;

annotation(
    DocumentationClass = true,
    Documentation(info = "<html><head></head><body><div>In this gewXhouse library are implemented different models to simulate a greenhouse. Feel free to click on the link in the table to receive more infomation about the desired model.</div><div><br>Moreover, the library contains an example to see the possitbilities of the house model and shows the the conncetions between the models and how the interact with each other. For more information you can open directly the<a href=\"modelica://gewXhouse.UserGuide.Examples.Example\">&nbsp;example greenhouse</a>. The documentaition of the example provides the user an overview about the variables of a greenhouse.<div>&nbsp;&nbsp;</div>
<div>&nbsp;</div><div><strong>Overview models</strong><br><br>
<table style=\"height: 630px; width: 619.15px;\" border=\"1\">
<tbody>
<tr>
<td style=\"width: 78px; text-align: center;\"><strong>Model</strong></td>
<td style=\"width: 298px; text-align: center;\"><strong>Description</strong></td>
<td style=\"text-align: center; width: 214.15px;\">&nbsp;<strong>Link</strong></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Sun<br> <img src=\"modelica://gewXhouse/Resources/sunmodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">The sun represents a simple sun in library and calculates the azimuth, elevation and the solar radiation</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Sun\">sun</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">House <br> <img src=\"modelica://gewXhouse/Resources/housemodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">Physical representation of the house model</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.House\">house</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Floor<br> <img src=\"modelica://gewXhouse/Resources/floormodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">The floor simulates the inner soil capacity of the greenhouse</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Floor\">floor</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Cover<br> <img src=\"modelica://gewXhouse/Resources/covermodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">The cover degreases the solar direction radiation and influences the exchange between inner and outer temperature</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Cover\">cover</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Air<br> <img src=\"modelica://gewXhouse/Resources/airmodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">The air simluates the air capacity</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Air\">air</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">HeatCapacitor <br> <img src=\"modelica://gewXhouse/Resources/heatcapacitormodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">Represents the heat capacity of the single models</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.HeatCapacitor\">heat capacitor</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">ThermalConductor <br><img src=\"modelica://gewXhouse/Resources/thermalconductormodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">Represents the thermal capacity of the single models</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.ThermalConductor\">thermal concuctor</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Radiation<br> <img src=\"modelica://gewXhouse/Resources/radiationmodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">Represents the radiation of the single models</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Radiation\">radiation</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Ventilation<br> <img src=\"modelica://gewXhouse/Resources/ventilationmodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">The ventilation simulates a simple ventilation for regulating the exchange between the inner and outer temperature</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Ventilation\">ventilation</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Environment <br><img src=\"modelica://gewXhouse/Resources/environmentmodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">The environment model gives the user the possibility to read in real weather data from institutions e.g. Deutscher Wetter Dienst (DWD)</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Environment\">environment</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Glass <br><img src=\"modelica://gewXhouse/Resources/glassmodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">Representation of a multi layer glass model</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Glass\">glass</a></td>
</tr>
<tr>
<td style=\"width: 78px; text-align: center;\">Iglu <br><img src=\"modelica://gewXhouse/Resources/iglumodel.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\"></td>
<td style=\"width: 298px;\">Alternativ physical house representation model</td>
<td style=\"width: 214.15px; text-align: center;\"><a href=\"modelica://gewXhouse.Models.Iglu\">iglu</a></td>
</tr>
</tbody>
</table>
</div>
<div>
<p>&nbsp;</p>
</div>
</div></body></html>"));
end UserGuide;
