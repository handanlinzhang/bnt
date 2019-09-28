function bnet = mk_asia2_bnet()
    N = 8;
    dag = zeros(N,N);
    A = 1;S = 2;T=3;L=4;B=5;O=6;X=7;D=8;
    dag(A,T)=1;
    dag(T,O)=1;
    dag(O,[X,D])=1;
    dag(S,[L B])=1;
    dag(L,O)=1;
    dag(B,D)=1;
    node_sizes=2*ones(1,N);
    bnet = mk_bnet(dag,node_sizes);
    bnet.CPD{A} = tabular_CPD(bnet,A,[0.99,0.01]);
    bnet.CPD{S} = tabular_CPD(bnet,S,[0.5,0.5]);
    bnet.CPD{T} = tabular_CPD(bnet,T,[0.99,0.01,0.95,0.05]);
    bnet.CPD{L} = tabular_CPD(bnet,L,[0.99,0.01,0.9,0.1]);
    bnet.CPD{B} = tabular_CPD(bnet,B,[0.7,0.3,0.4,0.6]);
    bnet.CPD{O} = tabular_CPD(bnet,O,[1,0,0,1,0,1,0,1]);
    bnet.CPD{X} = tabular_CPD(bnet,X,[0.95,0.05,0.02,0.98]);
    bnet.CPD{D} = tabular_CPD(bnet,D,[0.9,0.1,0.3,0.7,0.2,0.8,0.1,0.9]);
end