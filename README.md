# gewXhouse

Created and developed within the framework of a project work in the subject "Modelica Seminar" for the master course mechatronic system development at the Pforzheim University.

## Goal

The goal is the creation of a modelica library for the simulation of a greenhouse.

## Requirements

- Temperature course in the greenhouse over 24 h on 26.07.2018
- Location is Pforzheim University
- Base area are 3x3m
- Freestanding: no shadow
- Sun
  - Calculation of azimuth and height
  - Parameters are date of year (day + month), longitude and latitude for the University
  - Outputs are direct radiation (W/m²) over time
- Greenhouse
  - Parameters are relevant geometric parameters and alignment (N, S, O, W)
  - Start temperature inside is 20 °C
- Environment (outdoor temperature should be able to be set over 24 h)
- Optional (enthusiasm features)
  - Cloudiness level
  - Ventilation of the greenhouse
  
## License

This Modelica package is free software and the use is completely at your own risk.

You may report any issues by using the [Issue Tracker](../../issues).
