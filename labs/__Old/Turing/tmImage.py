from PIL import Image, ImageDraw, GifImagePlugin
import time

# Read in the output of the computation.
computation_file = open("tm-output.txt","r")
computation_raw = computation_file.read()
computation_raw = computation_raw.split("\n")
output_file_name = "test"

def computation_configurations(raw_computation):

    """
        Given a .txt file output from tmMain.py 
        this function splits the file into a list whose
        elements are the distinct configurations of the 
        corresponding computation.
    
    """

    # Initialise storage of configurations.
    list_of_configurations = []

    # Measure number of configurations. 
    number_of_configurations = len(raw_computation)//10

    # Iterate over configurations and append them to storage.
    configuration = 0
    while configuration < number_of_configurations:

        lower = 0 + 10*configuration
        upper = 10 + 10*configuration
        current_configuration = raw_computation[lower:upper]
        list_of_configurations.append(current_configuration)
        configuration += 1

    return list_of_configurations

def tape_configuration_image(configuration,tape_length):
    
    """
        Returns an image of a configuration of a TM calculation.
    
    """
    
    # # Get a measure of the length of the tape. 
    # tape_length = len(configuration[0])

    # Create a new image to store the computation on. 
    computation_image = Image.new("L", (6*tape_length,100))   
    # The factor of 6 accounts for the number of pixels required to get the entire tape.  

    # Setup the drawing. 
    draw = ImageDraw.Draw(computation_image)

    # Set each line onto the image. Use shift to set new lines.
    shift = 0
    for line in configuration:
        # print(line,len(line))
        # input()
        draw.text((0,0 + shift*10),line,fill=255)
        shift += 1
    
    return computation_image 

if __name__ == '__main__':
    # With the methods above the .gif can be generated from the following: 

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




