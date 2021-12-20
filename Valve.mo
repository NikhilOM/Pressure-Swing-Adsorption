within OxygenPSA;

model Valve
 Modelica.Blocks.Interfaces.BooleanInput Vcontrol annotation(
    Placement(visible = true, transformation(origin = {0, -68}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -68}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Outflows2 outflows2 annotation(
    Placement(visible = true, transformation(origin = {-76, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Inflows2 inflows2 annotation(
    Placement(visible = true, transformation(origin = {80, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  outflows2.C[:] = inflows2.C[:];
  outflows2.P = inflows2.P;
  outflows2.U = inflows2.U;
  outflows2.open = Vcontrol;
  inflows2.open = Vcontrol;
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Line(points = {{20, 20}, {20, 20}}, thickness = 0.5), Line(origin = {0.0499204, -1.00411}, points = {{-80.0499, 59.0041}, {-80.0499, -60.9959}, {81.9501, 61.0041}, {81.9501, -60.9959}, {-82.0499, 59.0041}, {-52.0499, -2.99589}}), Line(origin = {1.20711, -26.2071}, points = {{-1.20711, 24.2071}, {-1.20711, -23.7929}, {-1.20711, -21.7929}, {0.792893, -23.7929}})}));

end Valve;