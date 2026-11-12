
DATA SEGMENT
    target DB 10 DUP('$')
    show DB 10 DUP('$')

    msgLength DB 'Enter word length (1-9): $'
    msgWord DB 13,10,'Enter word: $'
    msg DB 13,10,'Enter letter: $'
    msgWin DB 13,10,'You Win!$'
    msgLose DB 13,10,'You Lose!$'
    nl DB 13,10,'$'

    wordLength DB 0
    found DB 0
    mistakes DB 0

    ; Hangman drawing
    draw DB '+-----+',13,10
    stop1 DB '$'
    DB '|     |',13,10
    stop2 DB '$'
    DB '|     |',13,10
    stop3 DB '$'
    DB '|     |',13,10
    stop4 DB '$'
    DB '|  O  |',13,10
    stop5 DB '$'
    DB '| /|\  |',13,10
    stop6 DB '$'
    DB '| / \  |',13,10,'$'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

start:
    MOV AX, DATA
    MOV DS, AX

    ; STAGE B - ADMIN

    ; Read word length
    MOV AH, 9
    MOV DX, OFFSET msgLength
    INT 21H

    MOV AH, 1
    INT 21H

    SUB AL, '0'
    MOV wordLength, AL

    ; Read secret word
    MOV AH, 9
    MOV DX, OFFSET msgWord
    INT 21H

    MOV CL, wordLength
    MOV CH, 0
    MOV BX, 0

read_word:
    MOV AH, 1
    INT 21H

    MOV target[BX], AL
    MOV show[BX], '_'

    INC BX
    LOOP read_word

    ; Clear screen
    MOV AH, 0
    MOV AL, 3
    INT 10H

    ; STAGE A - GUESS

main_loop:
    MOV AH, 9
    MOV DX, OFFSET msg
    INT 21H

    MOV AH, 1
    INT 21H

    MOV found, 0
    MOV CL, wordLength
    MOV CH, 0
    MOV BX, 0

scan_loop:
    CMP AL, target[BX]
    JNE notEqual

    MOV show[BX], AL
    MOV found, 1

notEqual:
    INC BX
    LOOP scan_loop

    ; STAGE C - MISTAKES

    CMP found, 0
    JNE print_word

    INC mistakes

    ; STAGE D - DRAW

    CMP mistakes, 1
    JNE second
    MOV stop1, 0
    JMP print_word

second:
    CMP mistakes, 2
    JNE third
    MOV stop2, 0
    JMP print_word

third:
    CMP mistakes, 3
    JNE fourth
    MOV stop3, 0
    JMP print_word

fourth:
    CMP mistakes, 4
    JNE fifth
    MOV stop4, 0
    JMP print_word

fifth:
    CMP mistakes, 5
    JNE sixth
    MOV stop5, 0
    JMP print_word

sixth:
    MOV stop6, 0

    ; PRINT WORD AND DRAW

print_word:
    MOV AH, 9
    MOV DX, OFFSET nl
    INT 21H

    MOV DX, OFFSET show
    INT 21H

    MOV DX, OFFSET nl
    INT 21H

    MOV DX, OFFSET draw
    INT 21H

    ; STAGE C - CHECK WIN

    MOV BX, 0
    MOV CL, wordLength
    MOV CH, 0

check_win:
    CMP show[BX], '_'
    JE check_lose

    INC BX
    LOOP check_win

    JMP win_game

    ; STAGE C - CHECK LOSE

check_lose:
    CMP mistakes, 6
    JAE lose_game

    JMP main_loop

    ; WIN

win_game:
    MOV AH, 9
    MOV DX, OFFSET msgWin
    INT 21H

    JMP exit_game

    ; LOSE

lose_game:
    MOV AH, 9
    MOV DX, OFFSET msgLose
    INT 21H

    ; EXIT

exit_game:
    MOV AH, 4CH
    INT 21H

CODE ENDS
END start
