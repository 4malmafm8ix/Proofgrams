import os
from tmCode import turingMachine

# Name the instructions to be tested. 
tm_code = "tm-code-unaryInc.txt"

# Define the test input tapes with proper output.
test_1 = ["@,b,b;","@,1;"]
test_2 = ["@,1,b;","@,1,1;"]
test_3 = ["@,1,1,1,1;","@,1,1,1,1,1;"]
tests = [test_1,test_2,test_3]


i = 1
for test in tests: 

    # Prepare the input tape. 
    test_file_name = "tm-tape-unaryInc-test-" + str(i) + ".txt"
    test_file = open(test_file_name,"w")
    test_file.write(test[0])
    test_file.close()

    # Prepare the appropriate output to test against. 
    test_list_format = list(test[1])[:-1]
    test_list_format = [x for x in test_list_format if x != ","]

    # Load in the instructions and the test tape 
    tm = turingMachine(tm_code,test_file_name)

    # Execute the computation. 
    tm.execute_computation()
    
    # Grab the output tape. 
    final_tape = tm.tm_tape
    # Reformat to remove all blank cells. This assumes blank cells are meaningless i.e. at the end only! 
    final_tape = [x for x in final_tape if x != "b"]


    # Now test the Turing machine output against the specified output. 
    test_passed = (final_tape == test_list_format)

    if test_passed == True: 
        print("Your Turing machine passed test case " + str(i) + ".")
    else:
        print("Your Turing machine failed test case " + str(i) + ".")
    
    # Remove the auxillary file created for testing. 
    os.remove(test_file_name)

    # Increment for the next test case. 
    i += 1

