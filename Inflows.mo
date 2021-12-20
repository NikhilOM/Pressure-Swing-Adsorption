within OxygenPSA;

connector Inflows
  parameter Integer N = 2;
  import Units = Modelica.SIunits;
  input Units.MolarFlowRate C[N], P, U;
  input Boolean open "valve open";
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, -100}, {0, 100}, {100, -100}, {-100, -100}}, lineThickness = 0.5, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}));


end Inflows;