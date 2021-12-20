within OxygenPSA;

model Ex1
  OxygenPSA.Pressurization pressurization annotation(
    Placement(visible = true, transformation(origin = {-59, 43}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  OxygenPSA.SingleBed singleBed annotation(
    Placement(visible = true, transformation(origin = {33, 5}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
  Valve valve annotation(
    Placement(visible = true, transformation(origin = {-26, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step1 annotation(
    Placement(visible = true, transformation(origin = {-192, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t1 annotation(
    Placement(visible = true, transformation(origin = {-226, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-42, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition t2(enableTimer = true, waitTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-158, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = step1.active) annotation(
    Placement(visible = true, transformation(origin = {-88, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {-256, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step annotation(
    Placement(visible = true, transformation(origin = {-118, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition(enableTimer = true, waitTime = 1000) annotation(
    Placement(visible = true, transformation(origin = {-122, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pressurization.outflows, valve.outflows2) annotation(
    Line(points = {{-66, 48}, {-66, 2}, {-34, 2}}));
  connect(valve.inflows2, singleBed.inflows) annotation(
    Line(points = {{-18, 2}, {4, 2}, {4, -4}, {24, -4}}));
  connect(booleanExpression.y, valve.Vcontrol) annotation(
    Line(points = {{-76, -44}, {-26, -44}, {-26, -4}}, color = {255, 0, 255}));
  connect(initialStep.outPort[1], t1.inPort) annotation(
    Line(points = {{-246, 48}, {-230, 48}}));
  connect(t1.outPort, step1.inPort[1]) annotation(
    Line(points = {{-224, 48}, {-202, 48}}));
  connect(step1.outPort[1], t2.inPort) annotation(
    Line(points = {{-182, 48}, {-162, 48}}));
  connect(t2.outPort, step.inPort[1]) annotation(
    Line(points = {{-156, 48}, {-138, 48}, {-138, 46}, {-128, 46}}));
  connect(step.outPort[1], transition.inPort) annotation(
    Line(points = {{-108, 46}, {-94, 46}, {-94, 20}, {-144, 20}, {-144, -2}, {-126, -2}}));
  connect(transition.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{-120, -2}, {-106, -2}, {-106, -24}, {-274, -24}, {-274, 48}, {-266, 48}}));
end Ex1;