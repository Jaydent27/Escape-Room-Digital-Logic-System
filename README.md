ARC UNSW has received funds from a sponsor to building an escape room on campus. They are
planning to locate it in the EE Building and design it as per the following theme.
The criminal mastermind Diode Von Multiplexer has escaped prison and is on the run. Police have
located his liar in the UNSW EE building, where he is now believed to be hiding. However, the evil genius
has rigged the building so only he can enter! Due to the risk of injuring surrounding civilians, the only
way in is through the secret Digital Dungeon.
The Digital Dungeon consists of two rooms, separated by a locked door. You have been asked to design
a combinational circuit that unlocks the door which takes players from the first room to the second room.
The first room will have three challenges. Once a team has completed all three challenges correctly, the
system will automatically open the door to the next room. The challenges are as follows:

Challenge 1: Theme: The challenge requires users to use clues to guess a weight
Teams are given a box full of 3-8 decoder ICs, each weighing 1g. They must place the correct amount
of ICs on a digital scale that equals a reference weight. The scale returns a 4-bit value of the weight
(0000 = 2g,1111 = 32g, increment of 0001 = 2g). You must design a circuit which compares the 4-bit
weight from the scale (MEAS) to a reference weight (REF) and returns a 2-bit output (COMP), where
COMP = 00, if the two weights are equal, 01 if MEAS < REF and 10 if MEAS > REF. The circuit output
is used to also power 2 LEDs mounted near the digital scale, RED and GREEN. Only RED will turn on if
the weight on the scale is less than the reference and only GREEN will turn on if the weight is more than
the reference. Each day management manually changes the value of REF using a series of 4 dip
switches and adjusts the clues accordingly.

Challenge 2: Theme: The challenge requires teams to use clues to connect 4 ICs in a circuit
Teams are given four different multiplexer ICs; each of the ICs can be connected in the circuit at different
possible positions to produce either an output of 1 or 0, which are combined into a 4-bit number OUTS.
The goal is to place the ICs such that the parity (i.e. even or odd number of 1s) of OUTS equals the parity
of the 2’s complement of the 4-bit reference weight set for Challenge 1 (REF). You must design a circuit
that generates an output CORR1 = 1 if the parity of OUTS = parity of 2’s complement of REF and 0
otherwise. CORR1 is connected to a buzzer that turns on for 10s when CORR1 = 1.
ELEC 2141– Term 1, 2025 – Assignment 1 Page 3

Challenge 3:
Theme: 
The challenge requires teams to use clues to guess a binary code to open the door
Teams enter a 4-bit binary code (CODE) using a set of 4 binary pushbuttons. To unlock the door, the 4
least significant resultant bits of the binary addition of the 4-bit CODE and 4-bit OUTS must equal 0000.
You must design a circuit that generates an output CORR2 = 1 if this is true and 0 otherwise.
Finally, you must design a circuit that produces an output OPEN = 1 if all three challenges have been
completed successfully to open the door and 0 otherwise.
As mentioned earlier, in addition to the report you must also submit all your Verilog modules (not
testbenches) as separate files. As we will be running an autotest script on your modules you will need to
use the following structure:
Your top-level module must be named ass1 and must have the following port names (If these do not
exactly match then your design will fail the autotests):
Inputs: MEAS[3:0], REF[3:0], OUTS[3:0], CODE[3:0]
Outputs: COMP[1:0], CORR1, CORR2, OPEN
Any file that is not a top-level module can be named whatever you like.
An easy way to implement 4-bit array input ports in your modules is to make 4 separate input ports, for
example MEAS[3], MEAS [2], MEAS [1] and MEAS [0].
You may break your design up into components, as long as these components are brought together in
your top-level module. You can choose different technologies to implement each component with
(AND/OR, NAND, multiplexers, etc.). Each component should be implemented as a separate module in
your HDL code and instantiated appropriately in the top-level module. You must submit the code for all
modules (i.e., all .v files) used in your design.


ARC has decided to make the escape room more difficult. To achieve this, teams will be given a limited
amount of time to complete the escape room; each challenge will have an equal amount of time. They
want you to design a finite state machine (FSM) that controls the amount of time teams available to
complete the three challenges in the escape room presented in Assignment 1. The FSM controlling time
available to the teams is reset when the start button is pressed (START = 1). The FSM will stay on until
the end of the sequence. It sequences through an initial reading time, challenge 1, challenge 2 and
challenge 3 and then returns to the start. The same amount of time is allocated to the initial reading time
and each of the three challenges.
An external timer tracks the duration allotted for each challenge. It begins ticking as soon as the start
button is pressed. The timer generates an output (TIME = 1) at the end of its duration which is fed as an
input to the FSM. It then resets itself and starts again. COMP from challenge 1, OUTS from challenge 2
and CODE from challenge 3 are additional inputs to the FSM used to check whether teams have
completed the challenges. Teams will stay at initial reading time, challenge 1 and challenge 2 while TIME
= 0. They will transition from initial reading time to challenge 1, challenge 1 to challenge 2 and challenge
2 to challenge 3 when TIME = 1 regardless of whether each of these challenges are complete. At
challenge 3, if all challenges are complete regardless of the value of TIME, the FSM will provide an
output OVER = 1. OVER will be reset when START=1. If when TIME = 1 at challenge 3 and any of the
challenges are incomplete (i.e. CODE ≠ 0000 or COMP ≠ 00 or OUTS ≠ 0000), teams will be sent to
challenge 1 again to try and complete them. Organisers will have the ability to give teams an unspecified
bonus time. They will then manually reset the FSM at the end of the bonus time they choose to give.
For your assignment, you need to
1. Identify the system inputs and outputs.
2. Draw a state diagram for the FSM.
3. Determine if the number of states can be reduced and assign them with binary codes.
4. Design and implement the FSM using D, T and JK flip-flops.
5. Write Verilog HDL models for:
a. The FSM based on the state diagram in (2) (behavioural modelling)
b. The JK flip-flop sequential circuit that you implement in (4) (structural or dataflow
modelling)
6. Verify the HDL models in (5)


