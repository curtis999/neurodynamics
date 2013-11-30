from mpl_toolkits.mplot3d import Axes3D

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

Nelem = 1000  # number of network elements
Nensm = 100

# rescale variance of matrix elements
J2 = 0.99*0.99
Jvar = J2/N

# equations of motion
g = 1.0
def dxdt(x, t, g, J):
    return -x + np.einsum('ij,j', J, np.tanh(g*x))

for nrun in range(Nensm):
    # generate instance of random matrix
    J_orig = np.random.randn(N,N)
    J = np.sqrt(Jvar) * J_orig
    
    for i in range(N):
        J[i,i] = 0.0
    
    # randomly draw initial state
    x = np.array(np.random.randn(N))
    # instead use x on the limit cycle found in one set of experiments
    #x = np.load('limitcycle_x0.npy')
    
    # let the transient run out
    tstart = time.time()  # timing purposes
    t0 = 0.0
    tf = 10000.0  # assumed transient time
    dt = 0.1
    times = np.arange(t0, tf+dt, dt)
    
    sol = odeint(dxdt, x, times, (g,J))
    x = sol[-1]
    
    print time.time() - tstart, ' s'
    
    # now run for a little while to collect data
    tstart = time.time()  # timing purposes
    t0 = 0.0
    tf = 1000.0  # assumed transient time
    dt = 0.1
    times = np.arange(t0, tf+dt, dt)
    
    sol = odeint(dxdt, x, times, (g,J))
    x = sol[-1]
    
    print time.time() - tstart, ' s'
    
    # save time series figs, also phase space plots
    fig = plt.figure()
    ax = fig.add_subplot(5,1,1)
    ax.plot(times, sol.T[0])
    ax = fig.add_subplot(5,1,2)
    ax.plot(times, sol.T[1])
    ax = fig.add_subplot(5,1,3)
    ax.plot(times, sol.T[2])
    ax = fig.add_subplot(5,1,4)
    ax.plot(times, sol.T[3])
    ax = fig.add_subplot(5,1,5)
    ax.plot(times, sol.T[4])
    fig.savefig('figs_testloop/ts_J_' + str(J2) + '_run' + str(nrun) + '.pdf'
    
    fig = plt.figure()
    ax = fig.add_subplot(1,1,1)
    ax.plot(sol.T[0],sol.T[1])
    fig.savefig('figs_testloop/ps_J_' + str(J2) + '_run' + str(nrun) + '.pdf'
    
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot(sol.T[0],sol.T[1],sol.T[2])
    fig.savefig('figs_testloop/ps_J_' + str(J2) + '_run' + str(nrun) + '_3d.pdf'
    
    
    
    
    
    