---
name: try
description: Attempt to solve an issue by looping through a problem, spawning subagents, and using defined validation processes
disable-model-invocation: true
argument-hint: [project] [request]
---

Complete the request. If relevant, additional resources will contain extra information such as validation processes for a specific project. If the request is too vague in any way, ask for clarification before starting. 

- At any point, spawn subagents to solve specific problems, but ensure that they are focused on a single task and have clear instructions.
- Loop through the problem-solving process, using the results from each iteration to refine your approach and move closer to a solution. 
- If you encounter an issue that cannot be solved with the information available, identify the gap in knowledge and seek out additional resources or information to fill that gap.
- Continuously evaluate the effectiveness of your approach and be willing to pivot or change strategies if necessary based on new information or feedback.
- Document your process and findings, including any challenges encountered and how they were addressed, to provide a clear record of your problem-solving journey and to inform future efforts.
- Regularly run validation processes to ensure that your solutions are effective and meet the necessary criteria, making adjustments as needed based on the results of these validations.
- Don't rush to complete the task; take the time to thoroughly explore all potential solutions and ensure that your chosen approach is well-informed and effective before finalizing your work.
- Don't make assumptions about the problem or potential solutions without evidence to support them. Always seek out data and information to inform your decisions and avoid making decisions based on incomplete or inaccurate information.
- Don't mark the task as complete until you have thoroughly explored all potential solutions and have confidence in the effectiveness of your chosen approach.

## Analysis
- Start by analyzing the request and identifying any specific requirements or constraints that may be relevant
- Break down the request into smaller, more manageable parts to better understand the scope of the problem and identify potential areas for further investigation.
- Use critical thinking and reasoning skills to evaluate the information available and identify any gaps in knowledge or potential areas for further research. This may involve asking clarifying questions, seeking out additional resources, or collaborating with others to gain a better understanding of the problem at hand.
- Use subagents to assist with specific areas of research, ensuring they are focused on a single, clear, task.
- If gathered information does not align with the request, ask for clarification to ensure that you have a clear understanding of the request and can effectively address it

## Problem solving
Use additional resources when available to inform your problem-solving process. If no additional resources are available, rely on your own knowledge and reasoning abilities to attempt to solve the issue.
- Start by clearly defining the problem and breaking it down into smaller, manageable parts.
- Use a systematic approach to analyze the problem, such as identifying the root cause, generating potential solutions, and evaluating the pros and cons of each solution.
- After analyzing a problem, look at its part and attempt to find the simplest solution for the whole problem. If the solution is not simple, break it down into smaller parts and solve each part separately.
- Implement the chosen solution and monitor its effectiveness using subagents, making adjustments as necessary based on feedback and results.

## Validation
- Regularly run validation processes to ensure that your solutions are effective and meet the necessary criteria. This may involve testing your solution against specific benchmarks, gathering feedback from stakeholders, or using data analysis to evaluate its performance.
- If your solution does not meet the necessary criteria, identify the reasons for its shortcomings and make adjustments as needed. This may involve revisiting your problem-solving process, seeking out additional resources, or collaborating with others to refine your approach.
- Set reasonable timeouts for validation processes to ensure that they are completed in a timely manner and do not cause unnecessary delays in your problem-solving efforts. If a validation process takes too long, consider breaking it down into smaller parts or seeking out additional resources to help speed up the process. This also helps to avoid getting stuck in a loop of validation without making progress towards a solution.

<!-- ## Additional Resources -->
<!-- !`~/.claude/skills/try/scripts/helper.sh` -->
