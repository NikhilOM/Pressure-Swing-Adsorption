within OxygenPSA;

connector Outflows
import Units = Modelica.SIunits;
  parameter Integer N = 2;
  output Units.MolarFlowRate C[N], P, U;
  //output Units.MolarFlowRate Fo "outflow", MF1, MF2, MF3;
  input Boolean open "valve open";
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, 100}, {0, -100}, {100, 100}, {-100, 100}}, lineThickness = 0.5, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}));


end Outflows;