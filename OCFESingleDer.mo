within OxygenPSA;

function OCFESingleDer
extends Modelica.Icons.Function;
  input Integer N;
  input Real z[N];
  input Real L;
    output Real S[N, N];//, t[N, N]; //S - Single Derivative Matrix //t - Double Derivative Matrix
  protected
    parameter Real dz = L/(N-1);
    Real A[N, N];
    Real Adudz[N, N];
    Real d2udz[N, N];
    Real Ainv[N, N];
  algorithm
  for i in 1:N loop
    for j in 1:N loop
      A[i, j] := 1 * z[i] ^ (j - 1);
    end for;
  end for;
  //Inverse of A matrix
  Ainv := Modelica.Math.Matrices.inv(A);
  for i in 1:N loop
    Adudz[i, 1] := 0;
    Adudz[i, 2] := 1;
      for j in 3:N loop
        Adudz[i, j] := (j - 1) * z[i] ^ (j - 2);
      end for;
  end for;
  for i in 1:N loop
    d2udz[i, 1] := 0;
    d2udz[i, 2] := 0;
    d2udz[i, 3] := 2;
    for j in 4:N loop
       d2udz[i, j] := (j - 1) * (j - 2) * z[i] ^ (j - 3);
    end for;
  end for;
  //Single derivtive matrix
  S := Adudz * Ainv;
  //Double Derivative Matrix
//  t := d2udz * Ainv;

end OCFESingleDer;