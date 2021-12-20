within OxygenPSA;

model MultiBedOCCHeck
  parameter Real dz = L / (NOP - 1), L = 1, CF[NOC] = {1e-10,1e-10}, uF= 1e-10;
  parameter Integer NOC = 2, NOP = 5, SS = 3;
  Real C[SS, NOC, NOP](each min = 0, each start = 0), Y[SS, NOC, NOP](each start = 0), CT[SS, NOP];
  Real q[SS, NOC, NOP], qeq[SS, NOC, NOP];
  Real p[SS, NOC, NOP], b[SS, NOC, NOP];
  parameter Real S1[5, 5] = OCFESingleDer(N = 5, z = P1[:], L = L);
  parameter Real t1[5, 5] = OCFEDoubleDer(N = 5, z = P1[:], L = L);
  parameter Real S2[5, 5] = OCFESingleDer(N = 5, z = P2[:], L = L);
  parameter Real t2[5, 5] = OCFEDoubleDer(N = 5, z = P2[:], L = L);
  parameter Real S3[5, 5] = OCFESingleDer(N = 5, z = P3[:], L = L);
  parameter Real t3[5, 5] = OCFEDoubleDer(N = 5, z = P3[:], L = L);
  parameter Real P1[5] = {0, 0.03381, 0.15, 0.26619, 0.3};
  //linspace(0,0.3,5);//
  parameter Real P2[5] = {0.3, 0.34508, 0.5, 0.65492, 0.7};
  //linspace(0.3,0.7,5);//
  parameter Real P3[5] = {0.7, 0.73381, 0.85, 0.96619, 1};
  //linspace(0.7,1,5);//
  parameter Real R = 8.3144621e-05, Tg = 300;
  // Langmuir Parameter
  parameter Real e = 0.5418 "voidage", rhoP = 600"Density of Particle", b0[NOC] = {3.275432, 0.00751379} "Langmuir's Constants", Kl[NOC] = {19.7, 62}/*, 0.1, 9.72e-3, 0.1}*/"Mass Transfer coeffients", D =0.001"Diffusion Coefficient", qm[NOC] = {1.453822, 40.0727}/*, 5.3009542, 1e-10, 0.001}*/"Langmuir Parameters ";
  /*dH[NOC] = {-42000, -18000},*/
  Real u[SS, NOP], P[SS, NOP];
  //---------------------------------------------
  //Input from External Source
  Real Cin[NOC], Pin, uin;
  Real CinPress[NOC], PinPress,uinPress;
  Real CinPurge[NOC], PinPurge, uinPurge;
  
  Modelica.Blocks.Sources.Ramp BlowdownRamp(duration = 10, height = 1, offset = 0, startTime = 0);
  parameter Real yair[NOC] = {0.79, 0.21};
  //--------------------------------------------
  Inflows inflows annotation(
    Placement(visible = true, transformation(origin = {-38, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-38, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Inflows inflows2 annotation(
    Placement(visible = true, transformation(origin = {-2, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Outflows outflows annotation(
    Placement(visible = true, transformation(origin = {-4, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-4, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Inflows inflows1 annotation(
    Placement(visible = true, transformation(origin = {-34, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-34, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation

//  end for;

equation
  C[1, :, 5] = C[2, :, 1];
  C[2, :, 5] = C[3, :, 1];
  
  inflows.C[:] = (Cin[:]);
  inflows.P =    (Pin);  
  inflows.U =    (uin);

  inflows1.C[:] = (CinPress[:]);
  inflows1.P = (PinPress);
  inflows1.U = uinPress;
 
  inflows2.C[:] = (CinPurge[:]);
  inflows2.P = (PinPurge);
  inflows2.U = uinPurge;
  
  outflows.C[:] = C[1, :, 1];
  outflows.P = P[1, 1];
  outflows.U = u[1, 1];


  for k in 1:SS loop
    for i in 1:NOP loop
      P[k, i] = sum(p[k, :, i]);
      for j in 1:NOC loop
        p[k, j, i] = Y[k, j, i] * P[k, i];
        C[k, j, i] = p[k, j, i] / (R * Tg);
      end for;
    end for;
  end for;
//Langmuir Model
  for j in 1:SS loop
    for i in 1:NOP loop
      b[j, :, i] = b0[:];
//.*exp(-dH[:]/(R*Tg));
      der(q[j, :, i]) = Kl[:] .* (qeq[j, :, i] - q[j, :, i]);
    end for;
  end for;
  for i in 1:NOP loop
    for j in 1:NOC loop
//    // Langmuir Model
      qeq[:, j, i] = qm[j] .* b[:, j, i] .* p[:, j, i] ./ (1 + sum(b[:, j, i] .* p[:, j, i]));
    end for;
  end for;
  
  //Boundary Condition

if inflows.open then
  C[1,:, 1] = C[1,:, 2];
  e*D*(CinPress[:]-C[3,:,NOP])/(dz) = -uinPurge*(CinPress[:]-C[3,:,NOP]);
  
elseif inflows1.open then
  e*D*(C[1,:,1]-Cin[:])/(dz) = -uin*(C[1,:,1]-Cin[:]);
  C[3,:, NOP] = C[3,:, NOP - 1]; 
    
elseif outflows.open and not inflows2.open then
C[1,:, 1] = BlowdownRamp.y*yair[:] .* (1 / (R * Tg));
//  C[1,:,1] = yair[:]*(1/(R*Tg));
  C[3,:, NOP] = C[3,:, NOP - 1];  
  
elseif inflows2.open then // and outflows.open then
  C[1, :, 1] = C[1,:, 2];
  e*D*(CinPurge[:]-C[3,:,NOP])/(dz) = -uinPurge*(CinPurge[:]-C[3,:,NOP]);
  

else
C[1,:, 1] = C[1,:, 2];
  e*D*(CinPress[:]-C[3,:,NOP])/(dz) = -uF*(CF[:]-C[3,:,NOP]);
//for j in 1:NOC loop
//  (C[1, j, 1]) = 1e-10;
//  (C[3, j, NOP]) = 1e-10;
//  end for;
 
end if; 
  

//==============================================================================
//Main Component Balance
  for j in 1:NOC loop
    for i in 2:4 loop
//      (-D * ((C[j, i + 1] - 2 * C[j, i] + C[j, i - 1]) / dz ^ 2)) + u[i] * ((C[j, i + 1] - C[j, i - 1]) / (2 * dz)) + C[j, i] * ((u[i + 1] - u[i - 1]) / (2 * dz)) + rhoP * ((1 - e) / e * der(q[j, i])) + der(C[j, i]) = 0;
      (-D * sum(t1[i, :] .* C[1, j, :])) + u[1, i] * sum(S1[i, :] .* C[1, j, :]) + C[1, j, i] * sum(S1[i, :] .* u[1, :]) + rhoP * ((1 - e) / e * der(q[1, j, i])) + der(C[1, j, i]) = 0;
//bar
    end for;
  end for;
//-------------------------------------------------
  for j in 1:NOC loop
    for i in 2:4 loop
      (-D * sum(t2[i, :] .* C[2, j, :])) + u[2, i] * sum(S2[i, :] .* C[2, j, :]) + C[2, j, i] * sum(S2[i, :] .* u[2, :]) + rhoP * ((1 - e) / e * der(q[2, j, i])) + der(C[2, j, i]) = 0;
//bar
    end for;
  end for;
//---------------------------------------------------
  for j in 1:NOC loop
    for i in 2:4 loop
      (-D * sum(t3[i, :] .* C[3, j, :])) + u[3, i] * sum(S3[i, :] .* C[3, j, :]) + C[3, j, i] * sum(S3[i, :] .* u[3, :]) + rhoP * ((1 - e) / e * der(q[3, j, i])) + der(C[3, j, i]) = 0;
//bar
    end for;
  end for;
//-------------------------------------------------
  for j in 1:NOC loop
    sum(S1[5, :] .* C[1, j, :]) = sum(S2[1, :] .* C[2, j, :]);
    sum(S2[5, :] .* C[2, j, :]) = sum(S3[1, :] .* C[3, j, :]);
  end for;
//=====================================================
//Overall Balance
  for k in 1:SS loop
    for j in 1:NOP loop
//for i in 1: NOC loop
      CT[k, j] = sum(C[k, :, j]);
    end for;
  end for;
//================================================
// Velocity Calculation
  u[1, 1] = uin;
  u[2, 1] = uin;
  u[3, 1] = uin;
//u[NOP]-u[NOP-1] = 0;
  for k in 1:SS loop
    for i in 2:NOP loop
      u[k, i - 1] = u[k, i];
    end for;
  end for;
//==========================================================

//================================================
  annotation(
    Icon(graphics = {Rectangle(origin = {-20, 4}, lineColor = {238, 79, 0}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 0.75, extent = {{-18, 42}, {18, -42}}), Text(origin = {-19, 1}, rotation = -90, lineColor = {170, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{25, 15}, {-25, -15}}, textString = "Bed")}));
end MultiBedOCCHeck;