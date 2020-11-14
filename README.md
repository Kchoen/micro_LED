# 微處理機實驗 LAB
sample summary:讓a=1111_1111變化

從1111_1111->1111_1110->1111_1101--------->0111_1111->1111_1111(0從右跑到左)

再從1111_1111->0111_1111->1011_1111--------->1111_1110->1111_1111(0從左跑到右)

大概是跑馬燈的概念
```
org   0
      mov  sp, #50H
      clr    c
      mov   a, #0ffH   ;; a = 1111_1111 
 ;;a要給p1(port1)      
 ;;每一bit代表1LED->1=發亮,0=不亮
 ;;初始都亮的的
 
 
mk1:
      mov   p1, A
      call    delay
      rlc     a
      jc     mk1
      
      
;;a = 1111_1111 ->rlc 讓c=1->jmp回mk1
;;a : 1111_1111->1111_1110->1111_1101->->0111_1111
;;再做一次rlc會讓c=0->進入mk2

mk2:
      rrc     a
      mov    p1, A
      call    delay
	  jc     mk2
      rlc     A
      jmp   mk1 ; ==BB==
;;a = 1111_1111做rrc->和mk1相反
;;變成1111_1111->0111_1111->->1111_1110
;;然後再回到mk1
      
 ;;delay 減速
delay:
      push  5  ; push R5???
      push  6
      push  7
      mov   r5, #2  ; ==AA==
dd1:      
	  mov   r6, #200
dd2:     
	  mov   r7, #250
      djnz   r7, $ ;     
      djnz   r6, dd2
      djnz   r5, dd1
      pop   7
      pop   6
      pop   5
      ret
        end
```
