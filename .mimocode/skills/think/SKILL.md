---
name: think
description: "Apply the 10-principle thinking loop (OBSERVE-OBSERVE-LISTEN-THINK-CONNECT-CONNECT-FEEL-ACCEPT-CREATE-GROW) to any non-trivial problem. Walks through external observation, metacognition, active listening, first-principles analysis, lateral connection, system orchestration, intuition, intellectual humility, generative output, and iterative growth. Triggers on: think this through, 10-principle review, /think, deep think, systematic thinking, structured reasoning."
---

# think: The 10-principle thinking loop

A meditation, a discipline, and a checklist. Use this skill when a problem is non-trivial enough that disciplined thinking pays for itself: architectural decisions, post-mortems, ambiguous user requests, audits, multi-stakeholder tradeoffs.

The 10 principles are not a recipe. They are stages of attention. You move through them in order on the first pass, then loop back to the earlier ones as new information emerges.

---

## The 10 principles

### 1. OBSERVE (the external input)
Thinking begins with data collection. Look at the environment, the current landscape, the patterns and inefficiencies and opportunities — without immediately trying to solve them. Read the raw inputs.

### 2. OBSERVE (the internal metacognition)
Now observe yourself. This is metacognition — thinking about how you are thinking. Are you operating on assumptions? Do you have a bias in this architecture? Are you anchored on a previous decision?

### 3. LISTEN (active receptivity)
Observing is often visual or analytical. Listening requires shutting down the ego to absorb external feedback. Pay attention to user intent, community discussions, error messages, the subtle signals in the noise.

### 4. THINK (critical processing)
The analytical engine. Once you have the inputs, break the problem down to first principles. Structure the logic, map the workflows, evaluate the constraints, synthesize the raw data into a coherent strategy.

### 5. CONNECT (associative / lateral thinking)
Great ideas rarely happen in a vacuum; they happen at intersections. Take two seemingly unrelated concepts and link them. The "Aha!" moment is finding the hidden relationship between distinct variables.

### 6. CONNECT (system orchestration)
The second CONNECT is about execution. Moving from an isolated idea to an integrated system. How do these individual thoughts, tools, or agents plug into one another to create a seamless, functioning whole?

### 7. FEEL (emotional intelligence + intuition)
Pure logic is brittle without empathy. Factor in the human element. Design with user experience in mind. Understand the emotional resonance of your messaging. Trust hard-earned intuition when the data is ambiguous.

### 8. ACCEPT (intellectual humility)
No plan survives first contact with reality. Embrace constraints. Acknowledge when a hypothesis fails. Recognize when the market wants something different than what you built. Let go of sunk cost.

### 9. CREATE (generative output)
Analysis paralysis is the enemy of progress. At some point, stop strategizing and start producing. Write the code. Draft the content. Launch the system. Ship the audit report.

### 10. GROW (the iterative loop)
Thinking is not a straight line; it is a feedback loop. Take what you built (CREATE), see how it performs in reality, and use those lessons to upgrade your skills and expand your capacity for the next cycle.

---

## When to invoke

Invoke `/think` when:

- You are about to make a non-trivial architectural decision
- You are auditing a system and need a methodology spine
- The user's request is ambiguous and you need to listen harder before responding
- You hit a surprising result and need OBSERVE-internal before adjusting
- A post-mortem after something went sideways
- Closing out a session and need a GROW step before /save

Do NOT invoke `/think` for:

- Single-line typo fixes (the discipline is overkill; just fix it)
- Trivial lookups (no decision is being made; just answer)
- Cases where you have already moved through the 10 stages implicitly

---

## How to use

```
/think <problem statement>
```

Walks through the 10 stages in order. For each, answer the prompt questions below. Stage outputs feed into stage 9 (CREATE), which produces a recommendation or artifact.

---

## Stage-by-stage prompts

### 1. OBSERVE (external)
- What are the raw inputs? (Code? Docs? User intent? Logs?)
- What have I read in full vs. skimmed vs. assumed?
- What is the environment / state right now?
- What surprises me, before I start interpreting?

### 2. OBSERVE (internal)
- What am I biased toward here? (Ownership, ship-it, novelty, anchoring, familiarity)
- What outcome am I unconsciously hoping for? Why?
- If a fresh-context reviewer joined right now, what would they question?
- Is my confidence calibrated to the evidence I actually have?

### 3. LISTEN
- What did the user actually ask for? (Quote verbatim.)
- What signals are in the noise?
- Are there community / domain signals I should consult?
- Whose voice is missing from this decision?

### 4. THINK
- What are the first principles in play?
- What are the alternatives I have NOT considered?
- What is the cheapest experiment that would prove me wrong?

### 5. CONNECT (lateral)
- Where else does this pattern show up?
- What seemingly unrelated domain solved a structurally similar problem?
- What metaphor unlocks the user's intuition for this?

### 6. CONNECT (system)
- How does this plug into the existing wiring?
- Does anything need to be updated downstream / upstream / across?
- What new failure modes does integration create?

### 7. FEEL
- How does this LAND for the user?
- What emotional state is the user in when they hit this code path?
- Does my intuition say "something is off" even when the data says "we're good"?

### 8. ACCEPT
- What is the honest tier of this finding / verdict?
- What constraint am I being asked to soften that I should not?
- What sunk cost am I protecting that I should release?

### 9. CREATE
- What is the smallest artifact that ships the decision?
- What is the cleanest path from here to "done"?
- Are the inputs sufficient, or do I need to loop back to an earlier stage?

### 10. GROW
- What worked well in this cycle?
- What would I do differently next time?
- What inputs feed v_next?
- Where should this lesson be stored so future-me does not have to re-derive it?

---

## Anti-patterns

The loop fails when:

- **Skipping OBSERVE-internal.** Going straight from external observation to THINK without auditing your own biases produces confident wrong answers.
- **Skipping ACCEPT.** Padding a score, hedging a verdict, calling YELLOW "GREEN with disclosure".
- **Skipping GROW.** Producing the artifact, shipping it, and moving on without feedback.
- **Analysis paralysis at THINK.** Looping inside stage 4 forever, never reaching CREATE.
- **Ceremony.** Writing all 10 stages for a one-line fix. The framework's cost should scale with problem stakes.
