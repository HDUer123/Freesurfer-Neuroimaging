#Left hemisphere

folder1=list.files("SUBJDIR")

t=length(folder1)
vstr3<-matrix(0,nrow=t,ncol=17)
vstr4<-matrix(0,nrow=t,ncol=17)
av45<-matrix(0,nrow=t,ncol=17)
sfdg<-matrix(0,nrow=t,ncol=17)
vstr1=numeric(1000)
vstr2=numeric(1000)
#<-matrix(0,nrow=180,ncol=t)
#vrhnum<-matrix(0,nrow=180,ncol=t)

for (i in 1:length(folder1)){
  path1=folder1[i]
  path2=paste("SUBJDIR/",path1,"/gtm.stats.dat",sep="")
  path3=paste("SUBJDIR/",path1,"/gtm.stats.dat",sep="")
  path4=paste("SUBJDIR/",path1,"/gtm.stats.dat",sep="")
  a1=read.table(path2)
  a2=read.table(path3)
  a3=read.table(path4)
  b1=a1$V7
  b2=a2$V7
  b3=a3$V7
  b1=b1[-534]
  b2=b2[-534]
  b3=b3[-534]
  vh1=b1[34:1033]
  vh2=b2[34:1033]
  vh3=b3[34:1033]
  
  vh2=abs(vh2)
  
  
  vh1[vh1 < 0] <- 0
  
  vh3[vh3 < 0] <- 0
  
  
  
  
  fdg11=vh1[1:34]
  fdg12=vh1[35:66]
  fdg13=vh1[67:108]
  fdg14=vh1[109:147]
  fdg15=vh1[148:181]
  fdg16=vh1[182:210]
  fdg17=vh1[211:250]
  fdg18=vh1[251:272]
  fdg19=vh1[273:288]
  fdg110=vh1[289:302]
  fdg111=vh1[303:333]
  fdg112=vh1[334:358]
  fdg113=vh1[359:377]
  fdg114=vh1[378:422]
  fdg115=vh1[423:467]
  fdg116=vh1[468:484]
  fdg117=vh1[485:500]
  
  
  sfdg[i,1]=mean(vh1[1:34])
  sfdg[i,2]=mean(vh1[35:66])
  sfdg[i,3]=mean(vh1[67:108])
  sfdg[i,4]=mean(vh1[109:147])
  sfdg[i,5]=mean(vh1[148:181])
  sfdg[i,6]=mean(vh1[182:210])
  sfdg[i,7]=mean(vh1[211:250])
  sfdg[i,8]=mean(vh1[251:272])
  sfdg[i,9]=mean(vh1[273:288])
  sfdg[i,10]=mean(vh1[289:302])
  sfdg[i,11]=mean(vh1[303:333])
  sfdg[i,12]=mean(vh1[334:358])
  sfdg[i,13]=mean(vh1[359:377])
  sfdg[i,14]=mean(vh1[378:422])
  sfdg[i,15]=mean(vh1[423:467])
  sfdg[i,16]=mean(vh1[468:484])
  sfdg[i,17]=mean(vh1[485:500])
  
  
  
  
  
  alff11=vh2[1:34]
  alff12=vh2[35:66]
  alff13=vh2[67:108]
  alff14=vh2[109:147]
  alff15=vh2[148:181]
  alff16=vh2[182:210]
  alff17=vh2[211:250]
  alff18=vh2[251:272]
  alff19=vh2[273:288]
  alff110=vh2[289:302]
  alff111=vh2[303:333]
  alff112=vh2[334:358]
  alff113=vh2[359:377]
  alff114=vh2[378:422]
  alff115=vh2[423:467]
  alff116=vh2[468:484]
  alff117=vh2[485:500]
  
  
  
  
  av45[i,1]=mean(vh3[1:34])
  av45[i,2]=mean(vh3[35:66])
  av45[i,3]=mean(vh3[67:108])
  av45[i,4]=mean(vh3[109:147])
  av45[i,5]=mean(vh3[148:181])
  av45[i,6]=mean(vh3[182:210])
  av45[i,7]=mean(vh3[211:250])
  av45[i,8]=mean(vh3[251:272])
  av45[i,9]=mean(vh3[273:288])
  av45[i,10]=mean(vh3[289:302])
  av45[i,11]=mean(vh3[303:333])
  av45[i,12]=mean(vh3[334:358])
  av45[i,13]=mean(vh3[359:377])
  av45[i,14]=mean(vh3[378:422])
  av45[i,15]=mean(vh3[423:467])
  av45[i,16]=mean(vh3[468:484])
  av45[i,17]=mean(vh3[485:500])
  
  
  
  vstr3[i,1]<-cor(fdg11,alff11)
  vstr3[i,2]<-cor(fdg12,alff12)
  vstr3[i,3]<-cor(fdg13,alff13)
  vstr3[i,4]<-cor(fdg14,alff14)
  vstr3[i,5]<-cor(fdg15,alff15)
  vstr3[i,6]<-cor(fdg16,alff16)
  vstr3[i,7]<-cor(fdg17,alff17)
  vstr3[i,8]<-cor(fdg18,alff18)
  vstr3[i,9]<-cor(fdg19,alff19)
  vstr3[i,10]<-cor(fdg110,alff110)
  vstr3[i,11]<-cor(fdg111,alff111)
  vstr3[i,12]<-cor(fdg112,alff112)
  vstr3[i,13]<-cor(fdg113,alff113)
  vstr3[i,14]<-cor(fdg114,alff114)
  vstr3[i,15]<-cor(fdg115,alff115)
  vstr3[i,16]<-cor(fdg116,alff116)
  vstr3[i,17]<-cor(fdg117,alff117)
  
  
  
  
  
  vstr4[i,]=residuals(lm(formula = vstr3[i,]~av45[i,]))
  
  
  
  
  
}

vstr4=as.matrix(vstr4)

vstr4[vstr4 > -0.25&vstr4 < 0.25] <- 0
vstr4[vstr4 > 0.25] <- 1
vstr4[vstr4 < -0.25] <- -1


pca_vstr4=princomp(vstr4,cor = T)


pca_vstr4=predict(pca_vstr4)


vstr4_2=pca_vstr4


vstr4=vstr4_2[,1:2]



rownames(vstr4)=paste("index",1:116,"")

outdist=dist(vstr4,method = 'euclidean')

outhclust=hclust(outdist,method = "ward.D")

plot(outhclust)

rect.hclust(outhclust, k=5)


outid=cutree(outhclust, k=5)

table(outid,paste("index",1:116,""))


#Right hemisphere

folder1=list.files("SUBJDIR")
t=length(folder1)
vstr3<-matrix(0,nrow=t,ncol=17)
vstr4<-matrix(0,nrow=t,ncol=17)
av45<-matrix(0,nrow=t,ncol=17)
sfdg<-matrix(0,nrow=t,ncol=17)
vstr1=numeric(1000)
vstr2=numeric(1000)
#<-matrix(0,nrow=180,ncol=t)
#vrhnum<-matrix(0,nrow=180,ncol=t)

for (i in 1:length(folder1)){
  path1=folder1[i]
  path2=paste("SUBJDIR",path1,"/gtm.stats.dat",sep="")
  path3=paste("SUBJDIR",path1,"/gtm.stats.dat",sep="")
  path4=paste("SUBJDIR",path1,"/gtm.stats.dat",sep="")
  a1=read.table(path2)
  a2=read.table(path3)
  a3=read.table(path4)
  b1=a1$V7
  b2=a2$V7
  b3=a3$V7
  b1=b1[-534]
  b2=b2[-534]
  b3=b3[-534]
  vh1=b1[34:1033]
  vh2=b2[34:1033]
  vh3=b3[34:1033]
  
  vh2=abs(vh2)
  
  
  vh1[vh1 < 0] <- 0
  
  vh3[vh3 < 0] <- 0
  
  
  
  
  
  
  fdg21=vh1[501:539]
  fdg22=vh1[540:568]
  fdg23=vh1[569:616]
  fdg24=vh1[617:658]
  fdg25=vh1[659:692]
  fdg26=vh1[693:720]
  fdg27=vh1[721:770]
  fdg28=vh1[771:797]
  fdg29=vh1[798:813]
  fdg210=vh1[814:828]
  fdg211=vh1[829:856]
  fdg212=vh1[857:895]
  fdg213=vh1[896:910]
  fdg214=vh1[911:947]
  fdg215=vh1[948:968]
  fdg216=vh1[969:978]
  fdg217=vh1[979:1000]
  
  sfdg[i,1]=mean(vh1[501:539])
  sfdg[i,2]=mean(vh1[540:568])
  sfdg[i,3]=mean(vh1[569:616])
  sfdg[i,4]=mean(vh1[617:658])
  sfdg[i,5]=mean(vh1[659:692])
  sfdg[i,6]=mean(vh1[693:720])
  sfdg[i,7]=mean(vh1[721:770])
  sfdg[i,8]=mean(vh1[771:797])
  sfdg[i,9]=mean(vh1[798:813])
  sfdg[i,10]=mean(vh1[814:828])
  sfdg[i,11]=mean(vh1[829:856])
  sfdg[i,12]=mean(vh1[857:895])
  sfdg[i,13]=mean(vh1[896:910])
  sfdg[i,14]=mean(vh1[911:947])
  sfdg[i,15]=mean(vh1[948:968])
  sfdg[i,16]=mean(vh1[969:978])
  sfdg[i,17]=mean(vh1[979:1000])
  
  
  
  
  
  
  alff21=vh2[501:539]
  alff22=vh2[540:568]
  alff23=vh2[569:616]
  alff24=vh2[617:658]
  alff25=vh2[659:692]
  alff26=vh2[693:720]
  alff27=vh2[721:770]
  alff28=vh2[771:797]
  alff29=vh2[798:813]
  alff210=vh2[814:828]
  alff211=vh2[829:856]
  alff212=vh2[857:895]
  alff213=vh2[896:910]
  alff214=vh2[911:947]
  alff215=vh2[948:968]
  alff216=vh2[969:978]
  alff217=vh2[979:1000]
  
  
  
  
  av45[i,1]=mean(vh3[501:539])
  av45[i,2]=mean(vh3[540:568])
  av45[i,3]=mean(vh3[569:616])
  av45[i,4]=mean(vh3[617:658])
  av45[i,5]=mean(vh3[659:692])
  av45[i,6]=mean(vh3[693:720])
  av45[i,7]=mean(vh3[721:770])
  av45[i,8]=mean(vh3[771:797])
  av45[i,9]=mean(vh3[798:813])
  av45[i,10]=mean(vh3[814:828])
  av45[i,11]=mean(vh3[829:856])
  av45[i,12]=mean(vh3[857:895])
  av45[i,13]=mean(vh3[896:910])
  av45[i,14]=mean(vh3[911:947])
  av45[i,15]=mean(vh3[948:968])
  av45[i,16]=mean(vh3[969:978])
  av45[i,17]=mean(vh3[979:1000])
  
  
  
  
  
  vstr3[i,1]<-cor(fdg21,alff21)
  vstr3[i,2]<-cor(fdg22,alff22)
  vstr3[i,3]<-cor(fdg23,alff23)
  vstr3[i,4]<-cor(fdg24,alff24)
  vstr3[i,5]<-cor(fdg25,alff25)
  vstr3[i,6]<-cor(fdg26,alff26)
  vstr3[i,7]<-cor(fdg27,alff27)
  vstr3[i,8]<-cor(fdg28,alff28)
  vstr3[i,9]<-cor(fdg29,alff29)
  vstr3[i,10]<-cor(fdg210,alff210)
  vstr3[i,11]<-cor(fdg211,alff211)
  vstr3[i,12]<-cor(fdg212,alff212)
  vstr3[i,13]<-cor(fdg213,alff213)
  vstr3[i,14]<-cor(fdg214,alff214)
  vstr3[i,15]<-cor(fdg215,alff215)
  vstr3[i,16]<-cor(fdg216,alff216)
  vstr3[i,17]<-cor(fdg217,alff217)
  
  
  vstr4[i,]=residuals(lm(formula = vstr3[i,]~av45[i,]))
  
  
  
  
  
}

vstr4=as.matrix(vstr4)
