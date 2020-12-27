#!/usr/bin/apl
∇r←(f iter fd) z
  →(0=fd z)/diverge
  r←z-(f z)÷(fd z)
  →0 ⍝ return if it doesn't diverge
diverge:
  r←0 ⍝ I am assuming f does not have 0 as a root.
∇

∇r←n (f itern fd) z
  r← ((f iter fd) ⍣ n) z
∇

∇r←nthroots n;⎕IO
  ⎕IO←0
  r←{(2○○2×⍵÷n)+¯11○1○○2×⍵÷n}¨⍳n
∇

∇r←size (colorfn draw) file;fh;i;j;d;z
  ⊣ fh←"w" ⎕FIO[3] file ◊  ⊣ "P3\n" ⎕FIO[23] fh
  ⊣ "%d %d\n%d\n" size size 15 ⎕FIO[22] fh
  i←0 ◊ d←2÷size
loopi:
  →(i=size)/end
  j←0
loopj:
  →(j=size)/jend
  z←(¯1+i×d)+¯11○(¯1+j×d)
  ⊣ (⍕colorfn z) ⎕FIO[23] fh ◊ ⊣ "\t" ⎕FIO[23] fh
  j←j+1
  →loopj
jend:
   ⊣ "\n" ⎕FIO[23] fh
  i←i+1
  →loopi
end:
  ⊣ ⎕FIO[4] fh
∇

∇r←z31color z;c;red;green;blue;black;z31;z31d
  ⍝⍝ which root does it converge to?
  z31←{¯1+⍵×⍵×⍵} ◊ z31d←{3×⍵×⍵}
  red←15 0 0 ◊ green←0 15 0 ◊ blue←0 0 15 ◊ black←0 0 0
  c←100 (z31 itern z31d) z
  r←({1E¯6≥|c-⍵}¨1 ¯0.5J0.8660254038 ¯0.5J¯0.8660254038 0)/red green blue black
∇

∇r←z71color z;c;colors;z71;z71d;cp;⎕IO
  ⎕IO←0 ◊ z71←{¯1+⍵*7} ◊ z71d←{7×⍵*6}
  colors←(0 0 15) (0 15 0) (0 15 15) (15 0 0) (15 0 15) (15 15 0) (15 15 15) (0 0 0) 
  c←200 (z71 itern z71d) z ◊ cp←({1E¯6≥|c-⍵}¨((nthroots 7),0))
  →(+/cp)/retcolor
  r←0 0 0
  →0
retcolor:
  r←(cp/colors)
∇
