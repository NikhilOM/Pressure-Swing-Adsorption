within OxygenPSA;

model Ex5MultiBedOC
  Valve valve1 annotation(
    Placement(visible = true, transformation(origin = {166, -24}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.StateGraph.Transition transition(enableTimer = true, waitTime = 249) annotation(
    Placement(visible = true, transformation(origin = {-236, -38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t7(enableTimer = true, waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-188, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  OxygenAdsorber.MultiCylinderOxygen.Sink sink annotation(
    Placement(visible = true, transformation(origin = {166, 72}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression5(y = step3.active or step4.active) annotation(
    Placement(visible = true, transformation(origin = {126, -17}, extent = {{-6, -7}, {6, 7}}, rotation = 0)));
  Modelica.StateGraph.Transition t14(enableTimer = true, waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Valve valve4 annotation(
    Placement(visible = true, transformation(origin = {180, 56}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = step.active or step1.active or step2.active or step7.active) annotation(
    Placement(visible = true, transformation(origin = {188, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step12 annotation(
    Placement(visible = true, transformation(origin = {-22, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.StateGraph.Transition t9(enableTimer = true, waitTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-250, 8}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  OxygenAdsorber.MultiCylinderOxygen.Pressurization pressurization annotation(
    Placement(visible = true, transformation(origin = {77, 63}, extent = {{-37, -37}, {37, 37}}, rotation = 0)));
  Modelica.StateGraph.Step step7 annotation(
    Placement(visible = true, transformation(origin = {-28, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y = step8.active) annotation(
    Placement(visible = true, transformation(origin = {232, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OxygenAdsorber.MultiCylinderOxygen.Blowdown blowdown1 annotation(
    Placement(visible = true, transformation(origin = {229, -23}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression7(y = step5.active) annotation(
    Placement(visible = true, transformation(origin = {122, 78}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  OxygenAdsorber.Valve valve2 annotation(
    Placement(visible = true, transformation(origin = {136, -8}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.StateGraph.Transition t12(enableTimer = true, waitTime = 249) annotation(
    Placement(visible = true, transformation(origin = {42, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = step.active) annotation(
    Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = step2.active) annotation(
    Placement(visible = true, transformation(origin = {80, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step4 annotation(
    Placement(visible = true, transformation(origin = {-120, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.StateGraph.Transition t4(enableTimer = true, waitTime = 99) annotation(
    Placement(visible = true, transformation(origin = {-106, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.StateGraph.Transition t6(enableTimer = true, waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-92, -38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OxygenAdsorber.MultiCylinderOxygen.SourceAir sourceAir annotation(
    Placement(visible = true, transformation(origin = {146, -52}, extent = {{-32, 32}, {32, -32}}, rotation = 0)));
  Modelica.StateGraph.Step step9 annotation(
    Placement(visible = true, transformation(origin = {42, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression6(y = step3.active) annotation(
    Placement(visible = true, transformation(origin = {146, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenAdsorber.Valve valve3 annotation(
    Placement(visible = true, transformation(origin = {200, -8}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.StateGraph.Transition t2(enableTimer = true, waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-154, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t8(enableTimer = true, waitTime = 249) annotation(
    Placement(visible = true, transformation(origin = {-140, -38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step8 annotation(
    Placement(visible = true, transformation(origin = {16, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.StateGraph.Step step3 annotation(
    Placement(visible = true, transformation(origin = {-74, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  OxygenAdsorber.Valve valve6 annotation(
    Placement(visible = true, transformation(origin = {88, 44}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  OxygenAdsorber.Valve valve7 annotation(
    Placement(visible = true, transformation(origin = {158, 32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  OxygenAdsorber.Valve valve annotation(
    Placement(visible = true, transformation(origin = {122, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OxygenAdsorber.MultiCylinderOxygen.Blowdown blowdown annotation(
    Placement(visible = true, transformation(origin = {154, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Valve valve5 annotation(
    Placement(visible = true, transformation(origin = {136, 56}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.StateGraph.Step step6 annotation(
    Placement(visible = true, transformation(origin = {-216, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.StateGraph.Step step annotation(
    Placement(visible = true, transformation(origin = {-182, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t13(enableTimer = true, waitTime = 99) annotation(
    Placement(visible = true, transformation(origin = {-48, -38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step1 annotation(
    Placement(visible = true, transformation(origin = {-132, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step10 annotation(
    Placement(visible = true, transformation(origin = {28, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-48, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step11 annotation(
    Placement(visible = true, transformation(origin = {-250, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.StateGraph.Transition t10(enableTimer = true, waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-54, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.StateGraph.Transition t1(enableTimer = true, waitTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-210, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression4(y = step10.active) annotation(
    Placement(visible = true, transformation(origin = {152, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t11(enableTimer = true, waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {36, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.StateGraph.Step step2 annotation(
    Placement(visible = true, transformation(origin = {-78, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {-238, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t5(enableTimer = true, waitTime = 149) annotation(
    Placement(visible = true, transformation(origin = {-8, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.StateGraph.Step step5 annotation(
    Placement(visible = true, transformation(origin = {-168, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  OxygenAdsorber.MultiBedOCCHeck multiBedOCCHeck annotation(
    Placement(visible = true, transformation(origin = {126, 10}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  OxygenAdsorber.MultiBedOCCHeck multiBedOCCHeck1 annotation(
    Placement(visible = true, transformation(origin = {188, 12}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
equation
  connect(booleanExpression.y, valve6.Vcontrol) annotation(
    Line(points = {{91, 20}, {88, 20}, {88, 39}}, color = {255, 0, 255}));
  connect(sourceAir.outflows, valve1.outflows2) annotation(
    Line(points = {{159, -39}, {159, -30.5}, {160, -30.5}, {160, -24}}));
  connect(t9.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{-250, 10}, {-250, 38}, {-248, 38}}));
  connect(booleanExpression3.y, valve4.Vcontrol) annotation(
    Line(points = {{221, 70}, {195.5, 70}, {195.5, 50}, {180, 50}}, color = {255, 0, 255}));
  connect(t14.outPort, step12.inPort[1]) annotation(
    Line(points = {{8, -38}, {-10, -38}}));
  connect(t6.outPort, step4.inPort[1]) annotation(
    Line(points = {{-93.5, -38}, {-109, -38}}));
  connect(valve2.inflows2, blowdown.inflows) annotation(
    Line(points = {{142, -8}, {147, -8}, {147, -12}, {146, -12}}));
  connect(booleanExpression7.y, valve5.Vcontrol) annotation(
    Line(points = {{122, 67}, {122, 58.5}, {136, 58.5}, {136, 50}}, color = {255, 0, 255}));
  connect(pressurization.outflows, valve6.outflows2) annotation(
    Line(points = {{69, 68}, {69, 44}, {82, 44}}));
  connect(booleanExpression2.y, valve.Vcontrol) annotation(
    Line(points = {{91, -52}, {122, -52}, {122, -37}}, color = {255, 0, 255}));
  connect(transition.outPort, step11.inPort[1]) annotation(
    Line(points = {{-237.5, -38}, {-250, -38}, {-250, -28}}));
  connect(step.outPort[1], t2.inPort) annotation(
    Line(points = {{-171.5, 38}, {-158, 38}}));
  connect(t7.outPort, step6.inPort[1]) annotation(
    Line(points = {{-189.5, -38}, {-205, -38}}));
  connect(t12.outPort, step10.inPort[1]) annotation(
    Line(points = {{42, -14}, {42, -38}, {39, -38}}));
  connect(pressurization.outflows1, valve7.outflows2) annotation(
    Line(points = {{87, 68}, {110, 68}, {110, 32}, {152, 32}}));
  connect(step5.outPort[1], t7.inPort) annotation(
    Line(points = {{-178.5, -38}, {-184, -38}}));
  connect(step7.outPort[1], t5.inPort) annotation(
    Line(points = {{-18, 38}, {-12, 38}}));
  connect(step4.outPort[1], t8.inPort) annotation(
    Line(points = {{-130.5, -38}, {-136, -38}}));
  connect(sink.outflows, valve5.outflows2) annotation(
    Line(points = {{159, 76}, {159, 56}, {142, 56}}));
  connect(step1.outPort[1], t4.inPort) annotation(
    Line(points = {{-121.5, 38}, {-110, 38}}));
  connect(t11.outPort, step9.inPort[1]) annotation(
    Line(points = {{38, 38}, {42, 38}, {42, 21}}));
  connect(t10.outPort, step7.inPort[1]) annotation(
    Line(points = {{-52, 38}, {-38, 38}}));
  connect(valve3.inflows2, blowdown1.inflows) annotation(
    Line(points = {{206, -8}, {220, -8}, {220, -14}}));
  connect(initialStep.outPort[1], t1.inPort) annotation(
    Line(points = {{-227.5, 38}, {-214, 38}}));
  connect(t5.outPort, step8.inPort[1]) annotation(
    Line(points = {{-6, 38}, {5, 38}}));
  connect(step8.outPort[1], t11.inPort) annotation(
    Line(points = {{26.5, 38}, {32, 38}}));
  connect(t1.outPort, step.inPort[1]) annotation(
    Line(points = {{-208.5, 38}, {-193, 38}}));
  connect(step10.outPort[1], t14.inPort) annotation(
    Line(points = {{18, -38}, {14, -38}}));
  connect(step9.outPort[1], t12.inPort) annotation(
    Line(points = {{42, 0}, {42, -8}}));
  connect(booleanExpression4.y, valve7.Vcontrol) annotation(
    Line(points = {{163, 12}, {158.5, 12}, {158.5, 27}, {158, 27}}, color = {255, 0, 255}));
  connect(booleanExpression1.y, valve3.Vcontrol) annotation(
    Line(points = {{200, -54}, {200, -13}}, color = {255, 0, 255}));
  connect(step6.outPort[1], transition.inPort) annotation(
    Line(points = {{-226.5, -38}, {-232, -38}}));
  connect(booleanExpression6.y, valve1.Vcontrol) annotation(
    Line(points = {{157, -88}, {166, -88}, {166, -30}}, color = {255, 0, 255}));
  connect(step12.outPort[1], t13.inPort) annotation(
    Line(points = {{-32, -38}, {-44, -38}}));
  connect(t4.outPort, step2.inPort[1]) annotation(
    Line(points = {{-104.5, 38}, {-89, 38}}));
  connect(t8.outPort, step5.inPort[1]) annotation(
    Line(points = {{-141.5, -38}, {-157, -38}}));
  connect(t2.outPort, step1.inPort[1]) annotation(
    Line(points = {{-152.5, 38}, {-143, 38}}));
  connect(step3.outPort[1], t6.inPort) annotation(
    Line(points = {{-84.5, -38}, {-88, -38}}));
  connect(t13.outPort, step3.inPort[1]) annotation(
    Line(points = {{-49.5, -38}, {-63, -38}}));
  connect(sink.outflows1, valve4.outflows2) annotation(
    Line(points = {{174, 76}, {166, 76}, {166, 56}, {174, 56}}));
  connect(step2.outPort[1], t10.inPort) annotation(
    Line(points = {{-68, 38}, {-58, 38}}));
  connect(sourceAir.outflows1, valve.outflows2) annotation(
    Line(points = {{138, -40}, {138, -30}, {130, -30}}));
  connect(step11.outPort[1], t9.inPort) annotation(
    Line(points = {{-250, -8}, {-250, 4}}));
  connect(multiBedOCCHeck.outflows, valve2.outflows2) annotation(
    Line(points = {{125, -2}, {130, -2}, {130, -8}}));
  connect(valve.inflows2, multiBedOCCHeck.inflows) annotation(
    Line(points = {{114, -30}, {114, -8.5}, {117, -8.5}, {117, -1}}));
  connect(valve6.inflows2, multiBedOCCHeck.inflows1) annotation(
    Line(points = {{94, 44}, {106, 44}, {106, 22}, {118, 22}}));
  connect(multiBedOCCHeck.inflows2, valve5.inflows2) annotation(
    Line(points = {{126, 22}, {126, 37}, {130, 37}, {130, 56}}));
  connect(multiBedOCCHeck1.outflows, valve3.outflows2) annotation(
    Line(points = {{187, 0}, {187, -6.5}, {194, -6.5}, {194, -8}}));
  connect(valve1.inflows2, multiBedOCCHeck1.inflows) annotation(
    Line(points = {{172, -24}, {179, -24}, {179, 1}}));
  connect(valve7.inflows2, multiBedOCCHeck1.inflows1) annotation(
    Line(points = {{164, 32}, {180, 32}, {180, 24}}));
  connect(valve4.inflows2, multiBedOCCHeck1.inflows2) annotation(
    Line(points = {{186, 56}, {196, 56}, {196, 24}, {188, 24}}));
  connect(booleanExpression5.y, valve2.Vcontrol) annotation(
    Line(points = {{132, -16}, {136, -16}, {136, -13}}, color = {255, 0, 255}));
  annotation(
    Diagram);
end Ex5MultiBedOC;