within OxygenPSA;

model SingleSource
  parameter Integer NOC = 2;
  parameter Real P = 6, Q = 0.002, Tg = 300, R = 8.3144621e-05;
//  parameter Real y[NOC] = {0.787, 0.21, 0.003};//, 0.001, 0.001};
parameter Real y[NOC] = {0.79, 0.21};
  Real p[NOC], C[NOC];
  //, Pout;
  OxygenPSA.Outflows outflows annotation(
    Placement(visible = true, transformation(origin = {40, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//      Pout = sensor.P;
  p[:] = y[:] .* P;
  C[:] = p[:] / (R * Tg);
  if outflows.open then
    outflows.C[:] = C[:];
    outflows.P = P;
    outflows.U = Q;
  else
    outflows.C[:] = {0, 0};//, 0, 0, 0};
//{1e-10, 1e-10, 1e-10, 1e-10, 1e-10};
    outflows.P = 0;
//1e-3;
    outflows.U = 0;
//1e-3;
  end if;
  annotation(
    Icon(graphics = {Rectangle(origin = {9, 6}, extent = {{-41, 34}, {41, -34}})}));
end SingleSource;