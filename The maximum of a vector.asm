dosseg                 ; folosim comanda dosseg pentru a alinia paragrafele tuturor segmentelor
.model small           ; intentionam sa folosim memoria mica- one data segment
.stack 100h            ; directiva de segment prin care definim 100h cuvinte ca program stack
.data                  ; declarare pentru a pune deoparte in memorie stocarea pentru o variabila
vector db 2,9,4,12     ; initializam un vector cu valori prestabilite
result db ?            ; initializam o variabila de tip define byte size 
 
.code                  

main proc              ; folosim directiva pentru declararea ?i alocarea datelor proc
 
mov ax,@data           ; mutam grupul de date in registrul ax folosind macrocomanda @data
mov ds,ax              ; mutam in segmentul de date ds grupul de date din registrul ax
 
mov cx,4               ; mutam in contorul cx lungimea vectorului
mov bl,0               ; initializam registrul bl cu 0 pentru a-l putea compara mai tarziu
LEA SI,vector          ; incarcam adresa efectiva a vectorului in registrul si


l1:                    ; prima bucla
mov al,[SI]            ; se muta in al elementul de la adresa registrului si
cmp al,bl              ; se compara valorile din al si bl
jl l2                  ; daca valoarea din bl este mai mare decat cea din al se sare peste urmatoarea comanda
mov bl,al              ; se muta in bl noul maxim 

l2:                    ; a doua bucla
inc si                 ; se incrementeaza si pentru a se muta la urmatoarea adresa
dec cx                 ; se decrementeaza cx pentru a se modifica lungimea vectorului
JNZ l1                 ; se sare la bucla 1 daca lungimea vectorului nu este 0

mov result,bl          ; se muta in variabila rezultat maximul

mov ah,4ch             ; muta valoarea hexadecimala in registrul ah 
int 21h                ; generam o intrerupere software

main endp              ; marcam sfarsitul procedurii main
end main               ; marcam sfarsitul fisierul

