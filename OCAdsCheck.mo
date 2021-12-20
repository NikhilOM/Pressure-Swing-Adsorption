within OxygenPSA;

model OCAdsCheck
 parameter Real dz = L / (NOP - 1), L = 1;
  parameter Integer NOC = 2, NOP = 5,SS=3;
  Real C[SS,NOC, NOP](each min =0,each start = 0), Y[SS,NOC, NOP](each min = 0, each max =1, each start = 0), CT[SS,NOP];
  Real q[SS,NOC, NOP], qeq[SS,NOC, NOP];
  Real p[SS,NOC, NOP], b[SS,NOC, NOP];
  
parameter Real S1[5,5] = OCFESingleDer(N=5, z=P1[:],L=L);
parameter Real t1[5,5] = OCFEDoubleDer(N=5, z=P1[:],L=L);
parameter Real S2[5,5] = OCFESingleDer(N=5, z=P2[:],L=L);
parameter Real t2[5,5] = OCFEDoubleDer(N=5, z=P2[:],L=L);
parameter Real S3[5,5] = OCFESingleDer(N=5,z=P3[:],L=L);
parameter Real t3[5,5] = OCFEDoubleDer(N=5, z=P3[:],L=L);
parameter Real P1[5] = {0,0.03381,0.15,0.26619,0.3};//linspace(0,0.3,5);//
parameter Real P2[5] = {0.3,0.34508,0.5,0.65492,0.7};//linspace(0.3,0.7,5);//
parameter Real P3[5] = {0.7,0.73381,0.85,0.96619,1};//linspace(0.7,1,5);//

  parameter Real R = 8.3144, Tg = 373;

  // Langmuir Parameter
  parameter Real e = 0.52, rhoP = 911, b0[NOC] = {1.557e-11, 4.96e-10}, Kl[NOC] = {0.174, 0.2855}, D = 4.72e-3, qm[NOC] = {7.90, 14.0};
 
  Real u[SS,NOP], P[SS,NOP];
    

  Real Cin[NOC], Pin, /*CinFinal[NOC],*/ uin;
initial equation
//for k in 1:SS loop
//  for i in 1:NOC loop
//    C[k,i, 1] = 0;
//    C[k,i, NOP] = 0;
//  end for;
//end for;
equation
C[1,:,5] = C[2,:,1];
C[2,:,5] = C[3,:,1];
 /* inflows.C[:]*/{180,1} = Cin[:];
  inflows.P = Pin;
  inflows.U = uin;

//  CinFinal[:] = {190.03, 50.52, 0.9622, 0, 0};

for k in 1:SS loop
  for i in 1:NOP loop
  P[k,i] = sum(p[:,:,i]);
    for j in 1:NOC loop     
//    P[k,i] = p[k,:,1]+p[k,:,2]+p[k,:,3];//sum(p[k,:,i]);//p[1, i] + p[2, i];
    p[k,j, i] = Y[k,j, i] .* P[k,i];
    C[k,j, i] = p[k,j, i] / (R * Tg);
     end for;
   end for;
 end for;   

//Langmuir Model
for j in 1:SS loop
  for i in 1:NOP loop
    b[j,:,i] = b0[:];
    der(q[j,:, i]) = Kl[:] .* (qeq[j,:, i] - q[j,:, i]);
//.*exp(-E[:]/(R*Tg));
end for;
  end for;
// for k in 1:SS loop
  for i in 1:NOP loop
    for j in 1:NOC loop
//    // Langmuir Model
      qeq[:,j, i] = qm[j] .* b[:,j, i] .* p[:,j, i] ./ (1 + sum(b[:,j, i] .* p[:,j, i]));
    end for;
  end for;
//end for;
//Component Balance
//  C[:, 1] = Cin[:];
e*D*(Cin[:]-C[1,:,1])/(2*dz) = -uin*(Cin[:]-C[1,:,1]);
//e*D*(C[:,1]-Cin[:])/(2*dz) = -uin*(C[:,1]-Cin[:]);

  for j in 1:NOC loop
    for i in 2:4 loop
//      (-D * ((C[j, i + 1] - 2 * C[j, i] + C[j, i - 1]) / dz ^ 2)) + u[i] * ((C[j, i + 1] - C[j, i - 1]) / (2 * dz)) + C[j, i] * ((u[i + 1] - u[i - 1]) / (2 * dz)) + rhoP * ((1 - e) / e * der(q[j, i])) + der(C[j, i]) = 0;
-D*(t1[i,:]*C[1,j,:]) + u[1,i]*(S1[i,:]*C[1,j,:]) +C[1,j,i]*(S1[i,:]*u[1,:]) + rhoP * ((1 - e) / e * der(q[1,j, i])) + der(C[1,j, i]) = 0;
//bar
    end for;
  end for;
  
    for j in 1:NOC loop
    for i in 2:4 loop
-D*(t2[i,:]*C[2,j,:]) + u[2,i]*(S2[i,:]*C[2,j,:]) +C[2,j,i]*(S2[i,:]*u[2,:]) + rhoP * ((1 - e) / e * der(q[2,j, i])) + der(C[2,j, i]) = 0;
//bar
    end for;
  end for;
  
    for j in 1:NOC loop
    for i in 2:4 loop
-D*(t3[i,:]*C[3,j,:]) + u[3,i]*(S3[i,:]*C[3,j,:]) +C[3,j,i]*(S3[i,:]*u[3,:]) + rhoP * ((1 - e) / e * der(q[3,j, i])) + der(C[3,j, i]) = 0;
//bar
    end for;
  end for;
  
  for j in 1:NOC loop
(S1[5,:]*C[1,j,:]) = (S2[1,:]*C[2,j,:]);
(S2[5,:]*C[2,j,:]) = (S3[1,:]*C[3,j,:]);  
  end for;
  
  for i in 1:NOC loop
//    C[i, NOP] - C[i, NOP - 1] = 0;
e*D*(C[3,i,NOP]-C[3,i,NOP-1])/(2*dz) = -uin*(C[3,i,NOP]-C[3,i,NOP-1]);

//// C[i,1] = Cin[i];
//sum(C[i,:]) = CT[1];
  end for;
//Overall Balance
for k in 1:SS loop
  for j in 1:NOP loop
//for i in 1: NOC loop
    CT[k,j] = sum(C[k,:, j]);
  end for;
end for;  

  u[1,1] = uin;
  u[2,1] = uin;
  u[3,1] =uin;
//u[NOP]-u[NOP-1] = 0;
for k in 1:SS loop
  for i in 2:NOP loop
    u[k,i - 1] = u[k,i];
  end for;
 end for; 
  annotation(
    Icon(graphics = {Rectangle(origin = {-20, 4}, extent = {{-18, 42}, {18, -42}})}));



end OCAdsCheck;