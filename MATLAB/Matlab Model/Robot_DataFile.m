% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(11).translation = [0.0 0.0 0.0];
smiData.RigidTransform(11).angle = 0.0;
smiData.RigidTransform(11).axis = [0.0 0.0 0.0];
smiData.RigidTransform(11).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 73.177995292236901 73.177995292236801];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931948;  % rad
smiData.RigidTransform(1).axis = [-0.57735026918962562 -0.57735026918962562 -0.57735026918962618];
smiData.RigidTransform(1).ID = "B[Lower_arm-1:-:Upper_arm-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-32.249999999999943 -10.279761761195715 5.7797617611952603];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931948;  % rad
smiData.RigidTransform(2).axis = [-0.57735026918962562 -0.57735026918962562 -0.57735026918962618];
smiData.RigidTransform(2).ID = "F[Lower_arm-1:-:Upper_arm-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 73.1779952922371 -46.822004707763107];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931948;  % rad
smiData.RigidTransform(3).axis = [-0.57735026918962562 -0.57735026918962562 -0.57735026918962618];
smiData.RigidTransform(3).ID = "B[Lower_arm-1:-:Waist-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [13.999999999999696 36.388240087966452 7.6117599120331967];  % mm
smiData.RigidTransform(4).angle = 2.0943951023931948;  % rad
smiData.RigidTransform(4).axis = [-0.57735026918962562 -0.57735026918962562 -0.57735026918962618];
smiData.RigidTransform(4).ID = "F[Lower_arm-1:-:Waist-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [55.500000000000007 -2.7797617611951959 0.47976176119518543];  % mm
smiData.RigidTransform(5).angle = 2.0943951023931948;  % rad
smiData.RigidTransform(5).axis = [0.57735026918962562 0.57735026918962562 0.57735026918962618];
smiData.RigidTransform(5).ID = "B[Upper_arm-1:-:Wrist-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-25.20000000000006 22.800000000000082 -4.9999999999999147];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931948;  % rad
smiData.RigidTransform(6).axis = [0.57735026918962562 0.57735026918962562 0.57735026918962618];
smiData.RigidTransform(6).ID = "F[Upper_arm-1:-:Wrist-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 27.999999999999996 28];  % mm
smiData.RigidTransform(7).angle = 1.7701259958947e-15;  % rad
smiData.RigidTransform(7).axis = [1 0 0];
smiData.RigidTransform(7).ID = "B[Base-1:-:Waist-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [-3.0198066269804258e-13 32.388240087966622 -32.388240087966722];  % mm
smiData.RigidTransform(8).angle = 1.7701259958947e-15;  % rad
smiData.RigidTransform(8).axis = [1 0 0];
smiData.RigidTransform(8).ID = "F[Base-1:-:Waist-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [22.200000000001953 -17.2000000000019 -14.000000000000012];  % mm
smiData.RigidTransform(9).angle = 2.0943951023931962;  % rad
smiData.RigidTransform(9).axis = [-0.57735026918962606 -0.57735026918962529 -0.57735026918962606];
smiData.RigidTransform(9).ID = "B[Gripper_base-1:-:Wrist-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [5.1999999985076073 8.7999999999999616 -8.5265128291212022e-14];  % mm
smiData.RigidTransform(10).angle = 2.0943951023931962;  % rad
smiData.RigidTransform(10).axis = [-0.57735026918962606 -0.57735026918962529 -0.57735026918962606];
smiData.RigidTransform(10).ID = "F[Gripper_base-1:-:Wrist-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(11).translation = [-11.964509433880721 35.356337190896284 -36.72985188597977];  % mm
smiData.RigidTransform(11).angle = 0;  % rad
smiData.RigidTransform(11).axis = [0 0 0];
smiData.RigidTransform(11).ID = "RootGround[Base-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(6).mass = 0.0;
smiData.Solid(6).CoM = [0.0 0.0 0.0];
smiData.Solid(6).MoI = [0.0 0.0 0.0];
smiData.Solid(6).PoI = [0.0 0.0 0.0];
smiData.Solid(6).color = [0.0 0.0 0.0];
smiData.Solid(6).opacity = 0.0;
smiData.Solid(6).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.097958253440682472;  % kg
smiData.Solid(1).CoM = [0.11719941767509622 27.999996940245261 -5.6964276818059094];  % mm
smiData.Solid(1).MoI = [130.55222852234152 140.41418414338526 212.14337497900405];  % kg*mm^2
smiData.Solid(1).PoI = [4.1355097701562627e-07 3.9922674426972944 -2.2267481122691609e-05];  % kg*mm^2
smiData.Solid(1).color = [1 1 1];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Base*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.065163189456411447;  % kg
smiData.Solid(2).CoM = [0.00039587936686046911 65.388819975013263 12.383060495809973];  % mm
smiData.Solid(2).MoI = [109.16090694276426 114.06460632813334 9.2817925828941643];  % kg*mm^2
smiData.Solid(2).PoI = [-0.24326925124839449 -0.00012466426503773449 0.00015825422820353038];  % kg*mm^2
smiData.Solid(2).color = [1 1 1];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "Lower_arm*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.068442712911821899;  % kg
smiData.Solid(3).CoM = [1.6913609850182871 38.996435073289241 -14.993485557193488];  % mm
smiData.Solid(3).MoI = [45.68704546634077 58.723884227177372 55.083919025021196];  % kg*mm^2
smiData.Solid(3).PoI = [-5.19129521124938 -6.2038518012201767 -0.37850683737247315];  % kg*mm^2
smiData.Solid(3).color = [1 1 1];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Waist*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.051634918656613168;  % kg
smiData.Solid(4).CoM = [7.0475972882243862 -2.8699872554703849 5.807076737414671];  % mm
smiData.Solid(4).MoI = [9.578343539367653 59.424439032379389 55.700769031669701];  % kg*mm^2
smiData.Solid(4).PoI = [0.00013338923403335173 -0.071325882675304333 -0.29337441353797927];  % kg*mm^2
smiData.Solid(4).color = [1 1 1];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "Upper_arm*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 0.017187687100358364;  % kg
smiData.Solid(5).CoM = [-5.3351818515814537 17.640480942216808 0.048504449075448999];  % mm
smiData.Solid(5).MoI = [2.7295248620899359 5.2692929674360789 4.1371132748105417];  % kg*mm^2
smiData.Solid(5).PoI = [-0.0043006748459362221 0.012623549299372146 0.61922447016682225];  % kg*mm^2
smiData.Solid(5).color = [1 1 1];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = "Wrist*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(6).mass = 0.01603583916836604;  % kg
smiData.Solid(6).CoM = [28.016766548874021 -15.223390470925962 -37.551139584287178];  % mm
smiData.Solid(6).MoI = [8.2780770646036128 7.3923928309565934 2.6116669599578537];  % kg*mm^2
smiData.Solid(6).PoI = [1.4571189294264448 1.3914126308955912 -0.35735431112256694];  % kg*mm^2
smiData.Solid(6).color = [1 1 1];
smiData.Solid(6).opacity = 1;
smiData.Solid(6).ID = "Gripper_base*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(5).Rz.Pos = 0.0;
smiData.RevoluteJoint(5).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = -1.1017764609091714e-14;  % deg
smiData.RevoluteJoint(1).ID = "[Lower_arm-1:-:Upper_arm-1]";

smiData.RevoluteJoint(2).Rz.Pos = -1.1017764609091714e-14;  % deg
smiData.RevoluteJoint(2).ID = "[Lower_arm-1:-:Waist-1]";

smiData.RevoluteJoint(3).Rz.Pos = 1.1017764609091714e-14;  % deg
smiData.RevoluteJoint(3).ID = "[Upper_arm-1:-:Wrist-1]";

smiData.RevoluteJoint(4).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(4).ID = "[Base-1:-:Waist-1]";

smiData.RevoluteJoint(5).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(5).ID = "[Gripper_base-1:-:Wrist-1]";

