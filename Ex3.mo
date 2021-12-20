within OxygenPSA;

model Ex3
  OxygenPSA.SingleBed singleBed annotation(
    Placement(visible = true, transformation(origin = {42, 4}, extent = {{-46, -46}, {46, 46}}, rotation = 0)));
  OxygenPSA.SingleBed singleBed1 annotation(
    Placement(visible = true, transformation(origin = {130, 2}, extent = {{-42, -42}, {42, 42}}, rotation = 0)));
  OxygenPSA.MultiPress multiPress annotation(
    Placement(visible = true, transformation(origin = {-16, 60}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  OxygenPSA.Valve valve annotation(
    Placement(visible = true, transformation(origin = {-8, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Valve valve1 annotation(
    Placement(visible = true, transformation(origin = {72, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = step1.active) annotation(
    Placement(visible = true, transformation(origin = {-36, 3}, extent = {{-24, -11}, {24, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = step3.active) annotation(
    Placement(visible = true, transformation(origin = {44, 77}, extent = {{-24, -11}, {24, 11}}, rotation = 0)));
  OxygenPSA.MultiSource multiSource annotation(
    Placement(visible = true, transformation(origin = {-17, -35}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  OxygenPSA.Valve valve2 annotation(
    Placement(visible = true, transformation(origin = {12, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Valve valve3 annotation(
    Placement(visible = true, transformation(origin = {72, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = step2.active) annotation(
    Placement(visible = true, transformation(origin = {-26, -89}, extent = {{-24, -11}, {24, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y = step4.active) annotation(
    Placement(visible = true, transformation(origin = {40, -93}, extent = {{-24, -11}, {24, 11}}, rotation = 0)));
  OxygenPSA.MultiBlowDown multiBlowDown annotation(
    Placement(visible = true, transformation(origin = {164, -70}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  OxygenPSA.Valve valve4 annotation(
    Placement(visible = true, transformation(origin = {72, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Valve valve5 annotation(
    Placement(visible = true, transformation(origin = {150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression4(y = step1.active or step2.active) annotation(
    Placement(visible = true, transformation(origin = {230, -52}, extent = {{52, -14}, {-52, 14}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression5(y = step3.active or step4.active) annotation(
    Placement(visible = true, transformation(origin = {207, -87}, extent = {{57, -15}, {-57, 15}}, rotation = 0)));
  OxygenPSA.MultiPurge multiPurge annotation(
    Placement(visible = true, transformation(origin = {170, 72}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  OxygenPSA.Valve valve6 annotation(
    Placement(visible = true, transformation(origin = {110, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OxygenPSA.Valve valve7 annotation(
    Placement(visible = true, transformation(origin = {152, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression6(y = step4.active) annotation(
    Placement(visible = true, transformation(origin = {224, 63}, extent = {{24, -11}, {-24, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression7(y = step2.active) annotation(
    Placement(visible = true, transformation(origin = {224, 29}, extent = {{24, -11}, {-24, 11}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-72, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step3 annotation(
    Placement(visible = true, transformation(origin = {-108, -36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.StateGraph.Transition t1(enableTimer = true, waitTime = 0.00000000) annotation(
    Placement(visible = true, transformation(origin = {-226, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition2(enableTimer = true, waitTime = SingleBed.CycleTime * 0.2) annotation(
    Placement(visible = true, transformation(origin = {-217, -45}, extent = {{15, -15}, {-15, 15}}, rotation = 0)));
  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {-256, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t2(enableTimer = true, waitTime = SingleBed.CycleTime * 0.3) annotation(
    Placement(visible = true, transformation(origin = {-158, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition1(enableTimer = true, waitTime = SingleBed.CycleTime * 0.3) annotation(
    Placement(visible = true, transformation(origin = {-136, -48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step4 annotation(
    Placement(visible = true, transformation(origin = {-182, -46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step1 annotation(
    Placement(visible = true, transformation(origin = {-192, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step2 annotation(
    Placement(visible = true, transformation(origin = {-130, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition(enableTimer = true, waitTime = SingleBed.CycleTime * 0.2) annotation(
    Placement(visible = true, transformation(origin = {-108, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(multiPress.outflows, valve.outflows2) annotation(
    Line(points = {{-22.6, 64.2}, {-24.6, 64.2}, {-24.6, 32.2}, {-16.6, 32.2}}));
  connect(valve.inflows2, singleBed.inflows) annotation(
    Line(points = {{0, 32.2}, {26, 32.2}, {26, 24.2}}));
  connect(multiPress.outflows1, valve1.outflows2) annotation(
    Line(points = {{-7.6, 64.2}, {64.4, 64.2}, {64.4, 34.2}}));
  connect(valve1.inflows2, singleBed1.inflows) annotation(
    Line(points = {{80, 34.2}, {114, 34.2}, {114, 20.2}}));
  connect(booleanExpression1.y, valve.Vcontrol) annotation(
    Line(points = {{-9.6, 3}, {-7.6, 3}, {-7.6, 26}}, color = {255, 0, 255}));
  connect(booleanExpression.y, valve1.Vcontrol) annotation(
    Line(points = {{70.4, 77}, {72.4, 77}, {72.4, 27}}, color = {255, 0, 255}));
  connect(multiSource.outflows1, valve2.outflows2) annotation(
    Line(points = {{-21.08, -41.46}, {-19.08, -41.46}, {-19.08, -55.46}, {4.92, -55.46}}));
  connect(valve2.inflows2, singleBed.inflows1) annotation(
    Line(points = {{20, -55.8}, {26, -55.8}, {26, -9.8}}));
  connect(multiSource.outflows, valve3.outflows2) annotation(
    Line(points = {{-9.86, -41.8}, {64.14, -41.8}, {64.14, -47.8}}));
  connect(valve3.inflows2, singleBed1.inflows1) annotation(
    Line(points = {{80, -47.8}, {114, -47.8}, {114, -11.8}}));
  connect(booleanExpression2.y, valve2.Vcontrol) annotation(
    Line(points = {{0.4, -89}, {12.4, -89}, {12.4, -63}}, color = {255, 0, 255}));
  connect(booleanExpression3.y, valve3.Vcontrol) annotation(
    Line(points = {{66.4, -93}, {72.4, -93}, {72.4, -55}}, color = {255, 0, 255}));
  connect(singleBed.outflows, valve4.outflows2) annotation(
    Line(points = {{39.24, -12.56}, {39.24, -16.56}, {63.24, -16.56}}));
  connect(valve4.inflows2, multiBlowDown.inflows) annotation(
    Line(points = {{80, -15.8}, {98, -15.8}, {98, -60.8}, {155, -60.8}}));
  connect(valve5.inflows2, multiBlowDown.inflows1) annotation(
    Line(points = {{158, -29.8}, {166, -29.8}, {166, -59.8}}));
  connect(singleBed1.outflows, valve5.outflows2) annotation(
    Line(points = {{127.48, -13.12}, {129.48, -13.12}, {129.48, -29.12}, {141.48, -29.12}}));
  connect(booleanExpression4.y, valve5.Vcontrol) annotation(
    Line(points = {{173, -52}, {149.6, -52}, {149.6, -37}}, color = {255, 0, 255}));
  connect(booleanExpression5.y, valve4.Vcontrol) annotation(
    Line(points = {{144, -87}, {91.6, -87}, {91.6, -23}, {71.6, -23}}, color = {255, 0, 255}));
  connect(multiPurge.outflows1, valve7.inflows2) annotation(
    Line(points = {{177.28, 76.16}, {177.28, 44.16}, {160.28, 44.16}}));
  connect(valve7.outflows2, singleBed1.inflows2) annotation(
    Line(points = {{144.4, 44.2}, {128.4, 44.2}, {128.4, 22.2}}));
  connect(multiPurge.outflows, valve6.inflows2) annotation(
    Line(points = {{162.72, 76.16}, {127.72, 76.16}, {127.72, 64.16}, {117.72, 64.16}}));
  connect(valve6.outflows2, singleBed.inflows2) annotation(
    Line(points = {{102.4, 64.2}, {88.4, 64.2}, {88.4, 48.2}, {40.4, 48.2}, {40.4, 26.2}}));
  connect(booleanExpression6.y, valve6.Vcontrol) annotation(
    Line(points = {{197.6, 63}, {135.6, 63}, {135.6, 57}, {109.6, 57}}, color = {255, 0, 255}));
  connect(booleanExpression7.y, valve7.Vcontrol) annotation(
    Line(points = {{197.6, 29}, {151.6, 29}, {151.6, 37}}, color = {255, 0, 255}));
  connect(step2.outPort[1], transition.inPort) annotation(
    Line(points = {{-120, 48}, {-108, 48}, {-108, 6}}));
  connect(step1.outPort[1], t2.inPort) annotation(
    Line(points = {{-182, 48}, {-162, 48}}));
  connect(transition1.outPort, step4.inPort[1]) annotation(
    Line(points = {{-137.5, -48}, {-155.25, -48}, {-155.25, -46}, {-171, -46}}));
  connect(transition.outPort, step3.inPort[1]) annotation(
    Line(points = {{-108, 0.5}, {-108, -24}}));
  connect(step3.outPort[1], transition1.inPort) annotation(
    Line(points = {{-108, -46}, {-114, -46}, {-114, -48}, {-132, -48}}));
  connect(t1.outPort, step1.inPort[1]) annotation(
    Line(points = {{-224, 48}, {-202, 48}}));
  connect(t2.outPort, step2.inPort[1]) annotation(
    Line(points = {{-156, 48}, {-141, 48}}));
  connect(transition2.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{-219, -45}, {-274, -45}, {-274, 48}, {-266, 48}}));
  connect(step4.outPort[1], transition2.inPort) annotation(
    Line(points = {{-192.5, -46}, {-200, -46}, {-200, -45}, {-211, -45}}));
  connect(initialStep.outPort[1], t1.inPort) annotation(
    Line(points = {{-246, 48}, {-230, 48}}));
end Ex3;