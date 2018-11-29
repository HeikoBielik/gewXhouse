within gewXhouse.Tests;

model path
  String pathName;
equation
  pathName = Modelica.Utilities.Files.loadResource("modelica://gewXhouse.Resources");
  print(pathName + "\n");
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 1));end path;
