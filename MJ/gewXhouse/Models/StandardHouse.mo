within gewXhouse.Models;

model StandardHouse "Definition of the house dimensions and orientation"
  parameter Modelica.SIunits.Length length = 3 "Length of the house";
  parameter Modelica.SIunits.Length width = 3 "Width of the house";
  parameter Modelica.SIunits.Length height = 2 "Height of the house";
  parameter Modelica.SIunits.Angle pitch = 0.523599 "Roof pitch of the house";
  parameter Modelica.SIunits.Angle north = 0 "Orientation of the house 'north direction'";
  parameter Integer N = 6 "number of surfaces";
  Modelica.SIunits.Area sD "Dormer house";
  Models.Greenhouse.Surface floor "Ground floor";
  Models.Greenhouse.Surface sN(a=90,o=0) "North house";
  Models.Greenhouse.Surface sE(a=90,o=90) "East house";
  Models.Greenhouse.Surface sS(a=90,o=180) "South house";
  Models.Greenhouse.Surface sW(a=90,o=270) "West house";
  Models.Greenhouse.Surface rE(a=pitch,o=90) "East roof house";
  Models.Greenhouse.Surface rW(a=pitch,o=270) "West roof house";
 
  
  gewXhouse.Connectors.Interfaces.House house annotation(
    Placement(visible = true, transformation(origin = {108, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
    
  floor.A = length * width;
  sD = length * length * tan(pitch) / 4;
  sN.A = length * height + sD;
  sE.A = width * height;
  sS.A = sN.A;
  sW.A = sE.A;
  rE.A = length / 2 / cos(pitch) * width;
  rW.A = rW.A;
  
  house.floor = floor;
  
  house.surfaces[1] = sN;
  house.surfaces[2] = sE; 
  house.surfaces[3] = sS; 
  house.surfaces[4] = sW; 
  house.surfaces[5] = rE; 
  house.surfaces[6] = rW;
  
  house.total = (sN.A + sE.A + rE.A)*2;
  house.volume = sN.A * width;
  house.N = N;

  
  annotation(
    Icon(graphics = {Text(origin = {-33, -63}, extent = {{1, -15}, {-1, 15}}, textString = "L", fontSize = 15), Text(origin = {47, -49}, extent = {{1, -15}, {-1, 15}}, textString = "W", fontSize = 15), Text(origin = {69, -11}, extent = {{1, -15}, {-1, 15}}, textString = "H", fontSize = 15), Line(points = {{20, 0}, {-80, 0}}, color = {135, 135, 135}, pattern = LinePattern.Dash), Ellipse(origin = {20, 0}, lineColor = {135, 135, 135}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, startAngle = 180, endAngle = 135), Line(points = {{-80, -80}, {20, -80}, {80, -50}, {80, 30}}, color = {255, 0, 0}, thickness = 0.5), Line(points = {{-80, -80}, {-80, 0}, {-30, 50}, {30, 80}, {80, 30}, {20, 0}}, color = {135, 135, 135}), Line(points = {{-30, 50}, {20, 0}, {20, -80}}, color = {135, 135, 135}), Text(origin = {-31, 21}, extent = {{1, -15}, {-1, 15}}, textString = "P", fontSize = 15), Line(origin = {-0.33, 0},points = {{0, 80}, {-60, 50}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Text(origin = {-69, 65}, extent = {{1, -15}, {-1, 15}}, textString = "N", fontSize = 15), Ellipse(origin = {0, 80}, lineColor = {135, 135, 135}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}, startAngle = 180, endAngle = 206), Line(origin = {0, -0.33},points = {{0, 80}, {-80, 80}}, color = {255, 0, 0}, thickness = 0.5)}, coordinateSystem(initialScale = 0.1)));
end StandardHouse;
