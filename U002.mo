model U002
  //  replaceable package Medium = Modelica.Media.Incompressible.Examples.Essotherm650;
  replaceable package Medium = MonHuile;

  package MonHuile
    extends Modelica.Media.Incompressible.TableBased(mediumName = "Essotherm", T_min = 273, T_max = 593, TinK = false, T0 = 273.15, tableDensity = [0, 909; 320, 702], tableHeatCapacity = [0, 1770; 320, 2920], tableConductivity = [0, 0.1302; 320, 0.1079], tableViscosity = [0, 0.5; 320, 0.0001], tableVaporPressure = [160, 3; 320, 5.5e3]);
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end MonHuile;

  inner Modelica.Fluid.System system(m_flow_start = 0.1, m_flow_small = 0.00001, allowFlowReversal = false, T_start = 460) annotation(Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump1(N_nominal = 1500, checkValve = true, redeclare package Medium = Medium, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.0, 0.0003}, head_nominal = {60, 0})) annotation(Placement(visible = true, transformation(origin = {-130, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature2(T = 293) annotation(Placement(visible = true, transformation(origin = {-150, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 6.5) annotation(Placement(visible = true, transformation(origin = {-152, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(Placement(visible = true, transformation(origin = {-112, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe dynamicpipe1(nNodes = 2, length = 15, diameter = 0.015, redeclare package Medium = Medium, use_HeatTransfer = true) annotation(Placement(visible = true, transformation(origin = {-80, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary fixedboundary3(nPorts = 1, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {68, -8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveIncompressible valveincompressible1(CvData = Modelica.Fluid.Types.CvTypes.Kv, Kv = 0.1, redeclare package Medium = Medium, dp_nominal = 100000, m_flow_nominal = 0.01, opening_nominal = 0.5) annotation(Placement(visible = true, transformation(origin = {28, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(nNodes = 2, length = 15, diameter = 0.015, redeclare package Medium = Medium, use_HeatTransfer = true) annotation(Placement(visible = true, transformation(origin = {-18, -8}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(Placement(visible = true, transformation(origin = {-42, -40}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.1) annotation(Placement(visible = true, transformation(origin = {-76, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 293) annotation(Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperaturesensor1 annotation(Placement(visible = true, transformation(origin = {-46, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 380) annotation(Placement(visible = true, transformation(origin = {-48, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PID(yMax = 1, yMin = -1, k = 0.1, Td = 0.1, Ti = 0.5) annotation(Placement(visible = true, transformation(origin = {-6, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 360)));
  Modelica.Blocks.Math.Add add1(k1 = 1, k2 = 0.5) annotation(Placement(visible = true, transformation(origin = {28, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant3(k = 0.5) annotation(Placement(visible = true, transformation(origin = {62, 62}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(T = 455, nPorts = 1, redeclare package Medium = Medium) annotation(Placement(visible = true, transformation(origin = {-168, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[1], pump1.port_a) annotation(Line(points = {{-158, -8}, {-140, -8}, {-140, -8}, {-140, -8}}, color = {0, 127, 255}));
  connect(constant3.y, add1.u1) annotation(Line(points = {{51, 62}, {34, 62}, {34, 44}}, color = {0, 0, 127}));
  connect(PID.y, add1.u2) annotation(Line(points = {{5, 62}, {22, 62}, {22, 44}, {22, 44}}, color = {0, 0, 127}));
  connect(add1.y, valveincompressible1.opening) annotation(Line(points = {{28, 21}, {28, 21}, {28, 0}, {28, 0}}, color = {0, 0, 127}));
  connect(temperaturesensor1.T, PID.u_m) annotation(Line(points = {{-36, 24}, {-6, 24}, {-6, 50}, {-6, 50}}, color = {0, 0, 127}));
  connect(constant2.y, PID.u_s) annotation(Line(points = {{-37, 62}, {-18, 62}}, color = {0, 0, 127}));
  connect(temperaturesensor1.port, dynamicpipe1.heatPorts[1]) annotation(Line(points = {{-56, 24}, {-80, 24}, {-80, -2}, {-80, -2}}, color = {191, 0, 0}));
  connect(const.y, convection1.Gc) annotation(Line(points = {{-65, -72}, {-42, -72}, {-42, -52}, {-42, -52}}, color = {0, 0, 127}));
  connect(fixedtemperature1.port, convection1.fluid) annotation(Line(points = {{-70, -40}, {-52, -40}, {-52, -40}, {-52, -40}}, color = {191, 0, 0}));
  connect(convection1.solid, pipe.heatPorts[1]) annotation(Line(points = {{-32, -40}, {-18, -40}, {-18, -14}, {-18, -14}}, color = {191, 0, 0}));
  connect(pipe.port_b, valveincompressible1.port_a) annotation(Line(points = {{-8, -8}, {18, -8}}, color = {0, 127, 255}));
  connect(dynamicpipe1.port_b, pipe.port_a) annotation(Line(points = {{-70, -8}, {-28, -8}}, color = {0, 127, 255}));
  connect(valveincompressible1.port_b, fixedboundary3.ports[1]) annotation(Line(points = {{38, -8}, {58, -8}}, color = {0, 127, 255}));
  connect(pump1.port_b, dynamicpipe1.port_a) annotation(Line(points = {{-120, -8}, {-90, -8}, {-90, -8}, {-90, -8}}, color = {0, 127, 255}));
  connect(convection2.solid, dynamicpipe1.heatPorts[1]) annotation(Line(points = {{-102, 38}, {-80, 38}, {-80, -4}}, color = {191, 0, 0}));
  connect(constant1.y, convection2.Gc) annotation(Line(points = {{-141, 70}, {-112, 70}, {-112, 48}}, color = {0, 0, 127}));
  connect(fixedtemperature2.port, convection2.fluid) annotation(Line(points = {{-140, 38}, {-122, 38}}, color = {191, 0, 0}));
  annotation(Diagram(coordinateSystem(extent = {{-210, -100}, {200, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-210, -100}, {200, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end U002;