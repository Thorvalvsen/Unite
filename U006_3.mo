model U006
  replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase constrainedby PartialMedium;
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = 410) annotation(Placement(visible = true, transformation(origin = {-82, 58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(Placement(visible = true, transformation(origin = {-114, 58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedtemperature1 annotation(Placement(visible = true, transformation(origin = {-146, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 2570) annotation(Placement(visible = true, transformation(origin = {-146, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 5, freqHz = 1.157e-5, phase = -1.57, offset = 303) annotation(Placement(visible = true, transformation(origin = {-180, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(Placement(visible = true, transformation(origin = {-180, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = Medium, nPorts = 2, use_portsData = false, use_HeatTransfer = true, level(start = 5, fixed = true), height = 10, crossArea = 30) annotation(Placement(visible = true, transformation(origin = {-48, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(m_flow = 1, T = 290, nPorts = 1, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {-12, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, length = 100, diameter = 0.06, height_ab = -10) annotation(Placement(visible = true, transformation(origin = {-12, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valvelinear1(redeclare package Medium = Medium, dp_nominal = 140000, m_flow_nominal = 1) annotation(Placement(visible = true, transformation(origin = {34, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary fixedboundary1(redeclare package Medium = Medium, nPorts = 1) annotation(Placement(visible = true, transformation(origin = {80, 26}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(visible = true, transformation(origin = {-12, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(constant1.y, valvelinear1.opening) annotation(Line(points = {{-1, 52}, {34, 52}, {34, 34}}, color = {0, 0, 127}));
  connect(valvelinear1.port_b, fixedboundary1.ports[1]) annotation(Line(points = {{44, 26}, {70, 26}, {70, 26}, {70, 26}}, color = {0, 127, 255}));
  connect(pipe.port_b, valvelinear1.port_a) annotation(Line(points = {{-2, 26}, {24, 26}, {24, 26}, {24, 26}}, color = {0, 127, 255}));
  connect(tank.ports[2], pipe.port_a) annotation(Line(points = {{-48, 48}, {-48, 48}, {-48, 26}, {-22, 26}, {-22, 26}}, color = {0, 127, 255}));
  connect(boundary.ports[1], tank.ports[1]) annotation(Line(points = {{-22, 76}, {-46, 76}, {-46, 48}}, color = {0, 127, 255}));
  connect(tank.heatPort, thermalconductor1.port_a) annotation(Line(points = {{-58, 58}, {-72, 58}, {-72, 58}, {-72, 58}}, color = {191, 0, 0}));
  connect(sine1.y, prescribedtemperature1.T) annotation(Line(points = {{-169, 58}, {-158, 58}, {-158, 58}, {-158, 58}}, color = {0, 0, 127}));
  connect(const.y, convection1.Gc) annotation(Line(points = {{-135, 86}, {-114, 86}, {-114, 70}, {-114, 70}}, color = {0, 0, 127}));
  connect(prescribedtemperature1.port, convection1.fluid) annotation(Line(points = {{-136, 58}, {-124, 58}}, color = {191, 0, 0}));
  connect(convection1.solid, thermalconductor1.port_b) annotation(Line(points = {{-104, 58}, {-92, 58}}, color = {191, 0, 0}));
  annotation(Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end U006;