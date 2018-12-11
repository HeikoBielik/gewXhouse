within gewXhouse.Examples;

model Example
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.House house(floor_c = 4, floor_r_v = 1, floor_w = 1, venti_on_off = true) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue innerTemperature annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment(filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt") annotation(
    Placement(visible = true, transformation(origin = {56, 20}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
equation
  connect(innerTemperature.numberPort, house.t_inside) annotation(
    Line(points = {{38.5, 50}, {30.25, 50}, {30.25, 36}, {22, 36}}, color = {0, 0, 127}));
  connect(house.port_b, environment.floor) annotation(
    Line(points = {{22, 16}, {42, 16}}, color = {191, 0, 0}));
  connect(house.out, environment.air) annotation(
    Line(points = {{22, 24}, {42, 24}}, color = {191, 0, 0}));
  connect(house.pos, sun.posHouse) annotation(
    Line(points = {{-22, 20}, {-38, 20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(house.SunPos, sun.sunPos) annotation(
    Line(points = {{-22, 12}, {-38, 12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sun.I_glob, house.I) annotation(
    Line(points = {{-38, 28}, {-22, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
    Documentation(info = "<html><head></head><body><div><strong><span style=\"font-size: large;\">EXAMPLE <br></span></strong></div>
<div>&nbsp;</div>
<div>The example model gives the user the possiblity to simulate the inner temperature of the greenhouse over 25h. Moreover the can ajust the location, period of time, read in the enviroment data and greenhouse features. The user finds the window to parametrise the greenhouse, if you double click on the house. There are different ribbons with the desired topics to customize the model. The follwing image shows the princip of all available </div>

     <img src=\"modelica://gewXhouse/Resources/princip.jpg\" width=\"450\" height=\"450\">
<p>&nbsp;</p>
<p>Overview of customizable parameters in the example model</p>
<table border=\"1,\" style=\"height: 211px; width: 763px;\">
<tbody>
<tr>
<td style=\"width: 168px; text-align: center;\">parametrization model</td>
<td style=\"width: 110px; text-align: center;\">Subtopic/Ribbon</td>
<td style=\"width: 110px; text-align: center;\">Subtopic</td>
<td style=\"width: 110px; text-align: center;\">Parameters</td>
<td style=\"width: 74.85px; text-align: center;\">unit</td>
<td style=\"width: 144.15px; text-align: center;\">description</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;House</td>
<td style=\"width: 110px; text-align: center;\">General </td>
<td style=\"width: 110px; text-align: center;\">House Dimension&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">length&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;m</td>
<td style=\"width: 144.15px; text-align: center;\">wength of the house&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;width</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;m</td>
<td style=\"width: 144.15px; text-align: center;\">width of the house</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;height</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;m</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;height of the house</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;pitch</td>
<td style=\"width: 74.85px; text-align: center;\">deg&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;roof pitch of the house</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">north&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;deg</td>
<td style=\"width: 144.15px; text-align: center;\">orientation of the house 'north direction'&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">sPitch&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;deg</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">sNorth&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;deg</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">Global&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">Position&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">long&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">deg</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;&nbsp;longitude</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\"><br></td>
<td style=\"width: 110px; text-align: center;\"><br></td>
<td style=\"width: 110px; text-align: center;\">lat&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;deg</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;latitude</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;Cover</td>
<td style=\"width: 110px; text-align: center;\">Cover Dimension</td>
<td style=\"width: 110px; text-align: center;\">cover_rho&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;kg/m³</td>
<td style=\"width: 144.15px; text-align: center;\">density&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\"><br></td>
<td style=\"width: 110px; text-align: center;\"><br></td>
<td style=\"width: 110px; text-align: center;\">&nbsp;cover_c_p</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;J/Kg.K</td>
<td style=\"width: 144.15px; text-align: center;\">specific thermal capacity&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;G</td>
<td style=\"width: 74.85px; text-align: center;\">1&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">solargain&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">Glass&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;cover_w_cover</td>
<td style=\"width: 74.85px; text-align: center;\">m&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">total cover width &nbsp;(glass+gas)&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\"><br></td>
<td style=\"width: 110px; text-align: center;\">&nbsp;cover_w_gas</td>
<td style=\"width: 74.85px; text-align: center;\">m</td>
<td style=\"width: 144.15px; text-align: center;\">gas gap&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">cover_l_glass&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">W/m.K&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;lambda</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">cover_l_gas</td>
<td style=\"width: 74.85px; text-align: center;\">W/m.K&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;lambda</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;Floor</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;Floor Dimension</td>
<td style=\"width: 110px; text-align: center;\">floor_w&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;m</td>
<td style=\"width: 144.15px; text-align: center;\">floor depth&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\"><br></td>
<td style=\"width: 110px; text-align: center;\">&nbsp;floor_c</td>
<td style=\"width: 74.85px; text-align: center;\">W/m².K&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">heat transfer coefficient&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;floor_c1</td>
<td style=\"width: 74.85px; text-align: center;\">W/m.K&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">heat conductivity coefficient&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">floor_rho&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">Kg/m³&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">density&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;floor_c_p</td>
<td style=\"width: 74.85px; text-align: center;\">J/Kg.K&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">specific thermal capacity&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;floor_r_v</td>
<td style=\"width: 74.85px; text-align: center;\">1&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;roughness value</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">Air&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">Air Dimension&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">air_rho&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">Kg/m³&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">density&nbsp;</td>
</tr>

<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;air_c_p</td>
<td style=\"width: 74.85px; text-align: center;\">&nbsp;J/Kg.K</td>
<td style=\"width: 144.15px; text-align: center;\">specific thermal capacity&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;Ventilation</td>
<td style=\"width: 110px; text-align: center;\">Ventilation Dimension&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;venti_nl</td>
<td style=\"width: 74.85px; text-align: center;\">1/s&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">ventilation rate&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;venti_dl</td>
<td style=\"width: 74.85px; text-align: center;\">Kg/m³&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">density&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">venti_c_p&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">J/Kg.K&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;specific thermal capacity</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;venti_on_off</td>
<td style=\"width: 74.85px; text-align: center;\">1&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">Ventilation Switch On/Off&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;Sun</td>
<td style=\"width: 110px; text-align: center;\">General&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;Sun Dimension</td>
<td style=\"width: 110px; text-align: center;\">day&nbsp;</td><td style=\"width: 74.85px; text-align: center;\">1</td><td style=\"width: 144.15px; text-align: center;\">desired&nbsp;day</td></tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;month</td><td style=\"width: 74.85px; text-align: center;\">1</td><td style=\"width: 144.15px; text-align: center;\">desired month</td></tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;cloudy</td><td style=\"width: 74.85px; text-align: center;\">1</td><td style=\"width: 144.15px; text-align: center;\">Cloudy</td></tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;Environment</td>
<td style=\"width: 110px; text-align: center;\">General&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">Environment Dimension&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">filePath&nbsp;</td><td style=\"width: 74.85px; text-align: center;\">1</td><td style=\"width: 144.15px; text-align: center;\">Path of the Environment-data</td></tr>



</tbody>
</table>

Example Model
Das Dargestellte Beispiel-Modell wurde aus den Einzel-Modellen „Sun“, „House“ und „Environment“ zusammengebaut. Beim Simulieren dieses Gesamt-Models interagieren die einzelnen Modelle miteinander. Das Simulationsergebnis dieses Gesamt-Models ist der Innentemperaturverlauf am 26.07.2018 eines sich an der Hochschule Pforzheim befindlichen Gewächshauses. Die Grundfläche dieses Gewächshauses entspricht dabei 9m². 
Eigenschaften wie Standort, Zeitraum, Umgebungstemperatur, Gewächshausmaße etc. können über das jeweilige Parameterfenster der Einzel Modelle verändert werden. Das Parameterfenster eines Modells öffnet sich durch Doppelklick auf das jeweilige Modellsymbol. 
 
Veränderbare Parameter:
Sun-Model:
Im Parameterfenster der Sonne kann der Zeitraum (Tag und Monat) eingestellt werden, diese Werte werden zur Berechnung von Azimut und Elevation der Sonne benötigt. Ein Weiterer Parameter, der hierüber verändert werden kann ist der Bewölkungsgrad. Durch diesen Parameter wird die vom Sun-Modell ausgegebene Direktstrahlung prozentual abgeschwächt.
House-Model:
Innerhalb des Parameterfenster des House-Modells können neben Maße des Gewächshauses, die Standortkoordinaten, Glass Eigenschaften des Gewächshauses als auch die Eigenschaften des Bodens der Luft und der Belüftung eingestellt werden.
Environment-Model:
Im Parameterfenster des Environment-Models ist es möglich einen Pfad zum Importieren eines Temperaturverlaufs der Umgebung anzugeben.
 
Interagieren der Modelle:
Während der Simulation interagiert sowohl das „Sun“-Modell  als auch das „Enviroment“-Modell mit dem „House“-Modell. Der Datenaustausch zwischen diesen Modellen erfolgt durch die von Modelica bereitgestellten connectoren. Die eingesetzten  RealOutput und RealInput Connectoren sind zu finden unter Modelica-&gt;Blocks-&gt;Interfaces.  Hingegen findet man die HeatPort_a und HeatPort_b Connectoren unter Modelica-&gt;Thermal-&gt;HeatTransfer-&gt;Interfaces. In der folgenden Tabelle sind die eingesetzten Connectoren mit Ihren Namen Ihrer Schnittstellen und der zu übergebenden Größe dargestellt.

<p>&nbsp;</p>


</body></html>"));
end Example;
