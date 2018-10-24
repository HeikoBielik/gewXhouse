package gewXhouse

  package Connectors
    model Heat_Flow
      parameter Modelica.SIunits.ThermalConductivity w = 0.76 "thermal_conductivity";
      parameter Real d = 0.05 "diameter";
      
      annotation(
        Icon(graphics = {Line(origin = {0.660189, -0.330189},points = {{0, 80}, {0, -80}}, color = {87, 87, 87}, thickness = 12), Line(origin = {-0.0898113, -1.62981}, points = {{-79.5815, 0.96567}, {-39.5815, 8.96567}, {0.418537, -9.03433}, {40.4185, 8.96567}, {58.4185, 0.96567}, {80.4185, 0.96567}}, color = {255, 85, 0}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 25, smooth = Smooth.Bezier), Line(origin = {-0.32566, 58.5589}, points = {{-79.5815, 0.96567}, {-39.5815, 8.96567}, {0.418537, -9.03433}, {40.4185, 8.96567}, {58.4185, 0.96567}, {80.4185, 0.96567}}, color = {255, 85, 0}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 25, smooth = Smooth.Bezier), Line(origin = {0.759246, -61.5355}, points = {{-79.5815, 0.96567}, {-39.5815, 8.96567}, {0.418537, -9.03433}, {40.4185, 8.96567}, {58.4185, 0.96567}, {80.4185, 0.96567}}, color = {255, 85, 0}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 25, smooth = Smooth.Bezier)}));
    end Heat_Flow;



    annotation(
      Icon(graphics = {Ellipse(origin = {0, -71}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-26, -25}, {26, 25}}, endAngle = 360), Line(origin = {1.99019, 9.43415}, points = {{-1.66038, -59.6698}, {-1.66038, 60.3302}}, thickness = 4, arrowSize = 50), Line(origin = {-30.3302, -25.9057}, points = {{30, -44}, {32, 4}, {-30, -4}, {-30, 34}, {-30, 44}}, thickness = 4, smooth = Smooth.Bezier), Line(origin = {-20.3302, -15.9057}, points = {{20, -54}, {20, 12}, {80, 8}, {80, 48}, {80, 56}}, thickness = 4, smooth = Smooth.Bezier), Rectangle(origin = {60, 29}, fillPattern = FillPattern.Solid, extent = {{-16, 15}, {16, -15}}), Ellipse(origin = {-61, 12}, fillPattern = FillPattern.Solid, extent = {{-19, -20}, {21, 20}}, endAngle = 360), Polygon(origin = {0, 80}, fillPattern = FillPattern.Solid, points = {{0, 14}, {-20, -18}, {20, -18}, {0, 14}})}));
  end Connectors;

package Models
  model Sun
    annotation(
      Icon(graphics = {Ellipse(lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 3, extent = {{-40, 40}, {40, -40}}, endAngle = 360), Line(origin = {0, 64.67}, points = {{0, -15}, {0, 15}}, color = {255, 170, 0}, thickness = 3), Line(origin = {0.754717, -64.9998}, points = {{0, -15}, {0, 15}}, color = {255, 170, 0}, thickness = 3), Line(origin = {52.0283, -16.6979}, points = {{28, 17}, {-2, 17}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-77.9717, -17.9243}, points = {{28, 17}, {-2, 17}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-67.9717, 22.1229}, points = {{30, 15}, {8, 37}}, color = {255, 170, 0}, thickness = 3), Line(origin = {29.8585, -74.8582}, points = {{30, 15}, {8, 37}}, color = {255, 170, 0}, thickness = 3), Line(origin = {29.6227, 44.7644}, points = {{30, 15}, {8, -7}}, color = {255, 170, 0}, thickness = 3), Line(origin = {-67.3584, -52.8771}, points = {{30, 15}, {8, -7}}, color = {255, 170, 0}, thickness = 3)}));
  end Sun;

  model Greenhouse
  
    gewXhouse.Connectors.Heat_Flow Wall annotation(
        Placement(visible = true, transformation(origin = {1, -1}, extent = {{-37, -37}, {37, 37}}, rotation = 0)));
  
    parameter Real l1 = 3;
    parameter Real l2 = 3;
    parameter Real l3 = 3;
    
    Modelica.SIunits.Area   A1 "Groundarea";
    Modelica.SIunits.Volume V1 "Volume";
    Modelica.SIunits.Area   Oi "Surface inside";
    Modelica.SIunits.Area   Oo "Surcace outside";
    
    Modelica.SIunits.Temperature Ti(start = 270) "Temperature inside";
    constant Modelica.SIunits.Temperature To = 300 "Temperature outside";
    Modelica.SIunits.Temperature dT "Temperature differendce";
    
    Modelica.SIunits.Power Q "transportet Energy";
  
  equation
    
    V1 = (l1-Wall.d)*(l2-Wall.d)*(l3-Wall.d);
    A1 = l1*l2;
    Oi = 5*((l1-Wall.d)*(l2-Wall.d));
    Oo = 5*(l1*l2);
    dT = (To-Ti);
    Q  = (Oo*Wall.w*dT)/Wall.d;
    
    der(Ti) = dT;
  
    
    annotation(
      Icon(graphics = {Line(origin = {-0.660566, -31.3306}, points = {{-80, -49.9851}, {80, -49.9851}, {80, 30.0149}, {0, 50.0149}, {-80, 30.0149}, {-80, -49.9851}}, color = {0, 170, 0}, thickness = 2.5), Line(origin = {0, -74}, points = {{-60, -4}, {-60, 4}, {60, 4}, {60, -4}}, color = {0, 170, 0}, thickness = 2.5), Line(origin = {-20.66, -75}, points = {{0, 3}, {0, -3}}, color = {0, 170, 0}, thickness = 2.5), Line(origin = {20, -75}, points = {{0, 3}, {0, -3}}, color = {0, 170, 0}, thickness = 2.5), Line(origin = {0, -39}, points = {{0, -29}, {0, 29}}, color = {0, 170, 0}, thickness = 3, smooth = Smooth.Bezier), Line(origin = {-8.04048, -59.6474}, points = {{7.34866, -5.0068}, {1.34866, 2.9932}, {-6.65134, 6.9932}, {-8.65134, 0.993197}, {-4.65134, -3.0068}, {7.34866, -5.0068}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {11.1005, -55.2022}, points = {{-9.73228, -1.34643}, {-3.73228, 6.65357}, {2.26772, 10.6536}, {2.2677, 2.65357}, {0.26772, -1.34643}, {-7.73228, -3.34643}, {-9.73228, -1.34643}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {-9.66001, -39.5932}, points = {{8.3163, -5.68474}, {2.31626, 0.31526}, {-1.68374, 4.31526}, {-7.6837, 2.31526}, {-3.68374, -3.68474}, {0.316258, -5.68474}, {8.3163, -5.68474}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {0.209841, -9.88618}, points = {{0, -11.1464}, {4, -5.14645}, {4, 2.85355}, {2, 6.8536}, {-2, 8.8536}, {-6, 2.85355}, {-4, -5.14645}, {0, -11.1464}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {-1, -10}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 10}, {5, -4}, {1, -8}, {-5, 0}, {1, 10}}, smooth = Smooth.Bezier), Polygon(origin = {-15, -42}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{3, 8}, {13, -4}, {5, -4}, {-1, 0}, {3, 8}}, smooth = Smooth.Bezier), Polygon(origin = {1, -56}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{11, 12}, {11, 0}, {5, -2}, {-1, 0}, {11, 12}}, smooth = Smooth.Bezier), Polygon(origin = {-17, -62}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{5, 8}, {17, -2}, {7, -2}, {1, 4}, {5, 8}}, smooth = Smooth.Bezier), Line(origin = {40.217, -26.7459}, points = {{0, -11.1464}, {4, -5.14645}, {4, 2.85355}, {2, 6.8536}, {-2, 8.8536}, {-6, 2.85355}, {-4, -5.14645}, {0, -11.1464}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {27, -46}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 6}, {13, -4}, {5, -4}, {-1, 0}, {1, 6}}, smooth = Smooth.Bezier), Polygon(origin = {39, -26}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 10}, {5, -4}, {1, -8}, {-5, 0}, {1, 10}}, smooth = Smooth.Bezier), Line(origin = {32.2358, -44.9115}, points = {{8.3163, -5.68474}, {2.31626, 0.31526}, {-1.68374, 4.31526}, {-7.6837, 2.31526}, {-3.68374, -3.68474}, {0.316258, -5.68474}, {8.3163, -5.68474}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {40.2171, -38.4397}, points = {{0, -29}, {0, 7}}, color = {0, 170, 0}, thickness = 3, smooth = Smooth.Bezier), Line(origin = {51.9471, -58.8419}, points = {{-9.73228, -1.34643}, {-3.73228, 6.65357}, {2.26772, 10.6536}, {2.2677, 2.65357}, {0.26772, -1.34643}, {-7.73228, -3.34643}, {-9.73228, -1.34643}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {43, -60}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{11, 12}, {11, 0}, {5, -2}, {-1, 0}, {11, 12}}, smooth = Smooth.Bezier), Line(origin = {-47.9957, -57.1547}, points = {{8.3163, -5.68474}, {2.31626, 0.31526}, {-1.68374, 4.31526}, {-7.6837, 2.31526}, {-3.68374, -3.68474}, {0.316258, -5.68474}, {8.3163, -5.68474}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {-43, -18}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{3, 10}, {7, -4}, {1, -8}, {-5, 0}, {3, 10}}, smooth = Smooth.Bezier), Polygon(origin = {-53, -58}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 6}, {13, -4}, {5, -4}, {-1, 0}, {1, 6}}, smooth = Smooth.Bezier), Line(origin = {-40.0146, -19.0541}, points = {{0, -11.1464}, {4, -5.14645}, {4, 2.85355}, {2, 6.8536}, {-2, 8.8536}, {-6, 2.85355}, {-4, -5.14645}, {0, -11.1464}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {-40.0144, -40.4037}, points = {{0, -29}, {0, 15}}, color = {0, 170, 0}, thickness = 3, smooth = Smooth.Bezier), Polygon(origin = {-37, -52}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{11, 12}, {9, 0}, {5, -2}, {-3, 0}, {11, 12}}, smooth = Smooth.Bezier), Line(origin = {-28.914, -51.7797}, points = {{-9.73228, -1.34643}, {-3.73228, 6.65357}, {2.26772, 10.6536}, {2.2677, 2.65357}, {0.26772, -1.34643}, {-7.73228, -3.34643}, {-9.73228, -1.34643}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {9.83424, -30.2384}, points = {{-9.73228, -1.34643}, {-3.73228, 6.65357}, {2.26772, 10.6536}, {2.2677, 2.65357}, {0.26772, -1.34643}, {-7.73228, -3.34643}, {-9.73228, -1.34643}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {1, -30}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{11, 12}, {11, 0}, {5, -2}, {-1, -2}, {11, 12}}, smooth = Smooth.Bezier), Line(origin = {-48.5529, -35.8884}, points = {{8.3163, -5.68474}, {2.31626, 0.31526}, {-1.68374, 4.31526}, {-7.6837, 2.31526}, {-3.68374, -3.68474}, {0.316258, -5.68474}, {8.3163, -5.68474}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {-53, -38}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 8}, {13, -4}, {5, -4}, {-1, 0}, {1, 8}}, smooth = Smooth.Bezier)}, coordinateSystem(initialScale = 0.1)));
  end Greenhouse;






























  model Envorinment
    annotation(
      Icon(graphics = {Line(origin = {-0.23, -84.2968}, points = {{-98.4671, -1.98624}, {-72.4671, 2.01376}, {-44.4671, -5.98624}, {7.53292, 4.01376}, {43.5329, -3.98624}, {69.5329, 2.01376}, {97.5329, -3.98624}}, color = {85, 85, 0}, thickness = 6, smooth = Smooth.Bezier), Line(origin = {49.0979, 88.3132}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 3, smooth = Smooth.Bezier), Line(origin = {48.8621, 78.1717}, points = {{-39.934, -0.80248}, {-21.934, 5.19752}, {0.0659595, -0.802482}, {18.066, 3.19752}, {40.066, -2.80248}}, color = {85, 85, 255}, thickness = 3, smooth = Smooth.Bezier), Line(origin = {0.13, 4.2}, points = {{-59.9906, -57.1231}, {-79.9906, -41.1231}, {-79.9906, 38.8769}, {-59.9906, 58.8769}, {60.0094, 58.8769}, {80.0094, 38.8769}, {80.0094, -41.1231}, {60.0094, -61.1231}, {-37.9906, -61.1231}}, color = {255, 85, 255}, thickness = 5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 25, smooth = Smooth.Bezier)}));
  end Envorinment;
  annotation(
    Icon(graphics = {Ellipse(lineColor = {0, 0, 127},fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid,lineThickness = 2.5, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Line(origin = {-57.83, 75.89}, points = {{-37.1175, 2.54578}, {-17.1175, 14.5458}, {12.8825, 10.5458}, {34.8825, -17.4542}}, color = {87, 87, 87}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20, smooth = Smooth.Bezier), Line(origin = {42.31, -53.45}, points = {{-29.1175, -5.45422}, {-23.1175, -31.4542}, {16.8825, -31.4542}, {44.8825, -15.4542}}, color = {87, 87, 87}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20, smooth = Smooth.Bezier), Line(origin = {1.98962, -0.678679}, points = {{-33, -1.6698}, {-35, 14.3302}, {-15, 32.3302}, {11, 32.3302}, {31, 16.3302}, {31, -11.6698}, {11, -29.6698}, {-13, -29.6698}, {-27, -15.6698}}, color = {255, 170, 0}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20, smooth = Smooth.Bezier)}));
end Models;



package Tests
  model Test1

annotation(
      Icon(graphics = {Ellipse(origin = {-28, -36}, lineThickness = 1, extent = {{-32, -44}, {88, 76}}, endAngle = 360), Line(origin = {19.2553, 20.5861}, points = {{-80.0137, -0.0233647}, {-40.0137, -60.0234}, {79.9863, 59.9766}}, color = {0, 85, 0}, thickness = 2)}));
  end Test1;

  annotation(
    Icon(graphics = {Polygon(pattern = LinePattern.Dash, lineThickness = 2.5, points = {{-70, 80}, {70, 80}, {80, 70}, {80, -70}, {70, -80}, {-70, -80}, {-80, -70}, {-80, 70}, {-70, 80}}, smooth = Smooth.Bezier), Rectangle(origin = {-39, 39}, lineThickness = 2, extent = {{-11, 11}, {11, -11}}), Rectangle(origin = {-39, -1}, lineThickness = 2, extent = {{-11, 11}, {11, -11}}), Rectangle(origin = {-39, -41}, lineThickness = 2, extent = {{-11, 11}, {11, -11}}), Line(origin = {11, 30}, points = {{-17, 0}, {17, 0}}, thickness = 2), Line(origin = {45, 30}, points = {{-9, 0}, {9, 0}}, thickness = 2), Line(origin = {24, 40}, points = {{-28, 0}, {28, 0}}, pattern = LinePattern.Dash, thickness = 2), Line(origin = {22.1132, -0.849057}, points = {{-28, 0}, {28, 0}}, pattern = LinePattern.Dash, thickness = 2), Line(origin = {9.11321, -10.8491}, points = {{-17, 0}, {17, 0}}, thickness = 2), Line(origin = {43.1132, -10.8491}, points = {{-9, 0}, {9, 0}}, thickness = 2), Line(origin = {21.8774, -41.0377}, points = {{-28, 0}, {28, 0}}, pattern = LinePattern.Dash, thickness = 2), Line(origin = {8.87736, -51.0378}, points = {{-17, 0}, {17, 0}}, thickness = 2), Line(origin = {42.8774, -51.0378}, points = {{-9, 0}, {9, 0}}, thickness = 2), Line(origin = {-25.6698, 44.9992}, points = {{-24.0029, -2.323}, {-12.0029, -14.323}, {13.9971, 17.677}}, color = {0, 170, 0}, thickness = 3), Line(origin = {-41, -40}, points = {{-11, 18}, {11, -18}}, color = {255, 0, 0}, thickness = 3), Line(origin = {-37, -39}, points = {{-19, -11}, {19, 11}}, color = {255, 0, 0}, thickness = 3)}));
end Tests;

  annotation(
    Icon(graphics = {Line(origin = {0.33, -30.34}, points = {{-80, -49.9851}, {80, -49.9851}, {80, 30.0149}, {0, 50.0149}, {-80, 30.0149}, {-80, -49.9851}}, color = {0, 170, 0}, thickness = 2.5), Line(origin = {0, -74}, points = {{-60, -4}, {-60, 4}, {60, 4}, {60, -4}}, color = {0, 170, 0}, thickness = 2.5), Line(origin = {-20.66, -75}, points = {{0, 3}, {0, -3}}, color = {0, 170, 0}, thickness = 2.5), Line(origin = {20, -75}, points = {{0, 3}, {0, -3}}, color = {0, 170, 0}, thickness = 2.5),   Line(origin = {0, -39}, points = {{0, -29}, {0, 29}}, color = {0, 170, 0}, thickness = 3, smooth = Smooth.Bezier), Line(origin = {-8.04048, -59.6474}, points = {{7.34866, -5.0068}, {1.34866, 2.9932}, {-6.65134, 6.9932}, {-8.65134, 0.993197}, {-4.65134, -3.0068}, {7.34866, -5.0068}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {11.1005, -55.2022}, points = {{-9.73228, -1.34643}, {-3.73228, 6.65357}, {2.26772, 10.6536}, {2.2677, 2.65357}, {0.26772, -1.34643}, {-7.73228, -3.34643}, {-9.73228, -1.34643}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {-9.66001, -39.5932}, points = {{8.3163, -5.68474}, {2.31626, 0.31526}, {-1.68374, 4.31526}, {-7.6837, 2.31526}, {-3.68374, -3.68474}, {0.316258, -5.68474}, {8.3163, -5.68474}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Ellipse(origin = {-70, 70}, lineColor = {255, 255, 0}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, lineThickness = 2.5, extent = {{-10, 10}, {30, -30}}, endAngle = 360), Line(origin = {0.209841, -9.88618}, points = {{0, -11.1464}, {4, -5.14645}, {4, 2.85355}, {2, 6.8536}, {-2, 8.8536}, {-6, 2.85355}, {-4, -5.14645}, {0, -11.1464}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {-1, -10}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 10}, {5, -4}, {1, -8}, {-5, 0}, {1, 10}}, smooth = Smooth.Bezier), Polygon(origin = {-15, -42}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{3, 8}, {13, -4}, {5, -4}, {-1, 0}, {3, 8}}, smooth = Smooth.Bezier), Polygon(origin = {1, -56}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{11, 12}, {11, 0}, {5, -2}, {-1, 0}, {11, 12}}, smooth = Smooth.Bezier), Polygon(origin = {-17, -62}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{5, 8}, {17, -2}, {7, -2}, {1, 4}, {5, 8}}, smooth = Smooth.Bezier), Line(origin = {40.217, -26.7459}, points = {{0, -11.1464}, {4, -5.14645}, {4, 2.85355}, {2, 6.8536}, {-2, 8.8536}, {-6, 2.85355}, {-4, -5.14645}, {0, -11.1464}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {27, -46}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 6}, {13, -4}, {5, -4}, {-1, 0}, {1, 6}}, smooth = Smooth.Bezier), Polygon(origin = {39, -26}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 10}, {5, -4}, {1, -8}, {-5, 0}, {1, 10}}, smooth = Smooth.Bezier), Line(origin = {32.2358, -44.9115}, points = {{8.3163, -5.68474}, {2.31626, 0.31526}, {-1.68374, 4.31526}, {-7.6837, 2.31526}, {-3.68374, -3.68474}, {0.316258, -5.68474}, {8.3163, -5.68474}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {40.2171, -38.4397}, points = {{0, -29}, {0, 7}}, color = {0, 170, 0}, thickness = 3, smooth = Smooth.Bezier), Line(origin = {51.9471, -58.8419}, points = {{-9.73228, -1.34643}, {-3.73228, 6.65357}, {2.26772, 10.6536}, {2.2677, 2.65357}, {0.26772, -1.34643}, {-7.73228, -3.34643}, {-9.73228, -1.34643}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {43, -60}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{11, 12}, {11, 0}, {5, -2}, {-1, 0}, {11, 12}}, smooth = Smooth.Bezier), Line(origin = {-47.9957, -57.1547}, points = {{8.3163, -5.68474}, {2.31626, 0.31526}, {-1.68374, 4.31526}, {-7.6837, 2.31526}, {-3.68374, -3.68474}, {0.316258, -5.68474}, {8.3163, -5.68474}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {-43, -18}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{3, 10}, {7, -4}, {1, -8}, {-5, 0}, {3, 10}}, smooth = Smooth.Bezier), Polygon(origin = {-53, -58}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 6}, {13, -4}, {5, -4}, {-1, 0}, {1, 6}}, smooth = Smooth.Bezier), Line(origin = {-40.0146, -19.0541}, points = {{0, -11.1464}, {4, -5.14645}, {4, 2.85355}, {2, 6.8536}, {-2, 8.8536}, {-6, 2.85355}, {-4, -5.14645}, {0, -11.1464}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {-40.0144, -40.4037}, points = {{0, -29}, {0, 15}}, color = {0, 170, 0}, thickness = 3, smooth = Smooth.Bezier), Polygon(origin = {-37, -52}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{11, 12}, {9, 0}, {5, -2}, {-3, 0}, {11, 12}}, smooth = Smooth.Bezier), Line(origin = {-28.914, -51.7797}, points = {{-9.73228, -1.34643}, {-3.73228, 6.65357}, {2.26772, 10.6536}, {2.2677, 2.65357}, {0.26772, -1.34643}, {-7.73228, -3.34643}, {-9.73228, -1.34643}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Line(origin = {9.83424, -30.2384}, points = {{-9.73228, -1.34643}, {-3.73228, 6.65357}, {2.26772, 10.6536}, {2.2677, 2.65357}, {0.26772, -1.34643}, {-7.73228, -3.34643}, {-9.73228, -1.34643}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {1, -30}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{11, 12}, {11, 0}, {5, -2}, {-1, -2}, {11, 12}}, smooth = Smooth.Bezier), Line(origin = {-48.5529, -35.8884}, points = {{8.3163, -5.68474}, {2.31626, 0.31526}, {-1.68374, 4.31526}, {-7.6837, 2.31526}, {-3.68374, -3.68474}, {0.316258, -5.68474}, {8.3163, -5.68474}}, color = {0, 170, 0}, thickness = 2.5, smooth = Smooth.Bezier), Polygon(origin = {-53, -38}, lineColor = {0, 170, 0}, fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{1, 8}, {13, -4}, {5, -4}, {-1, 0}, {1, 8}}, smooth = Smooth.Bezier), Line(origin = {-18, 60}, points = {{-14, 0}, {14, 0}}, color = {255, 255, 0}, thickness = 2.5), Line(origin = {-61.6298, 19.6916}, points = {{1.20711, 12.2071}, {1.20711, -9.79289}}, color = {255, 255, 0}, thickness = 2.5), Line(origin = {-31, 32}, points = {{-9, 8}, {9, -8}}, color = {255, 255, 0}, thickness = 2.5)}));
end gewXhouse;
