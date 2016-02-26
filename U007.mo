model U007
  replaceable package Medium = Modelica.Media.Air.SimpleAir;
  inner Modelica.Fluid.System system annotation(Placement(visible = true, transformation(origin = {-180, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(nPorts = 3, use_portsData = false, V = 3, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {-116, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {-90, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.OnOffController onoffcontroller1(bandwidth = 500) annotation(Placement(visible = true, transformation(origin = {-50, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(m_flow = 0.02, nPorts = 1, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {-142, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 102800) annotation(Placement(visible = true, transformation(origin = {-144, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_pt1(p = 100800, nPorts = 1, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {132, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe(length = 30, diameter = 0.05, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {96, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete valvediscrete1(dp_nominal = 451, m_flow_nominal = 0.02, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {64, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.MathBoolean.OnDelay ondelay1(delayTime = 1.7) annotation(Placement(visible = true, transformation(origin = {48, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Not not1 annotation(Placement(visible = true, transformation(origin = {16, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.MathBoolean.OnDelay ondelay2(delayTime = 1.7) annotation(Placement(visible = true, transformation(origin = {-16, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(onoffcontroller1.y, ondelay2.u) annotation(Line(points = {{-39, 62}, {-32, 62}, {-32, 62}, {-32, 62}}, color = {255, 0, 255}));
  connect(ondelay2.y, not1.u) annotation(Line(points = {{-4, 62}, {4, 62}}, color = {255, 0, 255}));
  connect(not1.y, ondelay1.u) annotation(Line(points = {{27, 62}, {34, 62}}, color = {255, 0, 255}));
  connect(ondelay1.y, valvediscrete1.open) annotation(Line(points = {{60, 62}, {64, 62}, {64, 24}}, color = {255, 0, 255}));
  connect(volume.ports[2], valvediscrete1.port_a) annotation(Line(points = {{-116, 40}, {-104, 40}, {-104, 16}, {54, 16}}, color = {0, 127, 255}));
  connect(pipe.port_a, valvediscrete1.port_b) annotation(Line(points = {{86, 16}, {74, 16}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary_pt1.ports[1]) annotation(Line(points = {{106, 16}, {122, 16}}, color = {0, 127, 255}));
  connect(const.y, onoffcontroller1.reference) annotation(Line(points = {{-133, 68}, {-62, 68}}, color = {0, 0, 127}));
  connect(boundary.ports[1], volume.ports[1]) annotation(Line(points = {{-132, 16}, {-116, 16}, {-116, 40}}, color = {0, 127, 255}));
  connect(pressure1.p, onoffcontroller1.u) annotation(Line(points = {{-79, 56}, {-62, 56}}, color = {0, 0, 127}));
  connect(volume.ports[3], pressure1.port) annotation(Line(points = {{-116, 40}, {-90, 40}, {-90, 46}}, color = {0, 127, 255}));
  annotation(Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end U007;