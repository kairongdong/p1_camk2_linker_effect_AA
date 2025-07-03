# Scripts for simulation

## The tetramer strunture is generatured through PyMol

1. One asymmetry unit is taken to generate holoenzyme with PyMol
2. CaMK2d nolinker models were based on the crystal structure from Ozden (finalized and submitted PDB: 8USO), the generated tetramer with missing loops can be found in this folder under current folder: linker_loop_modeling_scripts/camk2d/ABCD_truncated_clean.pdb
3. CaMK2a nolinker models were based on the crystal structure from PDB:3SOA, the generated tetramer with missing loops can be found in this folder under current folder: linker_loop_modeling_scripts/camk2a/a-tetra-organize.pdb


## The missing loops and linkers are built to the tetramer with Modeller

1. Tool: python 3.9.18 & modeller library 10.4
2. The scripts to align and build the missing loop for the no linker construct and for build different linkers can be found in this folder under current folder: linker_loop_modeling_scripts

## Initial system for running simulation is generated via CHARMMGUI

1. Tool: CHARMMGUI:https://www.charmm-gui.org/
2. Conditions: 
    terminals (ACE CT2)
    box size (130 angstrom)
    ion (NaCl 200mM)
    TIP3P water
3. The systems generated with CHARMMGUI containing the protein, ion and water can be found in this folder under current folder: system_set_up

## The simulation production under equilibrated conddition is run with GROMACS

1. Tool: GROMACS 2019.4
2. The scripts for energy minimization and equilibration and the output system infomation can be find in this folder under current folder: minimization_and_equilibration
3. The scripts for production and structures after simulation production of equilibrated state can be found in this folder under current folder: camk2_production/
    eg: the structure of camk2d-exon18 after one equilibration production: camk2_production/camk2d/exon18/18_s1_400k.gro
4. The running time of one single trajectory on a normal computer with one GPU takes around 5-6 days.

## Analyze of the RMSD, RMSF and pairwise distance are done with GROMACS

The scripts for the analysis can be found in this folder under current folder: camk2_trj_analysis

