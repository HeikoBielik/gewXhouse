within gewXhouse.Examples;

model Example
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.House house annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1 annotation(
    Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment(filePath = "C:/Users/m.jilg.LOCCIONI/Documents/GitHub/gewXhouse/gewXhouse/Resources/temp.txt")  annotation(
    Placement(visible = true, transformation(origin = {56, 20}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
equation
  connect(house.out, environment.air) annotation(
    Line(points = {{22, 24}, {42, 24}}, color = {191, 0, 0}));
  connect(realValue1.numberPort, house.t_inside) annotation(
    Line(points = {{38.5, 36}, {22, 36}}, color = {0, 0, 127}));
  connect(house.pos, sun.posHouse) annotation(
    Line(points = {{-22, 20}, {-38, 20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(house.SunPos, sun.sunPos) annotation(
    Line(points = {{-22, 12}, {-38, 12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sun.I_glob, house.I) annotation(
    Line(points = {{-38, 28}, {-22, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
    Documentation(info = "<html> <body><div><strong><span style=\"font-size: large;\">EXAMPLE <br /></span></strong></div>
<div>&nbsp;</div>
<div>The example model gives the user the possiblity to simulate the inner temperature of the greenhouse over 25h. Moreover the can ajust the location, period of time, read in the enviroment data and greenhouse features. The user finds the window to parametrise the greenhouse, if you double click on the house. There are different ribbons with the desired topics to customize the model. The follwing image shows the princip of all available </div>

     <img src=\"modelica://gewXhouse/Resources/princip.jpg\" width=\"450\" height=\"450\">
<p>&nbsp;</p>
<p>Overview of customizable parameters in the example model</p>
<table style=\"height: 200px; width: 574px; border-color: black; margin-left: auto; margin-right: auto;\" border=\"1\">
<tbody>
<tr style=\"height: 39px;\">
<td style=\"width: 79px; text-align: center; height: 39px;\">&nbsp;</td>
<td style=\"width: 199.35px; height: 39px; text-align: center;\"><strong>Variable</strong></td>
<td style=\"width: 272.65px; height: 39px; text-align: center;\"><strong>Description</strong></td>
</tr>
<tr style=\"height: 69px;\">
<td style=\"width: 79px; text-align: center; height: 69px;\"><img src=\"modelica://gewXhouse/Resources/Input.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\" /> <strong>Input</strong></td>
<td style=\"width: 199.35px; height: 69px; text-align: center;\">posHouse[2]</td>
<td style=\"width: 272.65px; height: 69px; text-align: center;\">Position of the house with longitudinal and lateral coordinates</td>
</tr>
<tr style=\"height: 33.7167px;\">
<td style=\"width: 79px; text-align: center; height: 78.7167px;\" rowspan=\"2\"><img src=\"modelica://gewXhouse/Resources/Output.jpg\" alt=\"Smiley face\" width=\"42\" height=\"42\" /><strong>Output</strong></td>
<td style=\"width: 199.35px; height: 33.7167px;\">
<p style=\"text-align: center;\">I_glob</p>
</td>
<td style=\"width: 272.65px; height: 33.7167px; text-align: center;\">Direct solar radiation of the sun [w/m&sup2;]</td>
</tr>
<tr style=\"height: 45px;\">
<td style=\"width: 199.35px; height: 45px;\">
<p style=\"text-align: center;\">sunPos [2]</p>
</td>
<td style=\"width: 272.65px; height: 45px; text-align: center;\">sunPos[1] = elevation of the sun&nbsp;<br />sunPos[2] = azumiuth of the sun&nbsp;</td>
</tr>
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
Während der Simulation interagiert sowohl das „Sun“-Modell  als auch das „Enviroment“-Modell mit dem „House“-Modell. Der Datenaustausch zwischen diesen Modellen erfolgt durch die von Modelica bereitgestellten connectoren. Die eingesetzten  RealOutput und RealInput Connectoren sind zu finden unter Modelica->Blocks->Interfaces.  Hingegen findet man die HeatPort_a und HeatPort_b Connectoren unter Modelica->Thermal->HeatTransfer->Interfaces. In der folgenden Tabelle sind die eingesetzten Connectoren mit Ihren Namen Ihrer Schnittstellen und der zu übergebenden Größe dargestellt.

<p>&nbsp;</p>


</body></html>"));
end Example;
