within OxygenPSA;

model MultiBlowDown
 Inflows inflows annotation(
    Placement(visible = true, transformation(origin = {-38, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-38, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 OxygenPSA.Inflows inflows1 annotation(
    Placement(visible = true, transformation(origin = {-28, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {8, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

annotation(
    Icon(graphics = {Rectangle(origin = {-15, 12}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-29, 28}, {29, -28}}), Text(origin = {-16, 13}, lineColor = {85, 255, 255}, extent = {{-20, 7}, {20, -7}}, textString = "Blowdown")}));


end MultiBlowDown;