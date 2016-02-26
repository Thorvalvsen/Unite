model U001
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  Modelica.Fluid.Machines.PrescribedPump pump1(N_nominal = 1500, redeclare package Medium = Medium, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(head_nominal = {50, 10}, V_flow_nominal = {0.0002, 0.001})) annotation(Placement(visible = true, transformation(origin = {-100, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Medium, use_HeatTransfer = true, diameter = 0.025, isCircular = true, length = 30, roughness = 0.0001) annotation(Placement(visible = true, transformation(origin = {-56, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1(Gc = 20) annotation(Placement(visible = true, transformation(origin = {-56, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 293) annotation(Placement(visible = true, transformation(origin = {-88, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary boundary(p = 100000, T = 350, nPorts = 1, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {-140, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary fixedboundary1(p = 100000, nPorts = 1, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {2, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(allowFlowReversal = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, m_flow_start = 0.0001, m_flow_small = 0.00001, p_start = 100000, T_start = 350) annotation(Placement(visible = true, transformation(origin = {-156, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedtemperature1.port, convection1.fluid) annotation(Line(points = {{-78, 60}, {-56, 60}, {-56, 44}, {-56, 44}}, color = {191, 0, 0}));
  connect(pipe.heatPorts[1], convection1.solid) annotation(Line(points = {{-56, 6}, {-56, 6}, {-56, 24}, {-56, 24}}, color = {127, 0, 0}));
  connect(pipe.port_b, fixedboundary1.ports[1]) annotation(Line(points = {{-46, 2}, {-8, 2}}, color = {0, 127, 255}));
  connect(pump1.port_b, pipe.port_a) annotation(Line(points = {{-90, 2}, {-66, 2}, {-66, 2}, {-66, 2}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pump1.port_a) annotation(Line(points = {{-130, 2}, {-110, 2}, {-110, 2}, {-110, 2}}, color = {0, 127, 255}));
  annotation(Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end U001;