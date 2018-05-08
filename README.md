# An adaptive mesh solver for the Cahn-Hilliard equation

<p align="center">
<img src="https://github.com/FredericWantiez/Cahn-Hilliard-solver/blob/master/fig/20.png" width="300">
<img src="https://github.com/FredericWantiez/Cahn-Hilliard-solver/blob/master/fig/40.png" width="300">
</p>

This solver implements a first order Lagrange finite element method to solve the Cahn-Hilliard equation. The solver works on triangular mesh
and refines the mesh at every time-step to follow the dynamics of the evolving boundary in Cahn-Hilliard. 
At every tim-step the solver refines a base mesh at interesting points in order to follow the dynamics of the solution. The solution 
estimate is then interpolated on this new mesh before building the new finite element approximation. The steps of the refinement
are shown below:

<p align="center">
<img src="https://github.com/FredericWantiez/Cahn-Hilliard-solver/blob/master/fig/find_boundary.png" width="300">
<img src="https://github.com/FredericWantiez/Cahn-Hilliard-solver/blob/master/fig/map_to_base.png" width="300">
</p>
<p align="center">
<img src="https://github.com/FredericWantiez/Cahn-Hilliard-solver/blob/master/fig/refine.png" width="300">
<img src="https://github.com/FredericWantiez/Cahn-Hilliard-solver/blob/master/fig/smooth.png" width="300">
</p>
The mesh manipulation is done using the package Mesh2d from https://github.com/dengwirda/mesh2d.
