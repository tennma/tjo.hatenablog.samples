data {
	int<lower=0> N; // �T���v���T�C�Y
	real<lower=0> x1[N]; // �L�������z1
	real<lower=0> x2[N]; // �L�������z2
	real<lower=0> x3[N]; // �L�������z3
	real<lower=0> y[N]; // KPI
}

parameters {
	real trend[N]; // �g�����h
	real s_trend; // �g�����h�̕W���΍�
	real s_q; 
	real<lower=0> a;
	real<lower=0> b;
	real<lower=0> c;
	real d;
}

model {
	real q[N];
	trend~normal(30,10);
	for (i in 3:N)
		trend[i]~normal(2*trend[i-1]-trend[i-2],s_trend);
	for (i in 1:N)
		q[i]<-y[i]-trend[i];
	for (i in 1:N)
		q[i]~normal(a*x1[i]+b*x2[i]+c*x3[i]+d,s_q);
}