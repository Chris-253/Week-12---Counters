# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?

The counter only reaches the terminal count every N clock cycle so the t flip-flop toggles only when that occurs. The output also needs two toggles to make one full cycle so that the overall output repeats every 2 * N input clocks.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?

The ring counter starts with only one flip-flop which is set to 1 and all the others are set to 0. The first clock that single 1 shifts into the next stage while every stage feeds into its previous value. The pattern ends up appearing as all 1s for one cycle before it settles into a repeating pattern.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?

A ring counter would need 100,000 bits wide to get ~1KHz from a 100 MHz clock