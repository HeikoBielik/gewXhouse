within gewXhouse.Connectors.Interfaces;

connector House

  parameter Integer N = 1;
  Models.Greenhouse.Surface surfaces[N];
  Models.Greenhouse.Surface floor "Floor";
  Modelica.SIunits.Area total "Total surface";
  Modelica.SIunits.Volume volume "Inner volume of the house";
  
  /*Models.Greenhouse.M_surface sN "North surface";
  Models.Greenhouse.M_surface sE "East surface";
  Models.Greenhouse.M_surface sS "South surface";
  Models.Greenhouse.M_surface sW "West surface";
  Models.Greenhouse.M_surface rE "East roof surface";
  Models.Greenhouse.M_surface rW "West roof surface";*/
  
  //Modelica.SIunits.Angle pitch "Roof pitch of the house";
  //Modelica.SIunits.Angle north "Orientation of the house 'north direction'";

  annotation(
    Icon(graphics = {Rectangle(fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
end House;
