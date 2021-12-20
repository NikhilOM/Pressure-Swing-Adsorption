within OxygenPSA;

model MultiPress
parameter Integer NOC = 2;
parameter Real P = 6, U = 0.0256, R =8.3144e-5, Tg =300, Y[NOC] = {0,1};//,0,0,0};
Real C[NOC];
 Outflows outflows annotation(
    Placement(visible = true, transformation(origin = {-22, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-22, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Outflows outflows1 annotation(
    Placement(visible = true, transformation(origin = {28, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {28, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
C[:] = Y[:].*P/(R*Tg);

  if outflows.open then
    outflows.C[:] = C[:];//, 0, 0, 0};
    outflows.P = P;
    outflows.U = U;
  else
    outflows.C[:] ={0,0};//,0,0,0};//,0,0,0};// {1e-10, 1e-10, 1e-10, 1e-10, 1e-10};
    outflows.P = 0;//1e-3;
    outflows.U = 0;//1e-3;
  end if;
  
    if outflows1.open then
    outflows1.C[:] = C[:];//, 0, 0, 0};
    outflows1.P = P;
    outflows1.U = U;
  else
    outflows1.C[:] ={0,0};//,0,0,0};// {1e-10, 1e-10, 1e-10, 1e-10, 1e-10};
    outflows1.P = 0;//1e-3;
    outflows1.U = 0;//1e-3;
  end if;
 
  annotation(
    Icon(graphics = {Rectangle(origin = {2, 42}, lineColor = {0, 170, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Cross, extent = {{-34, 18}, {34, -18}}), Text(origin = {0, 66}, lineColor = {0, 0, 127}, extent = {{-38, 6}, {38, -6}}, textString = "Pressurization")}));




end MultiPress;