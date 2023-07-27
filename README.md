# Verilog


MULTIPITLER IP 를 사용하여  2~9까지의 구구단 구현 
 2023.07.26
현재 문제점:
1. DONE 및 STEP 신호 제어를 입력 DATA에 의존함
2. State가 넘어가도 입력 데이터 신호가 유지됨 의도한 내용이 아님
3. step 신호가 DONE state에서 초기화 되도록 수정 필요함
4. 결과를 정상적으로 출력하긴 했으나 의도대로 수정 필요



   ![image](https://github.com/YunJoongChul/Verilog/assets/86291432/953171e7-f5e4-4735-872b-6788ff19941e)


2023.07.27
수정 사항:
1. step이 연산이 시작되고 종료될때에 맞추게끔 수정함.
2. 합성후에도 정상적으로 출력이 이루어짐
   ![image](https://github.com/YunJoongChul/Verilog/assets/86291432/478992e4-4d4a-4ad2-b403-ad59033d4e1b)
