![bdtkthumb](https://github.com/user-attachments/assets/acdf3929-d829-4d6b-9295-c309432e045a)

# BDTK - BOII Development Tool Kit

**Alpha Release**  
> The current version is an alpha release. However this is a rebuild of `boii_utils` so most functions have been battle tested already. Some new modules however have not will move to full release soon as they have been used in production scripts.

Full docs: [docs.boii.dev](https://docs.boii.dev)

## What is BDTK?

**Normally?** BOII Development Tool Kit
**When it works?** Big Damn Time-saving Kit
**When it doesn’t?** Broken Dumbass Time Killer

BDTK is the next evolution of boii_utils - rewritten, reorganized, and refined for modern scripting.

It’s still the same modular utility library, but now with tighter internals, smarter structure, and a more focused set of tools.
From framework bridging to utility wrappers, animation helpers to standalone system — it’s built to slot into any dev stack and cut the busywork out of your workflow.

No bloat. No gatekeeping. No nonsense.
Just dependable functions, clean patterns, and a codebase that stays out of your way.

## Who Is It For?

- Framework developers who need clean, reusable utility modules for base functionality.
- Script authors who want their releases to support multiple frameworks with minimal effort.
- Solo scripters tired of rewriting the same junk over and over again.
- Teams looking for a shared library of tools to streamline development across projects.

Whether you're writing scripts or an entire framework, BDTK helps cut the fat and scale the logic.

## Why Should I Use It?

- Framework Bridge – Built to abstract and unify major frameworks (qb, esx, ox, nd, boii, etc.) so you don’t have to write double logic.
- Modular by Default – Use only what you need. Every module is isolated, with no hard dependencies on the rest.
- Less Repetition – Handles the common patterns and boring parts so you can focus on actual logic, not boilerplate.
- Consistent Conventions – Shared structure and naming across modules keeps your code clean and predictable.
- Dev Time Saver – Speeds up development with drop-in systems, helper functions, and sane defaults.

## What Does It Provide?

### Resource Bridges

- Framework Bridge – Currently compatible with ESX, QB-Core, QBox, Ox Core, or ND Core.
- Notification Bridge – Currently compatible with bduk, boii_ui, es_extended, okokNotify, ox_lib, qb-core.
- DrawText UI Bridge –  Currently compatible with boii_ui, es_extended, okokNotify, ox_lib, qb-core.

### Standalone Systems

- Callbacks – Full client/server callback handling without framework dependencies.
- Commands – Built-in permissions, Ace support, and command registration.
- Licences – Theory/practical tests, points, revoking—DMV-style, but smarter.
- XP System – Custom growth curves, XP types, and server-wide level tracking.

### Utility Modules

- Appearence – Appearance, clothing, tattoos, and shared styling logic.
- Vehicles – Entity-safe functions for customization, storage, and behavior.
- Items – Usable item registry outside of any core system.
- Methods – Attach runtime functions to players, vehicles, or anything else.
- Player Helpers – Animations, props, directions, and ped-related helpers.
- Timestamps – Server-safe date/time utils for consistent formatting.
- Environment – Time, weather, seasonal effects, and sync helpers.
- Entities – Utility functions for managing NPCs, vehicles, and objects.
- Profanity - Handles profanity related filtering and replacing.
- Buckets - Routing bucket handling and static data storage.
  
### Smart Libraries

- Geometry – Vector math, angles, zones, distance, and shape logic.
- Maths – Extended math with curves, clamping, interpolation, and more.
- Strings – Pad, slugify, wrap, and format anything text-based.
- Tables – Merge, clone, randomize, and clean up Lua tables.
- Keys – Named constants for all common input keys, with helpers.

### How Is It Structured?

Every module in BDTK is fully self-contained — no tangled dependencies, no weird global hacks.
They’re designed to be loaded individually or accessed cleanly through the central `bdtk.get()` system.

BDTK is:

- Bridge-Based – Framework functions are abstracted and unified behind a common API.
- Environment-Aware – Modules work on the client, server, or both depending on context.
- Drop-In Ready – Use one module or all of them. It won’t break if you don’t use the full set.
- Scalable by Design – Built to grow with your project without becoming a mess.

## Quick Install

To get setup using BDTK follow these brief steps:

### Download BDTK
- Download the Latest Release of BDTK from GitHub.

### Add It To Your Server
- Drop bdtk into your server resources.

### Add It To Your Server Config
- Add `ensure bdtk` into your `server.cfg` make sure this line is above any resource requiring it.

### Insert The SQL
- Add the included `REQUIRED.sql` into your database, this is required for user accounts and some standalone systems.

### Restart Your Server
- Restart your server and BDTK will be up and running, all bridges run auto-detection and have safe fall backs if none of the supported resources are found. To change default configuration settings you can do this via convars.

## Support

Need help? Found a bug? Need to vent about a bug that isn’t from this library?
Support is available through the BOII Development **[Discord](https://discord.gg/MUckUyS5Kq)**.

> Support Hours: Mon–Fri, 10AM–10PM GMT

Outside those hours? Pray to the debug gods or leave a message.
