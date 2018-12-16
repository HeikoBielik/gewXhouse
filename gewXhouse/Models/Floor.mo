within gewXhouse.Models;

model Floor
  parameter Modelica.Blocks.Sources.RealExpression w(y = 1) "m floor width (1)" annotation(
    Placement(visible = true, transformation(origin = {-88, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression s(y = 9) "m2 surface ground floor (9)" annotation(
    Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c(y = 18.285) "W/m2.K heat transfer coefficient" annotation(
    Placement(visible = true, transformation(origin = {-16, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression rho(y = 1014.42) "kg/m3 density (Humus: 1014.42" annotation(
    Placement(visible = true, transformation(origin = {-22, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c_p(y = 1000) "J/Kg.K specific thermal capacity (1000)" annotation(
    Placement(visible = true, transformation(origin = {-22, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression u(y = 12) "m circumference" annotation(
    Placement(visible = true, transformation(origin = {-50, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression c1(y = 1.26) "W/m.K heat conductivity coefficient (Humus: 1.26)" annotation(
    Placement(visible = true, transformation(origin = {-16, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Blocks.Sources.RealExpression r_v(y = 4) "1 roughness value" annotation(
    Placement(visible = true, transformation(origin = {-50, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));  
  
  Modelica.Blocks.Interfaces.RealInput I(start = 1000) "heat flux" annotation(
    Placement(visible = true, transformation(origin = {-24, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  gewXhouse.Models.Radiation radiation annotation(
    Placement(visible = true, transformation(origin = {4, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  gewXhouse.Models.HeatCapacitor heatCapacitor annotation(
    Placement(visible = true, transformation(origin = {44, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor annotation(
    Placement(visible = true, transformation(origin = {62, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-2, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Heat port for sensible heat input" annotation(
    Placement(visible = true, transformation(extent = {{80, -20}, {100, 0}}, rotation = 0), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a environment annotation(
    Placement(visible = true, transformation(extent = {{80, -80}, {100, -60}}, rotation = 0), iconTransformation(extent = {{-50, -40}, {-30, -20}}, rotation = 0)));
  gewXhouse.Models.ThermalConductor thermalConductor1 annotation(
    Placement(visible = true, transformation(origin = {62, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {28, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(
    Placement(visible = true, transformation(origin = {-16, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product4 annotation(
    Placement(visible = true, transformation(origin = {-16, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(radiation.port, heatCapacitor.port) annotation(
    Line(points = {{14, -6}, {44, -6}, {44, 20}}, color = {191, 0, 0}));
  connect(thermalConductor.port_a, heatCapacitor.port) annotation(
    Line(points = {{52, -10}, {44, -10}, {44, 20}, {44, 20}}, color = {191, 0, 0}));
  connect(radiation.S, s.y) annotation(
    Line(points = {{1, 0}, {-35.8, 0}, {-35.8, 50}, {-56, 50}}, color = {0, 0, 127}));
  connect(I, radiation.I) annotation(
    Line(points = {{-24, -10}, {-12.5, -10}, {-12.5, -6}, {1, -6}}, color = {255, 207, 14}));
  connect(thermalConductor1.port_a, heatCapacitor.port) annotation(
    Line(points = {{52, -70}, {44, -70}, {44, 20}, {44, 20}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatPort) annotation(
    Line(points = {{72, -10}, {88, -10}, {88, -10}, {90, -10}}, color = {191, 0, 0}));
  connect(product4.y, product1.u2) annotation(
    Line(points = {{-4, -46}, {16, -46}, {16, -46}, {16, -46}}, color = {0, 0, 127}));
  connect(r_v.y, product4.u2) annotation(
    Line(points = {{-38, -52}, {-28, -52}, {-28, -52}, {-28, -52}}, color = {0, 0, 127}));
  connect(u.y, product3.u1) annotation(
    Line(points = {{-38, -84}, {-28, -84}, {-28, -84}, {-28, -84}}, color = {0, 0, 127}));
  connect(product4.u1, s.y) annotation(
    Line(points = {{-28, -40}, {-36, -40}, {-36, 50}, {-44, 50}, {-44, 50}}, color = {0, 0, 127}));
  connect(c.y, product1.u1) annotation(
    Line(points = {{-5, -24}, {5.5, -24}, {5.5, -34}, {16, -34}}, color = {0, 0, 127}));
  connect(c1.y, product2.u1) annotation(
    Line(points = {{-5, -68}, {4, -68}, {4, -78}, {16, -78}}, color = {0, 0, 127}));
  connect(product1.y, thermalConductor.G) annotation(
    Line(points = {{39, -40}, {62, -40}, {62, -18}}, color = {0, 0, 127}));
  connect(product3.u2, w.y) annotation(
    Line(points = {{-28, -96}, {-70, -96}, {-70, 62}, {-78, 62}, {-78, 62}, {-76, 62}}, color = {0, 0, 127}));
  connect(product3.y, product2.u2) annotation(
    Line(points = {{-4, -90}, {16, -90}, {16, -90}, {16, -90}}, color = {0, 0, 127}));
  connect(product2.y, thermalConductor1.G) annotation(
    Line(points = {{39, -84}, {62, -84}, {62, -78}}, color = {0, 0, 127}));
  connect(environment, thermalConductor1.port_b) annotation(
    Line(points = {{90, -70}, {72, -70}}, color = {191, 0, 0}));
  connect(w.y, product.u1) annotation(
    Line(points = {{-76, 62}, {-14, 62}, {-14, 62}, {-14, 62}}, color = {0, 0, 127}));
  connect(product.u2, s.y) annotation(
    Line(points = {{-14, 50}, {-56, 50}}, color = {0, 0, 127}));
  connect(heatCapacitor.volume, product.y) annotation(
    Line(points = {{28, 44}, {20, 44}, {20, 56}, {9, 56}}, color = {0, 0, 127}));
  connect(rho.y, heatCapacitor.rho) annotation(
    Line(points = {{-22, 22}, {8, 22}, {8, 28}, {28, 28}}, color = {0, 0, 127}));
  connect(c_p.y, heatCapacitor.c_p) annotation(
    Line(points = {{-22, 36}, {28, 36}}, color = {0, 0, 127}));
  annotation(
    defaultComponentName = "floor",
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = true, initialScale = 0.1), graphics = {Rectangle(rotation = 90, fillColor = {170, 85, 0}, fillPattern = FillPattern.Backward, extent = {{-20, 80}, {20, -80}}), Text(extent = {{-100, -34}, {120, -94}}, textString = "%name")}),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 86.5731),
    Documentation(info = "<html><head></head><body><p><b>FLOOR MODEL</b></p><p><!--StartFragment--><span style=\"font-size: 12px;\">The floor model is the main heat capacitor of the greenhouse. It absorbs the main part of the incoming energy and releases it to the greenhouse inner volume over its surface.</span><br style=\"font-size: 12px;\"><span style=\"font-size: 12px;\">User input parameters are adjusted in the&nbsp;</span><a href=\"modelica:///gewXhouse.Models.House\" style=\"font-size: 12px;\">house</a><span style=\"font-size: 12px;\">&nbsp;model which are floor material and its specifications</span><!--EndFragment--></p><p>In the floor are interacting following modelica standard components, which has been adapted to the greenhouse:</p><p></p><ul><li><a href=\"modelica://gewXhouse.Models.HeatCapacitor\">heat capacitor</a></li><li><a href=\"modelica://gewXhouse.Models.Radiation\">radiation</a></li><li><a href=\"modelica://gewXhouse.Models.ThermalConductor\" style=\"font-size: 12px;\">thermal conductor</a></li><li><a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\" style=\"font-size: 12px;\">heat port</a></li></ul><div>The heatCapacitor represents the heat capacity of the floor. This capacity is connected to the thermal conducters and the radiation via the <a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a\" style=\"font-size: 12px;\">heat port</a>.&nbsp;</div><div><br></div><div>The thermal conductors has three inputs: two temperatures inputs to calcute a difference and constant thermal conductance of a material. The conductors returns a heat flux (Q_Flow) and is connected to the capacity. In the floor model are two conductors:</div><div>1. exchange between air and house floor&nbsp;</div><div>2. exchange between house floor and enviroment floor</div><div><br></div><div>Through the connector the solar radiation I heats directly up the capacity of the floor.&nbsp;</div><div><br></div><div>The total floor capacity will be calculated in heatCapacitor model, depending on the specific thermal capacity, density, and area and the width of the floor.</div></body></html>"));
end Floor;
