within ;
package MyFirstLib
  connector myPort
    Real beispiel941 = 941 "testetst";
    Real p;     //Druck
    flow Real mflow;     //Massenfluss
    Real hallomichael = 0 " haha";
    Real hallobeispiel "Variablen-GitBsp";
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Ellipse(
            extent={{-94,94},{96,-96}},
            lineColor={28,108,200},
            fillColor={244,125,35},
            fillPattern=FillPattern.Solid)}),                      Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end myPort;

  model Tank
    myPort myPort1 annotation (Placement(transformation(extent={{-162,20},{-142,40}}),
          iconTransformation(extent={{-10,-100},{10,-80}})));
    parameter Real A=0.1 "Querschnitt Stutzen";
    parameter Real roh=1 "Mediendichte";
    constant Real g=Modelica.Constants.g_n;     //Erdbeschleunigung
    Real h(start=1)
                   "Behälterfüllstand";
    parameter Real patmo=100000 "Atmosphärendruck";
  parameter Real a = 0;
  equation

    myPort1.p=roh*g*h+patmo+0.5*roh*myPort1.mflow/roh/A*0.1;
    myPort1.mflow/roh/A=der(h);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,94},{100,-90}},
            lineColor={28,108,200},
            fillColor={128,108,200},
            fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
            preserveAspectRatio=false)));
  end Tank;


  model Test
    Tank Henry(h(start=2))
      annotation (Placement(transformation(extent={{-58,-2},{-2,54}})));
    Tank Henrietta
      annotation (Placement(transformation(extent={{22,-2},{78,54}})));
  equation
    connect(Henry.myPort1, Henrietta.myPort1) annotation (Line(points={{-30,0.8},
            {-30,-24},{52,-24},{52,0.8},{50,0.8}}, color={28,108,200}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Test;

model sun
//
  parameter Real lat = 48.8785888 "latitude";
  parameter Real long = 8.7172797 "longitude";
  parameter Real pi = 3.141592654;
  parameter Real day = 26, month = 6;
  Real delta "declination angle";
  Real n "day number, such that day = 1 on the 1st January";
  Real m "part of the year";
  Real omega "hour angle";
  Real alpha, elevation "altitude angle";
  Real beta, azimuth "the solar azimuth angle";
  Real hour "actual time";
  Real phi "time equation";
  Real K;
equation
  hour = time / 60 / 60;
  n = (month - 1) * 30.3 + day;
  K = pi / 180;
  m = (n-1+(hour-12)/24)/365;
  delta=(0.006918-0.399912*cos(2*pi*m)+0.070257*sin(2*pi*m)-0.006758*cos(4*pi*m)+0.000907*sin(4*pi*m)-0.002697*cos(6*pi*m)+0.00148*sin(6*pi*m))/K;
  phi=229.18*(0.000075+0.001868*cos(2*pi*m)-0.032077*sin(2*pi*m)-0.014615*cos(4*pi*m)-0.040849*sin(4*pi*m));
  omega = (hour * 60 + phi + 4* long - 60) / 4 - 180;
  alpha = sin(K * lat) * sin(K * delta) + cos(K * lat) * cos(K * delta) * cos(K * omega);
  beta = -(sin(K * lat) * alpha - sin(K * delta)) / (cos(K * lat) * sin(acos(alpha)));
  elevation = asin(alpha)/K;
  azimuth = if der(beta) < 0 then acos(beta)/K else 360-acos(beta)/K;
  annotation(
    experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-06, Interval = 66.7111));
end sun;

end MyFirstLib;
