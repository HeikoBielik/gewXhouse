within gewXhouse.Examples;

model Test
  gewXhouse.Models.Floor floor1 annotation(
    Placement(visible = true, transformation(origin = {3.10862e-15, 8.88178e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 100)  annotation(
    Placement(visible = true, transformation(origin = {-30, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = 30)  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1 annotation(
    Placement(visible = true, transformation(origin = {62, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(heatCapacitor1.port, floor1.heatPort) annotation(
    Line(points = {{62, 26}, {62, 26}, {62, 12}, {0, 12}, {0, 0}, {0, 0}}, color = {191, 0, 0}));
  connect(realExpression2.y, floor1.surface) annotation(
    Line(points = {{-18, -30}, {-8, -30}, {-8, -6}, {-8, -6}}, color = {0, 0, 127}));
  connect(realExpression1.y, floor1.I_Intern) annotation(
    Line(points = {{-18, 24}, {-8, 24}, {-8, 6}, {-8, 6}}, color = {0, 0, 127}));
  print(OpenModelica.Scripting.getModelicaPath());
end Test;
