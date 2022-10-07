# Application to Lunar Logic from Tymofii Muraviov

## Description of task

Requirements:
1. Each number should be divisible by three.
2. Sum of all three numbers should be as large as possible.

Example:
1. [110, 222, 3333] can be changed to [111, 222, 3333] - this is one change
2. [111, 222, 33] can be changed to [114, 333, 33] - here we have six changes

## Description of my solution

### Plan of actions:

1. I had to transfer each number into array of digits for easier manipulation.
2. I had to create an array of possible answers.
3. Then reconstruct numbers from arrays.
4. Then I had to filter that array searching for the highest sum of three numbers.
5. Output the result

### What works:

- For the input of `[110, 222, 3333]` my program produces an output `The anwer is [222, 3333, 510]`.
- I created a class named `SolvingQuestion` trying to separate logic to different methods.
- I have individual methods for each step of the program.

### What doesn't work:

- Compliance with the original order of the numbers.
- Calculating for cases when there are 2, 3 or 0 undivadable numbers by 3.
- Not handled the variant when there isn't a possible solution.
- Method `create_variants` is too long, it is better to do it in a couple of smaller functions.
