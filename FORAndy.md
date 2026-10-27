# Encourage Yourself — a letter back to 2018 Andy

Hey Andy —

You built this in March 2018. One Ruby file, a README with honest typos, a handful of branches that never quite merged. On paper it looks tiny. As a learning artifact, it’s surprisingly rich.

## What this project *is*

**Encourage Yourself** is a command-line companion: you type how you’re feeling, and it answers with a quote meant to land like a friend who actually listened. Anxiety, depression, discouragement, feeling “unlovely” — each one maps to a little shelf of quotes you curated by hand (Spurgeon, Dostoevsky, Fred Rogers, Brené Brown, Van Gogh… that’s not a random stack; that’s a *taste*).

The program’s “shape” is a conversation loop:

1. Ask if you need encouragement  
2. Ask your name (with a fallback: `"Amazing Human"` — still one of my favorite lines in here)  
3. Ask which feeling fits  
4. Hand back a random quote from that feeling’s array  
5. Ask if you want more, or exit with a send-off: *go encourage someone else*

It’s therapy-adjacent software written as a beginner Ruby exercise. The product idea and the language practice grew up together.

## The north-star product (what you actually wanted)

The 2018 script was the rehearsal. The real product in your head was closer to this:

1. **Profiles** — Jim isn’t a one-off `gets.chomp`; he’s a returning person.
2. **Check-ins** — Jim says he’s lonely (or anxious, etc.) and rates how bad it feels right now.
3. **Matched quotes** — the system shows quotes for *that* emotional ailment, not a generic pep talk.
4. **Re-score** — after the quote, Jim rates again.
5. **Learning over time** — if loneliness quote A moves people from worse → better more often than quote B, promote A.

That’s not “a quote app.” That’s a **closed feedback loop**: intervene → measure → learn → intervene better. The pain-scale branch was already reaching for step 2 and 4; what was missing was *persisting* people and outcomes so the loop could compound.

Sketch of the core records (mental model, not a framework mandate):

```text
User        → id, name, …
Feeling     → "loneliness", "anxiety", …
Quote       → text, feeling_id, …
CheckIn     → user, feeling, score_before, quote_shown, score_after, delta
```

Once you have many `CheckIn` rows, “what helps?” becomes a query: average `delta` per quote (and maybe per feeling). The hard product decisions sit *around* that query — especially which way the score runs (does 10 mean “feeling great” or “hurting most”?).

## The architecture (yes, even a one-file app has one)

Think of the script as three rooms in a small house:

| Room | What lives there | Ruby ideas you’re practicing |
|------|------------------|------------------------------|
| **Quote shelves** | `@anxiety`, `@depression`, etc. | Arrays, instance variables, `.sample` |
| **Front door** | The yes/no `loop` + empty-input check | Control flow, validation, `abort` |
| **Living room** | `Person` + `feeling_help` | Classes, methods, `case`/`when`, heredocs |

Data → interaction → response. That’s the same skeleton as a web app; you just hadn’t plugged in Rails yet (and your own comment already foresaw that).

There’s also a branch (`conversation_cues_class`) where you tried inheritance: `Pain_Scale < Person`, plus a 1–10 “how bad is it” question. That branch is a snapshot of you reaching for OOP before the mental model of *instance state* had fully clicked — which is exactly when good engineers start leaving breadcrumbs in comments.

## What looks genuinely good

**1. You shipped a complete loop, not a demo of syntax.**  
A lot of early projects print `"Hello"` and stop. Yours asks, listens, responds, re-asks, and exits with tone. Product thinking showed up early.

**2. Empathy is in the error paths.**  
Unknown feeling? You don’t scold — you say you know how discouraging that is, and you’ll research more. Empty input? Clear retry. That’s UX maturity people often skip until much later.

**3. You left learning notes in the code.**  
Comments like *“I’d like to use someone’s name below but I’m not sure how…”* are gold. Future-you (and any mentor) can see the exact concept you were wrestling with: **scope** — where a name lives, and who can see it. That’s the real curriculum under the quotes.

**4. Iteration shows in git history.**  
In a few days you went: single quotes → arrays + `.sample` → `case` instead of long `if/elsif` → `Person` class → pain scale experiment. You also had a commit titled “adjusting because of Reddit” — feedback → change. That’s the engineering loop.

**5. Branches as experiments.**  
`feeling_arrays`, `adjusting_until_ending`, `conversation_cues_class`, `recover_retry` — you treated git like a lab notebook. Not every experiment needs to merge. Keeping them is how you remember what you tried.

**6. The README is honest.**  
“A lot of work left to go” + a clear purpose. No fake polish. That honesty ages better than overclaiming.

## The bugs / sticky spots (and what they teach)

These aren’t dunks — they’re the classic traps this project exists to teach:

- **Name never makes it into the quote loop.** You create `Person.new` but don’t keep the object. The comment under it is you staring at the right door: pass the person (or their name) into `feeling_help`, or make the conversation methods live *on* `Person`.
- **`@anxiety` at the top level vs inside methods.** Top-level `@vars` in Ruby are sneakily “main” object instance variables. It “works,” but a hash like `QUOTES = { "anxiety" => [...] }` would make the `case` disappear into a lookup — and scale when you add feelings.
- **Yes/No is case-sensitive in places.** `"no"` exits; `"No"` might not. `.downcase` (which you already use on feelings) is the habit to spread everywhere for CLI input.
- **`until need_more == 'yes'` then `abort`.** Clever instinct to keep looping, but `until` here exits on anything that isn’t exactly `yes` — including typos. Worth sketching on paper: *what inputs continue, what inputs end?*
- **Pain scale branch & `Person.get_name`.** Inheritance was the right curiosity; the missing piece was storing the instance (`person = Person.new`) and calling methods on *that* object instead of trying to pull the name through the class.

## How good engineers think (and how this already rhymes)

- **Start with a human loop, then factor.** You didn’t start with frameworks. You started with a conversation. That’s the right order.
- **Comments as questions beat comments as decoration.** Your TODOs are hypotheses. Next step was always: change one thing, run it, see what broke.
- **Data structure unlocks code simplicity.** Once quotes lived in arrays, randomization was one method call. A hash of feelings → arrays would have been the next “aha.”
- **Tone is a feature.** The exit lines aren’t accidental; they’re the product.

## Technologies & decisions (then vs now)

| Then (2018) | Why it made sense | Natural next step if you revived it |
|-------------|-------------------|-------------------------------------|
| Single `.rb` script | Fast feedback, no ceremony | Same, or a tiny Sinatra/Rails app |
| Arrays + `case` | Clear beginner control flow | `Hash` lookup, maybe YAML/JSON quote files |
| `gets` / `puts` CLI | Perfect for learning I/O | Web form, or a Slack bot with the same core |
| Manual quote curation | Soul of the project | Keep curation; don’t outsource the voice |

## Pitfalls to dodge next time you build something like this

1. **Clarify ownership of state early** — who holds `name`? Pass it explicitly until OOP feels boring.  
2. **Normalize input once** — downcase/strip at the boundary.  
3. **Prefer data over branches** when every `when` does the same shape of work.  
4. **Keep the exit path kind** — you already did; don’t lose that when you “professionalize” the code.

## A tiny reflection for you

If you open this repo again, don’t judge it by “is this production-ready?” Judge it by: *Did past-me practice finishing a loop that cares about the person on the other side of the keyboard?*

It did.

— A friendly read of your old lab notebook
