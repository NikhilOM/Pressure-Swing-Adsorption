within OxygenPSA;

model MultiSource
parameter Integer NOC = 2;
  parameter Real P = 6, Q = 0.002, Tg = 300, R = 8.3144621e-05;
//  parameter Real y[NOC] = {0.786, 0.21, 0.003, 0.0005, 0.0005};
parameter Real y[NOC] = {0.79, 0.21};  //, 0.003, 0.0005, 0.0005};
  Real p[NOC], C[NOC];
  //, Pout;
  Outflows outflows annotation(
    Placement(visible = true, transformation(origin = {42, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {42, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Outflows outflows1 annotation(
    Placement(visible = true, transformation(origin = {-24, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-24, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
equation
//      Pout = sensor.P;
  p[:] = y[:] .* P;
  C[:] = p[:] / (R * Tg);
  if outflows.open then
    outflows.C[:] = C[:];
    outflows.P = P;
    outflows.U = Q;
  else
    outflows.C[:] = {0,0};//, 0, 0, 0};
//{1e-10, 1e-10, 1e-10, 1e-10, 1e-10};
    outflows.P = 0;
//1e-3;
    outflows.U = 0;
//1e-3;
  end if;
  if outflows1.open then
    outflows1.C[:] = C[:];
    outflows1.P = P;
    outflows1.U = Q;
  else
    outflows1.C[:] = {0, 0};//, 0, 0, 0};
//{1e-10, 1e-10, 1e-10, 1e-10, 1e-10};
    outflows1.P = 0;
//1e-3;
    outflows1.U = 0;
//1e-3;
  end if;
  annotation(
    Icon(graphics = {Rectangle(origin = {9, 6}, lineColor = {255, 85, 0}, fillColor = {80, 33, 200}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-41, 34}, {41, -34}}), Text(origin = {1, 50}, extent = {{-33, 0}, {33, 0}}, textString = "SourceAir")}));


end MultiSource;