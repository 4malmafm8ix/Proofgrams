from tmCode import turingMachine
from tmImage import computation_configurations, tape_configuration_image

# Write the name of the machine code file here.
tm_code = "tutorial10_q04.txt"

# Write the name of the input tape file here.
tm_tape = "tm-tape.txt"

# This line intialises the Turing Machine with code and tape.
tm = turingMachine(tm_code,tm_tape)

# This line does the computation and writes the output to a text file.
tm.execute_computation()

# Set the following Boolean to True if you would like to output a .gif
# representation of the Turing Machine computation. 
# Probably best to do this once you know the computation works as you hope.
want_gif = True 

# Set the name of the .gif
# If you don't change this, then the output will overwrite what was 
# already stored in "output_file_name".gif.
output_file_name = tm_code[:-4]

if want_gif:
    
    # Read in the output of the computation.
    computation_file = open("tm-output.txt","r")
    computation_raw = computation_file.read()
    computation_raw = computation_raw.split("\n")    

    # Split the configurations into a list.
    computation_configurations_list = computation_configurations(computation_raw) 

    # Set the length of the tape to the length of the final configuration.
    # This is to ensure the .gif wide enough to show the entire tape. 
    tape_length = len(computation_configurations_list[-1][0])

    # Iterate over the list and append the images to the list: 
    frames = []
    for config in computation_configurations_list:
        frame = tape_configuration_image(config,tape_length)
        frames.append(frame)

    # Save the .gif   
    frames[0].save(output_file_name + ".gif",save_all=True,
        append_images=frames[1:],duration=200,loop=1)