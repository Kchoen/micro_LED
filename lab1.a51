org   0
      mov  sp, #50H
      clr    c
      mov   a, #0ffH
mk1:
      mov   p1, A
      call    delay
      rlc     a
      jc     mk1
mk2:
      rrc     a
      mov    p1, A
      call    delay
	  jc     mk2
      rlc     A
      jmp   mk1 ; ==BB==
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
