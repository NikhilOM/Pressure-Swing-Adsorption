within OxygenPSA;

model SingleSink
  parameter Integer NOC = 2;
  parameter Real P = 1, U = 0.002 , R = 8.314e-5, Tg = 300, y[NOC] = {0,1};//,0,0,0};
  Real p[NOC],C[NOC];
  OxygenPSA.Outflows outflows annotation(
    Placement(visible = true, transformation(origin = {-23, 15}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
equation
p[:] = y[:].*P;
C[:] = p[:]./(R*Tg);
  if outflows.open then
    outflows.C[:] = C[:];//{0, 41, 0, 0, 0};
    outflows.P = P;
    outflows.U = U;
  else
    outflows.C[:] ={0,0};//,0,0,0};// {1e-10, 1e-10, 1e-10, 1e-10, 1e-10};
    outflows.P = 0;//1e-3;
    outflows.U = 0;//1e-3;
  end if;
  
 
  annotation(
    Icon(graphics = {Rectangle(origin = {2, 42}, extent = {{-34, 18}, {34, -18}})}));

end SingleSink;