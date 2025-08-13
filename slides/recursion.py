# Recursion is all you ever need <3 

def accumulate(a,l,u):
    """ Function to illustrate how recursion
        can be used to do loop like programming.
        
        To accumulate ints from 1 - 10, one 
        might expect to use a while loop 
        and increment a counter to control 
        the loop and accumulation.

        In the lambda calculus there is no 
        looping syntax. But, we can still 
        write this style of program!

        This function illustrates the idea 
        using Python syntax, instead of the 
        Lambda calculus syntax. 

        a :: This stores the accumulated sum.
        l :: Starts as lower number
             increments to control when to HALT.
        u :: Upperbound (inclusive).

    """    
    if l > u:
        return a
    else:
        return accumulate(a + l, l + 1, u)

print(accumulate(0,1,10))

def even(n):
    return (n%2) == 0

def filtered_accumulate(a,l,u,p):
    """ 
        Function to illustrate how extra
        conditions can be added to this 
        pattern of programming.

        a :: This stores the accumlated sum
        l :: Starts as lower number
             increments to control when to HALT.
        u :: Upperbound (inclusive)
        p :: Predicate to filter against 
             p :: a -> Bool
    """
    if l > u:
        return a
    elif p(l) == True:
        return filtered_accumulate(a + l, l + 1, u, p)
    else:
        return filtered_accumulate(a, l + 1, u, p)

print(filtered_accumulate(0,1,10,even))

def divides_helper(t,m,n):
    """
        Further illustration of recursion and branching
        to facilitate search.

        Recursively searches for factors starting from t.

        t :: Test factor. Increments up to n. 
        m :: Number to test whether divides n. 
        n :: Also used as upper bound for HALT.

    """
    if t > n:
        return False
    elif t*m == n:
        return True
    else:
        return divides_helper(t + 1, m, n)

def divides(m,n):
    """
        Employs the helper to starting searching from 1.
    """
    return divides_helper(1,m,n)

print(divides(2,10))

def prime_helper(t,n):

    """
        Recursively test for divisibility
        starting at t up to, but not including
        number n whose primality to be determined.

        t :: Similar to use of t in divisor_helper.
             Used as test divisor and to control 
             the length of the computation. 

    """
    if n == 2:
        return True
    elif t >= n:
        return True
    elif divides(t,n):
        return False
    else:
        return prime_helper(t + 1, n)

def prime(n):
    """
        Call the recursive helper, starting the 
        divisibility test at 2. 
    """
    return prime_helper(2,n)

print(prime(101))

# While this is all well and good theoretically, this amount of recursion 
# can be extremely slow and, by default, Python only allows 1000 recursive calls. 