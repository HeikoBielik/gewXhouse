within gewXhouse.Functions;

function surfaceHeatFlux
  input Models.Greenhouse.M_surface surface;
  input Real azimuth;
  input Real elevation;
  output Models.Greenhouse.M_surface surface_;
algorithm
  surface_.I := I_glob * (cos(surface.a) + cos(abs(azimuth - surface.o)) * sin(surface.a) * tan(sunPos.elevation));
  surface_.Ip := if surface.I < 0 or elevation < 0 or abs(surface.a - sunPos.elevation) > 41 then 0 else surface.I;
  surface_.Q := surface.Ip * S[i].A;
end surfaceHeatFlux;
