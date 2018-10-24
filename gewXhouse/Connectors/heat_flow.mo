within gewXhouse.Connectors;

connector heat_flow

  parameter Modelica.SIunits.ThermalConductivity w = 0.76 "thermal_conductivity";
  parameter Real d = 0.05 "diameter";
  
annotation(
        Icon(graphics = {Line(origin = {0.660189, -0.330189},points = {{0, 80}, {0, -80}}, color = {87, 87, 87}, thickness = 12), Line(origin = {-0.0898113, -1.62981}, points = {{-79.5815, 0.96567}, {-39.5815, 8.96567}, {0.418537, -9.03433}, {40.4185, 8.96567}, {58.4185, 0.96567}, {80.4185, 0.96567}}, color = {255, 85, 0}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 25, smooth = Smooth.Bezier), Line(origin = {-0.32566, 58.5589}, points = {{-79.5815, 0.96567}, {-39.5815, 8.96567}, {0.418537, -9.03433}, {40.4185, 8.96567}, {58.4185, 0.96567}, {80.4185, 0.96567}}, color = {255, 85, 0}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 25, smooth = Smooth.Bezier), Line(origin = {0.759246, -61.5355}, points = {{-79.5815, 0.96567}, {-39.5815, 8.96567}, {0.418537, -9.03433}, {40.4185, 8.96567}, {58.4185, 0.96567}, {80.4185, 0.96567}}, color = {255, 85, 0}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 25, smooth = Smooth.Bezier)}));
    
end heat_flow;
