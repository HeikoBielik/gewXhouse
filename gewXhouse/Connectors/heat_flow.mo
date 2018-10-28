within gewXhouse.Connectors;

connector heat_flow

  parameter Modelica.SIunits.ThermalConductivity w = 0.76 "thermal_conductivity";
  parameter Real d = 0.05 "diameter";
  
annotation(
        Icon(graphics = {Line(origin = {0.66, -0.33}, points = {{0, 20}, {0, -20}}, color = {87, 87, 87}, thickness = 1), Line(origin = {-0.09, -1.63}, points = {{-19.5815, 0.96567}, {-9.5815, 4.96567}, {-1.58146, -1.03433}, {4.4185, 4.96567}, {10.4185, 0.96567}, {20.4185, 0.96567}}, color = {255, 85, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5, smooth = Smooth.Bezier), Line(origin = {-0.33, 10.49}, points = {{-19.5815, 0.96567}, {-9.5815, 4.96567}, {-1.58146, -1.03433}, {4.4185, 4.96567}, {10.4185, 0.96567}, {20.4185, 0.96567}}, color = {255, 85, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5, smooth = Smooth.Bezier), Line(origin = {-0.32, -11.72}, points = {{-19.5815, 0.96567}, {-9.5815, 4.96567}, {-1.58146, -1.03433}, {4.4185, 4.96567}, {10.4185, 0.96567}, {20.4185, 0.96567}}, color = {255, 85, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5, smooth = Smooth.Bezier)}, coordinateSystem(initialScale = 0.1)));
    
end heat_flow;
