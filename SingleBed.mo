within OxygenPSA;

model SingleBed
  parameter Real Pe = 500, Pair = 1.013, Tair = 298, yair[NOC] = {0.79, 0.21/*, 0.003, 0.0005, 0.0005*/}, CF[:]= {1e-10,1e-10}, uF = 1e-10;
  Real pair[NOC], Cair[NOC];

  parameter Real CycleTime = 1600;
  parameter Real dz = L / (NOP - 1), L = 1;
  parameter Integer NOC = 2, NOP = 11;
  Real C[NOC, NOP], Y[NOC, NOP], CT[NOP];
  Real q[NOC, NOP], qeq[NOC, NOP];
  Real p[NOC, NOP], b[NOC, NOP];
  /*,Keq[NOC,NOP]*/
  parameter Real pointer[NOP] = 0:dz:1;
  parameter Real R = 8.314e-5, Tg = 300;
  //363;
  // Toth model parameter
  //parameter Real  n[NOC] ={0.429,0.869}, Kl[NOC] = {0.11,0.5}, qm[NOC] = {5.09,3.08},K0[NOC]={4.31e-9,8.81e-10},dH[NOC]={-29380,-17190}, D = 9e-3, e=0.33, rhoP = 1228.5;
  // Langmuir Parameter
  parameter Real e = 0.5418, rhoP = 600, b0[NOC] = {3.275432, 0.00751379/*, 1.1025313, 1e-10, 0.001*/}, Kl[NOC] = {19.7, 62/*, 0.1, 9.72e-3, 0.1*/}/*, D = 0.01*/, qm[NOC] = {1.453822, 40.0727/*, 5.3009542, 1e-10, 0.001*/};
  /*9.72e-3*/
  ///*{1.557e-11,4.96e-10}*/, qm[NOC] = {7.90,14}, E[NOC] = {-42000,-18000}, D = 9e-3, Kl[NOC] = {0.174, 0.2855};
  Real u[NOP], P[NOP];
  //  Modelica.Blocks.Sources.Ramp feedGasFractionRamp(duration = 10, height = 1, offset = 0, startTime = 0);
//  parameter Real SingleDer[NOP, NOP] = OxygenPSA.OCFESingleDer(N = NOP, z = points, L = 1);
//  parameter Real DoubleDer[NOP, NOP] = OxygenPSA.OCFEDoubleDer(N = NOP, z = points, L = 1);
  
  parameter Real SingleDer[NOP, NOP] = OxygenPSA.FDFESingleDer(N = NOP, z = points, L = 1);
  parameter Real DoubleDer[NOP, NOP] = OxygenPSA.FDFEDoubleDer(N = NOP, z = points, L = 1);
  
  
  parameter Real points[NOP] = if NOP == 9 then (ones(9) - {1.000, 0.9740, 0.8667, 0.7151, 0.4853, 0.3076, 0.1246, 0.0267, 0.000}) / 1.0 else if NOP == 5 then {0, 0.1127, 0.5, 0.8873, 1} else linspace(0, L, NOP);
  // Input from the Source
  //  parameter Real uin = 0.0002;
  Real Cin[NOC], Pin, uin;
  Real CFin[NOC], PFin, uFin;
  Real CPurgein[NOC], PPurgein, uPurgein;
  Real D;
    Modelica.Blocks.Sources.Ramp feedGasFractionRamp(duration = 10, height = 1, offset = 0, startTime = 0);
  /*CinFinal[NOC],*/
  //Sensor sensor annotation(
  //    Placement(visible = true, transformation(origin = {-32, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-32, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Inflows inflows annotation(
    Placement(visible = true, transformation(origin = {-28, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-36, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Inflows inflows1 annotation(
    Placement(visible = true, transformation(origin = {-36, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-36, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Outflows outflows annotation(
    Placement(visible = true, transformation(origin = {-6, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-6, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Inflows inflows2 annotation(
    Placement(visible = true, transformation(origin = {-18, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-4, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
//C[:,1] = {1e-3,1e-3};
//C[:,NOP] = {1e-3,1e-3};

equation
//D = u[1]*L/Pe;//
//  D = 0.0025*L/Pe;
D = 0.004;
  pair[:] = yair[:] .* Pair;
  Cair[:] = pair[:] / (R * Tair);
  
  inflows.C[:] = Cin[:];
  inflows.P = Pin;
  inflows.U = uin;
  
  inflows1.C[:] = CFin[:];
  inflows1.P = PFin;
  inflows1.U = uFin;
  
  inflows2.C[:] = CPurgein[:];
  inflows2.P = PPurgein;
  inflows2.U = uPurgein;
  
  outflows.C[:] = C[:, NOP];
  outflows.P = P[NOP];
  outflows.U = u[NOP];
  for i in 1:NOP loop
    P[i] = sum(p[:, i]);
//p[1, i] + p[2, i];
    p[:, i] = Y[:, i] .* P[i];
    C[:, i] = p[:, i] / (R * Tg);
    der(q[:, i]) = Kl[:] .* (qeq[:, i] - q[:, i]);
//Langmuir Model
    b[:, i] = b0[:];
//.*exp(-E[:]/(R*Tg));
  end for;
  for i in 1:NOP loop
    for j in 1:NOC loop
//    // Langmuir Model
      qeq[j, i] = qm[j] * b[j, i] * p[j, i] / (1 + sum(b[j, i] * p[j, i]));
    end for;
  end for;
//Component Balance
//  C[:, 1] = Cin[:];
//Boundary Condition
//    for i in 1:NOC loop
////    C[i, NOP] - C[i, NOP - 1] = 0;
//    e * D * (C[i, NOP] - C[i, NOP - 1]) / (2 * dz) = -uin * (C[i, NOP] - C[i, NOP - 1]);
////// C[i,1] = Cin[i];
////sum(C[i,:]) = CT[1];
//  end for;
//  if time <= 33 then
  if inflows.open then
    e * D * (Cin[:] - C[:, 1]) / (2 * dz) = -uin * (Cin[:] - C[:, 1]);
    C[:, NOP] = C[:, NOP - 1];
// = 0;
//e*D*(C[:,1]-Cin[:])/(2*dz) = -uin*(C[:,1]-Cin[:]);
  elseif inflows1.open then
    C[:, 1] = C[:, 2];
    e * D * (C[:, NOP] - CFin[:]) / (2 * dz) = -uin * (C[:, NOP] - CFin[:]);
  elseif outflows.open then
    C[:, 1] = C[:, 2];
    C[:,NOP] = feedGasFractionRamp.y *Cair[:];
  elseif inflows2.open and outflows.open then
     e * D * (CPurgein[:] - C[:, 1]) / (2 * dz) = -uPurgein * (CPurgein[:] - C[:, 1]); 
     C[:,NOP] = feedGasFractionRamp.y *Cair[:];
//C[:, NOP] = C[:, NOP - 1];
   else 
     e * D * (Cin[:] - C[:, 1]) / (2 * dz) = -uF * (CF[:] - C[:, 1]);
    C[:, NOP] = C[:, NOP - 1];
//     C[:,1] = C[:,NOP];
//     C[:,NOP] = feedGasFractionRamp.y *Cair[:];
//   if time > 1 then 
//   (C[:,1]) = {1e-10,1e-10,1e-10,1e-10,1e-10};
//   (C[:,NOP]) = {1e-10,1e-10,1e-10,1e-10,1e-10};
//   else
//   der(C[:,1]) = Cin[:];//{1e-10,1e-10};//,1e-10,1e-10,1e-10}  ;
//   C[:,NOP] = C[:,NOP-2];//{1e-10,1e-10};//,1e-10,1e-10,1e-10} ;


  end if;
//COmponent Balance
  for j in 1:NOC loop
    for i in 2:NOP - 1 loop
//      (-D * ((C[j, i + 1] - 2 * C[j, i] + C[j, i - 1]) / dz ^ 2)) + u[i] * ((C[j, i + 1] - C[j, i - 1]) / (2 * dz)) + C[j, i] * ((u[i + 1] - u[i - 1]) / (2 * dz)) + rhoP * (((1 - e) / e) * der(q[j, i])) + der(C[j, i]) = 0;
-D*sum(DoubleDer[i,:].*C[j,:]) + u[i]*sum(SingleDer[i,:].*C[j,:]) +C[j,i]*sum(SingleDer[i,:].*u[:]) + rhoP * ((1 - e) / e * der(q[j, i])) + der(C[j, i]) = 0;
//bar
    end for;
  end for;
//Overall Balance
  for j in 1:NOP loop
//for i in 1: NOC loop
    CT[j] = sum(C[:, j]);
  end for;
  u[1] = uin;
//u[NOP]=0;//-u[NOP-1] = 0;
  for i in 2:NOP loop
    u[i - 1] = u[i];
//(-D * ((CT[i + 1] - 2 * CT[i] + CT[i - 1]) / dz ^ 2)) + (( u[i+1] *CT[ i + 1] - u[i-1]*CT[ i - 1]) / (2 * dz)) + /*CT[i] * ((u[i + 1] - u[i - 1]) / (2 * dz)) +*/ rhoP * ((1 - e) / e) * (der(q[1, i])+der(q[2,i])) + der(CT[i]) = 0;
  end for;
  annotation(
    Icon(graphics = {Rectangle(origin = {-20, 4}, extent = {{-18, 42}, {18, -42}})}));
end SingleBed;