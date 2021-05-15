Title: EVOLVING Creatures V7
Description: This is a typical example of how evolution works.
A population of (customizable) Creatures try to Evolve according to some tasks.
A Creature is composed by springs, "muscles" and a neural network.
There are "intelligent" and "dumb" springs. First ones change their rest length according to the neural network outputs. The other simply react to external forces to mantain their invariable rest lengths.
From V6 there are "muscles". Muscle is an angle constrain between two links. The NN outputs determinate 
even the Angle that they must have.
The Creature's Neural Network Inputs are: Vx,Vy & "Pressure" of touching ground Points, Creature Rotation (DX and DY), Height from ground, X Y Velocities and Rotational Velocity.
The Creature's Neural Network Outputs are: "Intelligent" springs rest lengths and Muscles rest angles.
EVOLUTION (genetic algorithm):
At Each generation there are 3 sons wich parents are "randomly" choosen from the best previous generation creatures. (Some sons mutate their genes with low probability (M)).
Then sons are Evaluated. (This 3 sons replace the previous generation worst creatures)
This file came from Planet-Source-Code.com...the home millions of lines of source code
You can view comments on this code/and or vote on it at: http://www.Planet-Source-Code.com/vb/scripts/ShowCode.asp?txtCodeId=74127&lngWId=1

The author may have retained certain copyrights to this code...please observe their request and the law by reviewing all copyright conditions at the above URL.
