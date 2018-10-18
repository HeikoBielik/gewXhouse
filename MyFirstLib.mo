within ;
package MyFirstLib
  connector myPort
    Real p; //Druck
    flow Real mflow; //Massenfluss
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
    constant Real g=Modelica.Constants.g_n; //Erdbeschleunigung
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
end MyFirstLib;
