import re

class turingMachine:

    """
    """

    def __init__(self,code_file,tape_file):

        self.tm_raw_code_list = self.read_raw_code(code_file)
        self.tm_states = self.tm_state_names(self.tm_raw_code_list)
        self.tm_code = self.compile_raw_code(code_file)
        self.tm_tape = self.read_input_tape(tape_file)

        # These lines define the starting parameters for the Turing Machine
        self.state = "q0"
        self.read_head = "@"
        self.head_position = 0
        self.steps = 0



    def read_raw_code(self,raw_code_file):

        """
        """

        # Read the Turing machine code from file.
        code_file = open(raw_code_file,"r")
        code_raw = code_file.read()
        # This regex sub allows for comments in the code between angle brackets on a single line.
        code_raw = re.sub("\#.*?\n","",code_raw)
        raw_code_list = code_raw.split(";\n")[:-1]
        # At this point code_raw is a list of states in "standard form"
        code_file.close()

        return raw_code_list

    def tm_state_names(self,raw_code_list):

        """
        """

        state_names_set = set()

        for instruction in raw_code_list:

            format_instructions = instruction.split(",")
            state_names_set.add(format_instructions[0])

        return state_names_set

    def compile_raw_code(self,raw_code):

        """
        """

        # This dictionary will have the state names as keys.
        tm_code_dictionary = {}

        # Read in the code from the file.
        raw_instructions = self.tm_raw_code_list

        # Collect the names of the states
        tm_states = self.tm_states

        for state in tm_states:

            # This dictionary will be the value of the output dictionary for the state key.
            # The keys for this dictionary are the read values of the head.
            # The values for this dictionary are lists of instructions [print,move,new_state].
            state_instruction_dictionary = {}

            for instruction in raw_instructions:

                format_instruction = instruction.split(",")

                if format_instruction[0] == state:

                    state_instruction_dictionary[format_instruction[1]] = format_instruction[2:]

                else:
                    pass

            tm_code_dictionary[state] = state_instruction_dictionary

        return tm_code_dictionary


    def read_input_tape(self,input_tape):

        """
            This function reads a .txt file with a single line which should be of the following form:
                @,1,1,1,b,1,1;
            Which represents the input tape for the Turing Machine.
            Note: This function should have an optional input which can be used to pad the
                  input tape with the desired number of blank cells to the right. This will allow
                  the Machine to go past the inputs in its working - if that is needed.
            Output: Updates the Turing Machines tape.
        """

        # Read the input tape from file.
        input_file = open(input_tape,"r")
        input_raw = input_file.read()
        input_file.close()

        # Remove the format from the file.
        for character in [",",";","\n"," "]:
            input_raw = [x for x in input_raw if (x != character)]

        return input_raw



    def tm_move_instruction(self,direction):

        """
            This function maps the move instructions "L/R/N" to -1,1,0
            Outputs an INT.
        """

        if direction == "L":
            return -1
        elif direction == "R":
            return + 1
        else:
            return 0


    #### ------------------------------------------------------------------
    #### Code for writing the computations to a file in a readable manner
    #### ------------------------------------------------------------------

    def print_tape_top(self,tape):

        """
        """
        # How long is the tape?
        number_cells = len(tape)

        top = "|" + "|---"*number_cells + "|"

        return top

    def print_tape_characters(self,tape):

        # How long is the tape?
        number_cells = len(tape)

        tape_output = "|"

        for character in tape:

            if character == "b":

                cell = "|" + " "*3
                tape_output += cell

            else:

                cell = "|" + " " + character + " "
                tape_output += cell



        return tape_output + "|"

    def print_read_head(self,tm_position,tm_state,tm_print,tm_move,tm_updateState):

        """
              | |       two spaces + | + space + | + two spaces
            /     \     / + three spaces + \
            |C: q0 |    |C: + space + tm_state + space + |
            |P: @  |    |P: + space + tm_print + space + |
            |M: R  |    |M: + space + tm_move + space + |
            |U: q0 |    |U: + space + tm_updateState + space + |
            --------
        """

        # This will determine how far along the head should read.
        shift = (tm_position)*4

        line_1 = " "*shift + " "*2 + "|" + " " + "|" + " "*2 + "\n"
        line_2 = " "*shift + " /   \\" + "\n"
        line_3 = " "*shift + "|C: " + tm_state + "|" + "\n"
        line_4 = " "*shift + "|P: " + tm_print + " |" + "\n"
        line_5 = " "*shift + "|M: " + tm_move + " |" + "\n"
        line_6 = " "*shift + "|U: " + tm_updateState + "|" + "\n"
        line_7 = " "*shift + "-"*7

        # Output string
        head_output = ""

        lines_head = [line_1,line_2,line_3,line_4,line_5,line_6,line_7]
        for line in lines_head:
            head_output += line

        return head_output

    def execute_computation(self):

        """
        """

        turingMachineOutput = open("tm-output.txt","w")
        turingMachineOutput.close()

        while (self.state != "HALT") and (self.steps < 10000) and len(self.tm_tape) < 100:

            # Retrieve the current instruction set.
            current_instructions = self.tm_code[self.state][self.read_head]

            # Find the value to print to the tape.
            print_value = current_instructions[0]

            # Find the move direction and update the head position.
            move_direction = current_instructions[1]

            # Find the state to update to.
            next_state = current_instructions[2]
            next_state_print = ""
            if next_state == "HALT":
                next_state_print = "H "
            else:
                next_state_print = next_state

            # Write to file code goes here...
            tape_upper_lower = self.print_tape_top(self.tm_tape)
            tape_cells = self.print_tape_characters(self.tm_tape)
            current_tape = tape_upper_lower + "\n" + tape_cells + "\n" + tape_upper_lower + "\n"

            current_head = self.print_read_head(self.head_position,
                                           self.state,
                                           print_value,
                                           move_direction,
                                           next_state_print)

            turingMachineOutput = open("tm-output.txt","a")
            turingMachineOutput.write(current_tape)
            turingMachineOutput.write(current_head)
            turingMachineOutput.write("\n")
            turingMachineOutput.close()

            # Now we update the tape and state according to the code.

            # Print the appropriate value to the tape.
            self.tm_tape[self.head_position] = print_value

            # Move the head of the Turing Machine.
            self.head_position += self.tm_move_instruction(move_direction)

            # Update the state according to the instructions.
            self.state = next_state

            # Update the value being read to the value in the new position
            self.read_head = self.tm_tape[self.head_position]

            # If the head gets within' 2 spaces of the end, then we append a blank cell. This Gives the Turing Machine it's potentially infinite tape.
            if (len(self.tm_tape) - self.head_position) <=2:
                self.tm_tape.append("b")


            self.steps += 1

        turingMachineOutput = open("tm-output.txt","a")
        turingMachineOutput.write("\n" + "HALT!")
        turingMachineOutput.close()