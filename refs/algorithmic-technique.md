# Algorithmic technique

Source: https://en.wikipedia.org/wiki/Algorithmic_technique

In [mathematics](https://en.wikipedia.org/wiki/mathematics) and [computer science](https://en.wikipedia.org/wiki/computer_science), an **algorithmic technique** is a general way to build a process or [computation](https://en.wikipedia.org/wiki/computation).

## General techniques

A handful of techniques cover most algorithm design. Which one fits depends on the goal: [searching](https://en.wikipedia.org/wiki/Search_algorithm), [sorting](https://en.wikipedia.org/wiki/Sorting_algorithm), [mathematical optimization](https://en.wikipedia.org/wiki/mathematical_optimization), [constraint satisfaction](https://en.wikipedia.org/wiki/Constraint_satisfaction_problem), [categorization](https://en.wikipedia.org/wiki/categorization), [analysis](https://en.wikipedia.org/wiki/data_analysis), or [prediction](https://en.wikipedia.org/wiki/prediction).

### Brute force

[Brute force](https://en.wikipedia.org/wiki/Brute-force_search) checks every possible outcome to find a solution.

### Divide and conquer

[Divide and conquer](https://en.wikipedia.org/wiki/Divide-and-conquer_algorithm) breaks a hard problem into smaller sub-problems, solves each one, then combines the partial answers into the full solution. Common for searching and sorting.

### Dynamic programming

[Dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming) breaks a hard problem into smaller, [overlapping subproblems](https://en.wikipedia.org/wiki/overlapping_subproblems) and solves each one. It stores each result once, through [memoization](https://en.wikipedia.org/wiki/memoization), instead of solving the same subproblem twice.

### Evolutionary

An [evolutionary](https://en.wikipedia.org/wiki/Evolutionary_algorithm) approach starts with candidate solutions, then mutates or combines them, much like biological evolution, and scores each result against a fitness function. It keeps the best results, repeats, and works toward an overall optimal solution.

### Graph traversal

[Graph traversal](https://en.wikipedia.org/wiki/Graph_traversal) solves problems modeled as [graphs](https://en.wikipedia.org/wiki/graph_theory): [depth-first search](https://en.wikipedia.org/wiki/depth-first_search), [breadth-first search](https://en.wikipedia.org/wiki/breadth-first_search), [tree traversal](https://en.wikipedia.org/wiki/tree_traversal), and variants that skip search paths already known to be dead ends. Used for [shortest path](https://en.wikipedia.org/wiki/Shortest_path_problem) problems and constraint satisfaction, among others.

### Greedy

A [greedy](https://en.wikipedia.org/wiki/Greedy_algorithm) approach picks one outcome, then searches nearby for a better one, and repeats each time it finds an improvement. It's simple to build, but it can settle for a local best instead of the true best across every possible outcome.

### Heuristic

A [heuristic](https://en.wikipedia.org/wiki/heuristic) approach uses a practical shortcut to reach a solution fast, with no promise that it's the best one.

### Learning

[Learning](https://en.wikipedia.org/wiki/Machine_learning) techniques use statistics to categorize and analyze data without hand-written rules. This covers [supervised learning](https://en.wikipedia.org/wiki/Supervised_learning), [unsupervised learning](https://en.wikipedia.org/wiki/unsupervised_learning), [reinforcement learning](https://en.wikipedia.org/wiki/reinforcement_learning), and [deep learning](https://en.wikipedia.org/wiki/deep_learning).

### Mathematical optimization

[Mathematical optimization](https://en.wikipedia.org/wiki/Mathematical_optimization) finds the best value of a function by minimizing or maximizing it.

### Modeling

[Modeling](https://en.wikipedia.org/wiki/Mathematical_model) turns a real-world problem into a framework or [paradigm](https://en.wikipedia.org/wiki/algorithmic_paradigm) that makes it easier to solve.

### Recursion

[Recursion](https://en.wikipedia.org/wiki/Recursion) is a technique where an algorithm calls itself on a smaller version of the same task, working down to one or more base cases with a known answer.

### Sliding window

A sliding window swaps nested loops for a single loop, which cuts the time complexity.

### Two pointers

Two pointers walks a data structure, usually an array or string, using two indices, often starting from opposite ends or moving at different speeds. It solves searching, sorting, and scanning problems in linear time.

### Backtracking

[Backtracking](https://en.wikipedia.org/wiki/Backtracking) builds a solution one piece at a time and drops any partial solution as soon as it breaks a constraint, then tries another path.
