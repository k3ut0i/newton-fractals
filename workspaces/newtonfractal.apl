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

∇r←params (colorfn draw) file;fh;i;j;d;z;size;l;⎕IO
  ⎕IO←0 ◊ size←0⊃params ◊ l←1⊃params ◊ z0←2⊃params ⍝ how to shift center?
  ⊣ fh←"w" ⎕FIO[3] file ◊  ⊣ "P3\n" ⎕FIO[23] fh
  ⊣ "%d %d\n%d\n" size size 15 ⎕FIO[22] fh
  i←0 ◊ d←l×2÷size
loopi:
  →(i=size)/end
  j←0
loopj:
  →(j=size)/jend
  z←z0+((i×d)-l)+¯11○((j×d)-l)
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
  c←100 (z31 itern z31d) z ◊ cp←({1E¯6≥|c-⍵}¨1 ¯0.5J0.8660254038 ¯0.5J¯0.8660254038 0)
  →(+/cp)/retcolor
  r←black
  →0
retcolor:
  r←cp/red green blue black
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

∇r←z32color z;c;red;green;blue;black;z32;z32d
  ⍝⍝ which root does it converge to?
  z32←{(⍵*3)+(0J1×⍵*2)+(¯1×⍵)+0J¯1} ◊ z32d←{(3×⍵*2)+(0J2×⍵)+¯1}
  red←15 0 0 ◊ green←0 15 0 ◊ blue←0 0 15 ◊ black←0 0 0
  c←100 (z32 itern z32d) z ◊ cp←{1E¯6≥|c-⍵}¨(1 ¯1 0J¯1 0)
  →(+/cp)/retcolor
  r←black
  →0
retcolor:
  r←cp/red green blue black
∇

∇r←z41color z;c;red;green;blue;black;z41;z41d;cp
  ⍝⍝ which root does it converge to?
  z41←{¯1+⍵×⍵×⍵×⍵} ◊ z41d←{4×⍵×⍵×⍵}
  red←15 0 0 ◊ green←0 15 0 ◊ blue←0 0 15 ◊ some←7 0 7◊black←0 0 0
  c←100 (z41 itern z41d) z ◊ cp←({1E¯6≥|c-⍵}¨1 0J1 ¯1 0J¯1 0)
  →(0=+/cp)/diverge
  r←cp/red green blue some black
  →0
diverge:
  r←black
∇
