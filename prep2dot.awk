#!/usr/bin/awk -f

BEGIN { if (ARGC<3) { print "usage: awk -f prep2dot.awk file mol_name"; exit 1 } mol_name=ARGV[2]; delete ARGV[2] }

$0~mol_name{start_ln=NR;parsing=1;next}

parsing&&NR>=start_ln+6{
  if($0~/^$/){parsing=0;loop_parsing=1;next}
  atom_idxs[$2]=$1;lines[NR]=$0
}

loop_parsing{
  if($0~/^$/){loop_parsing=0;next}
  split($0,p," ")
  if(p[1]in atom_idxs&&p[2]in atom_idxs)
    loop_edges[atom_idxs[p[1]],atom_idxs[p[2]]]=1
}

END{
  print "graph g {"
  for(i=start_ln+6;i<=start_ln+length(atom_idxs)+3;i++){
    split(lines[i],f)
    printf "%s[label=\"%s\"];",f[1],f[2]
    if(f[5] != "3")print f[1]"--"f[5]";"
  }
  for(k in loop_edges){split(k,f,SUBSEP);print f[1]"--"f[2]";"}
  print "}"
}
