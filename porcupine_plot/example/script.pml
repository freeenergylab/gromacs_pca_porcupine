load ref.pdb, pc0
load_traj extreme1.pdb, pc0
run modevectors.py
split_states pc0, 1, 30
modevectors pc0_0001, pc0_0030, cutoff=.0, head_length=2, head=0.4, headrgb=(1,.2,.1) ,tailrgb=(1,.2,.1) ,notail=0
set cartoon_trace,1
set cartoon_tube_radius, 0.3
cmd.disable('all')
cmd.enable('pc0_0001',1)
cmd.enable('modevectors',1)
set ray_shadow,0
save PCA_porcupine_pc0.pse,format=pse
