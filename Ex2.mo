within OxygenPSA;

model Ex2
  Modelica.StateGraph.Transition t1(enableTimer = true, waitTime = 0.00000000) annotation(
    Placement(visible = true, transformation(origin = {-240, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {-270, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t2(enableTimer = true, waitTime = SingleBed.CycleTime * 0.3) annotation(
    Placement(visible = true, transformation(origin = {-172, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = step1.active) annotation(
    Placement(visible = true, transformation(origin = {-69, 3}, extent = {{-23, -11}, {23, 11}}, rotation = 0)));
  Modelica.StateGraph.Step step1 annotation(
    Placement(visible = true, transformation(origin = {-206, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-12, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Valve valve annotation(
    Placement(visible = true, transformation(origin = {-50, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t3(enableTimer = true, waitTime = SingleBed.CycleTime * 0.2) annotation(
    Placement(visible = true, transformation(origin = {-126, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  OxygenPSA.Pressurization pressurization annotation(
    Placement(visible = true, transformation(origin = {-81, 69}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  Modelica.StateGraph.Step step2 annotation(
    Placement(visible = true, transformation(origin = {-144, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.SourceAir sourceAir annotation(
    Placement(visible = true, transformation(origin = {-78, -26}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  OxygenPSA.Valve valve1 annotation(
    Placement(visible = true, transformation(origin = {-26, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = step2.active) annotation(
    Placement(visible = true, transformation(origin = {-66, -77}, extent = {{-24, -11}, {24, 11}}, rotation = 0)));
  OxygenPSA.Valve valve2 annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Blowdown blowdown annotation(
    Placement(visible = true, transformation(origin = {69, -55}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Modelica.StateGraph.Step step3 annotation(
    Placement(visible = true, transformation(origin = {-126, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.StateGraph.Transition t4(enableTimer = true, waitTime = SingleBed.CycleTime * 0.3) annotation(
    Placement(visible = true, transformation(origin = {-150, -44}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = step3.active or step4.active) annotation(
    Placement(visible = true, transformation(origin = {8, -73}, extent = {{-24, -11}, {24, 11}}, rotation = 0)));
  OxygenPSA.Valve valve3 annotation(
    Placement(visible = true, transformation(origin = {42, 66}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OxygenPSA.SingleSink singleSink annotation(
    Placement(visible = true, transformation(origin = {71, 73}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y = step4.active) annotation(
    Placement(visible = true, transformation(origin = {64, 9}, extent = {{24, -11}, {-24, 11}}, rotation = 0)));
  Modelica.StateGraph.Step step4 annotation(
    Placement(visible = true, transformation(origin = {-192, -44}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t5(enableTimer = true, waitTime = SingleBed.CycleTime * 0.2) annotation(
    Placement(visible = true, transformation(origin = {-235, -45}, extent = {{15, -15}, {-15, 15}}, rotation = 0)));
  //  OxygenPSA.SingleBed singleBed annotation(
  //    Placement(visible = true, transformation(origin = {361, -21}, extent = {{-29, -29}, {29, 29}}, rotation = 0)));
  OxygenPSA.SingleBed singleBed annotation(
    Placement(visible = true, transformation(origin = {4, 12}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
equation
  connect(t2.outPort, step2.inPort[1]) annotation(
    Line(points = {{-170.5, 48}, {-155.5, 48}}));
  connect(initialStep.outPort[1], t1.inPort) annotation(
    Line(points = {{-259.5, 48}, {-243.5, 48}}));
  connect(step1.outPort[1], t2.inPort) annotation(
    Line(points = {{-195.5, 48}, {-175.5, 48}}));
  connect(pressurization.outflows, valve.outflows2) annotation(
    Line(points = {{-88, 73}, {-88, 42.84}, {-58, 42.84}, {-58, 44}}));
  connect(t1.outPort, step1.inPort[1]) annotation(
    Line(points = {{-238.5, 48}, {-216.5, 48}}));
  connect(booleanExpression.y, valve.Vcontrol) annotation(
    Line(points = {{-44, 3}, {-44, 17}, {-50, 17}, {-50, 37}}, color = {255, 0, 255}));
  connect(booleanExpression1.y, valve1.Vcontrol) annotation(
    Line(points = {{-40, -77}, {-26, -77}, {-26, -39}}, color = {255, 0, 255}));
  connect(sourceAir.outflows, valve1.outflows2) annotation(
    Line(points = {{-72, -32}, {-72, -34.5}, {-34, -34.5}, {-34, -32}}));
//if Pressurization.outflows.open then
// SingleBed.e * SingleBed.D * (SingleBed.Cin[:] - SingleBed.C[:, 1]) / (2 * SingleBed.dz) = -SingleBed.uin * (SingleBed.Cin[:] - SingleBed.C[:, 1]);
// SingleBed.C[:,SingleBed.NOP] = SingleBed.C[:,SingleBed.NOP-1];
//elseif SourceAir.outflows.open then
// SingleBed.e * SingleBed.D * (SingleBed.C[:,SingleBed.NOP] - SingleBed.C[:, SingleBed.NOP - 1]) / (2 * SingleBed.dz) = -SingleBed.uin * (SingleBed.C[:, SingleBed.NOP] - SingleBed.C[:, SingleBed.NOP - 1]);
// SingleBed.C[:,1] = SingleBed.C[:,2];
//end if;
  connect(valve2.inflows2, blowdown.inflows) annotation(
    Line(points = {{38, -19.8}, {63, -19.8}, {63, -48.8}}));
  connect(t3.outPort, step3.inPort[1]) annotation(
    Line(points = {{-126, 8.5}, {-126, -17}}));
  connect(step3.outPort[1], t4.inPort) annotation(
    Line(points = {{-126, -38.5}, {-128, -38.5}, {-128, -44}, {-146, -44}}));
  connect(booleanExpression2.y, valve2.Vcontrol) annotation(
    Line(points = {{34, -73}, {30.4, -73}, {30.4, -27}}, color = {255, 0, 255}));
  connect(singleSink.outflows, valve3.outflows2) annotation(
    Line(points = {{66, 76}, {71, 76}, {71, 66}, {50, 66}}));
  connect(booleanExpression3.y, valve3.Vcontrol) annotation(
    Line(points = {{38, 9}, {38, 35}, {42, 35}, {42, 59}}, color = {255, 0, 255}));
  connect(t4.outPort, step4.inPort[1]) annotation(
    Line(points = {{-151.5, -44}, {-181, -44}}));
  connect(step4.outPort[1], t5.inPort) annotation(
    Line(points = {{-202.5, -44}, {-214.5, -44}, {-214.5, -45}, {-229, -45}}));
  connect(t5.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{-237, -45}, {-288.25, -45}, {-288.25, 48}, {-280.25, 48}}));
  connect(step2.outPort[1], t3.inPort) annotation(
    Line(points = {{-133.5, 48}, {-126, 48}, {-126, 14}}));
  connect(singleBed.outflows, valve2.outflows2) annotation(
    Line(points = {{2, 0}, {6, 0}, {6, -20}, {22, -20}}));
  connect(valve1.inflows2, singleBed.inflows1) annotation(
    Line(points = {{-18, -32}, {-8, -32}, {-8, 2}}));
  connect(valve.inflows2, singleBed.inflows) annotation(
    Line(points = {{-42, 44}, {-23, 44}, {-23, 26}, {-8, 26}}));
  connect(singleBed.inflows2, valve3.inflows2) annotation(
    Line(points = {{3, 27}, {26, 27}, {26, 66}, {34, 66}}));
  connect(valve.inflows2, singleBed.inflows) annotation(
    Line(points = {{-42, 44}, {-2, 44}}));
  connect(singleBed.inflows2, valve3.inflows2) annotation(
    Line(points = {{2, 32}, {26, 32}, {26, 66}, {34, 66}}));
  connect(valve1.inflows2, singleBed.inflows1) annotation(
    Line(points = {{-22, -22}, {-8, -22}, {-8, 8}}));
  connect(singleBed.outflows, valve2.outflows2) annotation(
    Line(points = {{2, 6}, {6, 6}, {6, -20}, {22, -20}}));
protected
  annotation(
    Diagram(graphics = {Text(origin = {36, 82}, extent = {{-14, 4}, {14, -4}}, textString = "Purge"), Text(origin = {-55, -46}, extent = {{-19, -2}, {19, 2}}, textString = "Production"), Text(origin = {68, -65}, extent = {{-20, 1}, {20, -1}}, textString = "Blowdown"), Text(origin = {-56, 64}, extent = {{-26, 8}, {26, -8}}, textString = "Pressurization"), Text(origin = {-3, 10}, extent = {{-13, 2}, {13, -2}}, textString = "Bed")}));
end Ex2;