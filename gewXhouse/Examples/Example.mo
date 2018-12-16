within gewXhouse.Examples;

model Example
  gewXhouse.Models.Sun sun annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.House house(floor_c = 15, floor_r_v = 1.5, venti_on_off = false) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue innerTemperature annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.Environment environment(data_air = "temp.txt", data_floor = "temp_floor.txt") annotation(
    Placement(visible = true, transformation(origin = {56, 20}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
equation
  connect(house.out, environment.air) annotation(
    Line(points = {{22, 24}, {42, 24}}, color = {191, 0, 0}));
  connect(house.port_b, environment.floor) annotation(
    Line(points = {{22, 16}, {42, 16}}, color = {191, 0, 0}));
  connect(innerTemperature.numberPort, house.t_inside) annotation(
    Line(points = {{38.5, 50}, {30.25, 50}, {30.25, 36}, {22, 36}}, color = {0, 0, 127}));
  connect(house.SunPos, sun.sunPos) annotation(
    Line(points = {{-22, 12}, {-38, 12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(house.pos, sun.posHouse) annotation(
    Line(points = {{-22, 20}, {-38, 20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sun.I_glob, house.I) annotation(
    Line(points = {{-38, 28}, {-22, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 43.2216),
    Documentation(info = "<html><head></head><body><div>This example model allows the simulation of the indoor temperature of a greenhouse over 24 hours. The location, time period, ambient temperature and properties of the greenhouse can be freely parameterized.&nbsp;</div><div><br></div><div>This example model was assembled with the individual models \"Sun\", \"House\" and \"Environment\" from greenhouse library. During the simluation the models interact with each other and exchange. The data exchange is realized by the connectors, provided by Modelica. Detailed information about the connectors can be found in&nbsp;<i>Modelica/Blocks/Interafces</i>&nbsp;and&nbsp;<i>Modelica/Thermal/Interfaces</i>. The data exchanges between the models is shown in the figure above.</div><div><br></div>
<u>Example model</u> <p></p>

 <div align=\"middle\"><img src=\"modelica://gewXhouse/Resources/principgreenhouse.jpg\" width=\"818.4\" border=\"1\">

<br><br></div><div><div>The simulation result of this example is the indoor temperature curve on 26.07.2018 of a greenhouse located at the Pforzheim University of Applied Sciences. The surface area of this greenhouse corresponds to 9m², start temperature 20°C (project requirements).</div><div><u><br></u></div><div><u>Parameters</u></div><div><span style=\"text-align: start;\"><br></span></div><div><span style=\"text-align: start;\">Properties such as location, time period, ambient temperature, greenhouse dimensions etc. can be changed via the respective parameter window of the individual models.&nbsp;</span>The parameter window of a model is opened by double-clicking on the respective model symbol. The following table shows the paramters over all models.</div><div><br><div><p><b> </b></p><div align=\"middle\"><b>Overview of customizable parameters in the model</b><p></p> </div>

<div align=\"middle\">
<table style=\"height: 211px; width: 818.4px;\" border=\"1,\">
<tbody>
<tr> 
<td style=\"width: 117px; text-align: center;\">parametrization model</td>
<td style=\"width: 137px; text-align: center;\">subtopic/ribbon</td>
<td style=\"width: 132px; text-align: center;\">subtopic</td>
<td style=\"width: 110px; text-align: center;\">parameters</td>
<td style=\"width: 74px; text-align: center;\">unit</td>
<td style=\"width: 199.4px; text-align: center;\">description</td>
</tr>
<tr>
<td style=\"width: 117px; text-align: center;\" rowspan=\"27\">house</td>
<td style=\"width: 137px; text-align: center;\" rowspan=\"7\">general</td>
<td style=\"width: 132px; text-align: center;\" rowspan=\"7\">house dimension</td>
<td style=\"width: 110px; text-align: center;\">length&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;m</td>
<td style=\"width: 199.4px; text-align: center;\">wength of the house&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;width</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;m</td>
<td style=\"width: 199.4px; text-align: center;\">width of the house</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;height</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;m</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;height of the house</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;pitch</td>
<td style=\"width: 74px; text-align: center;\">deg</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;roof pitch of the house</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">north&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;deg</td>
<td style=\"width: 199.4px; text-align: center;\">orientation of the house 'north direction'&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">sPitch&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;deg</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">sNorth&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;deg</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;</td>
</tr>
<tr>
<td style=\"width: 137px; text-align: center;\" rowspan=\"2\">global&nbsp;</td>
<td style=\"width: 132px; text-align: center;\" rowspan=\"2\">position</td>
<td style=\"width: 110px; text-align: center;\">long&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">deg</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;&nbsp;longitude</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">lat&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;deg</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;latitude</td>
</tr>
<tr>
<td style=\"width: 137px; text-align: center;\" rowspan=\"7\">&nbsp;cover</td>
<td style=\"width: 132px; text-align: center;\" rowspan=\"3\">cover Dimension</td>
<td style=\"width: 110px; text-align: center;\">cover_rho&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;kg/m³</td>
<td style=\"width: 199.4px; text-align: center;\">density&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;cover_c_p</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;J/Kg.K</td>
<td style=\"width: 199.4px; text-align: center;\">specific thermal capacity&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;G</td>
<td style=\"width: 74px; text-align: center;\">1&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">solargain&nbsp;</td>
</tr>
<tr>
<td style=\"width: 132px; text-align: center;\" rowspan=\"4\">glass</td>
<td style=\"width: 110px; text-align: center;\">&nbsp;cover_w_cover</td>
<td style=\"width: 74px; text-align: center;\">m&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">total cover width (glass+gas)&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;cover_w_gas</td>
<td style=\"width: 74px; text-align: center;\">m</td>
<td style=\"width: 199.4px; text-align: center;\">gas gap&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">cover_l_glass&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">W/m.K&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;lambda</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">cover_l_gas</td>
<td style=\"width: 74px; text-align: center;\">W/m.K&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;lambda</td>
</tr>
<tr>
<td style=\"width: 137px; text-align: center;\" rowspan=\"6\">&nbsp;floor&nbsp;</td>
<td style=\"width: 132px; text-align: center;\" rowspan=\"6\">floor dimension&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">floor_w&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">&nbsp;m</td>
<td style=\"width: 199.4px; text-align: center;\">floor depth&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;floor_c</td>
<td style=\"width: 74px; text-align: center;\">W/m².K&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">heat transfer coefficient&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;floor_c1</td>
<td style=\"width: 74px; text-align: center;\">W/m.K&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">heat conductivity coefficient&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">floor_rho&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">Kg/m³&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">density&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;floor_c_p</td>
<td style=\"width: 74px; text-align: center;\">J/Kg.K&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">specific thermal capacity&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;floor_r_v</td>
<td style=\"width: 74px; text-align: center;\">1&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">&nbsp;roughness value</td>
</tr>
<tr>
<td style=\"width: 137px; text-align: center;\">air&nbsp;&nbsp;</td>
<td style=\"width: 132px; text-align: center;\">dimension&nbsp;&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">air_rho&nbsp;</td>
<td style=\"width: 74px; text-align: center;\">Kg/m³&nbsp;</td>
<td style=\"width: 199.4px; text-align: center;\">density&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\" rowspan=\"4\">ventilation</td>
<td style=\"width: 110px; text-align: center;\" rowspan=\"4\">ventilation dimension</td>
<td style=\"width: 110px; text-align: center;\">venti_nl </td>
<td style=\"width: 110px; text-align: center;\">&nbsp;1/s&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">ventilation rate&nbsp;</td>

</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;venti_dl</td>
<td style=\"width: 74.85px; text-align: center;\">Kg/m³&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">density&nbsp;</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">venti_c_p&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">J/Kg.K&nbsp;</td>
<td style=\"width: 144.15px; text-align: center;\">&nbsp;specific thermal capacity</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;venti_on_off</td>
<td style=\"width: 74.85px; text-align: center;\">1</td>
<td style=\"width: 144.15px; text-align: center;\">ventilation Switch On/Off&nbsp;</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\" rowspan=\"3\">sun&nbsp;&nbsp;</td>
<td style=\"width: 110px; text-align: center;\" rowspan=\"3\">general&nbsp;&nbsp;&nbsp;</td>
<td style=\"width: 110px; text-align: center;\" rowspan=\"3\">sun dimension&nbsp;&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">day&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">1</td>
<td style=\"width: 144.15px; text-align: center;\">desired&nbsp;day</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;month</td>
<td style=\"width: 74.85px; text-align: center;\">1</td>
<td style=\"width: 144.15px; text-align: center;\">desired month</td>
</tr>
<tr>
<td style=\"width: 110px; text-align: center;\">&nbsp;cloudy</td>
<td style=\"width: 74.85px; text-align: center;\">1</td>
<td style=\"width: 144.15px; text-align: center;\">Cloudy</td>
</tr>
<tr>
<td style=\"width: 168px; text-align: center;\">&nbsp;environment</td>
<td style=\"width: 110px; text-align: center;\">general&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">environment dimension&nbsp;</td>
<td style=\"width: 110px; text-align: center;\">filePath&nbsp;</td>
<td style=\"width: 74.85px; text-align: center;\">1</td>
<td style=\"width: 144.15px; text-align: center;\">path of the Environment-data</td></tr></tbody></table><br></div><div align=\"middle\"><br></div><div align=\"middle\"><br></div><div align=\"middle\"><br></div><div align=\"middle\"><br></div>

</div></div></div></body></html>"));
end Example;
