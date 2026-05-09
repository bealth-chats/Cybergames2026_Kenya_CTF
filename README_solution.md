# Solution for OSINT CTF Challenge

The challenge provides three Minecraft F3 debug screenshots in the Overworld:
- Image 1: `minecraft:savanna` at (5, 77, 4) with `Facing: Yaw 47.4`
- Image 2: `minecraft:plains` at (109, 68, 119) with `Facing: Yaw 53.0`
- Image 3: `minecraft:beach` at (35, 27, 163) with `Facing: Yaw 129.1`

The description states: "I was looking for the ender dragon, and I got completely lost." The mention of looking for the ender dragon combined with the exact Yaw coordinates strongly implies the player was throwing **Eyes of Ender**, which travel towards Strongholds.

**Step 1: Filtering by Biomes**
We can use the library `cubiomes` to filter the 150 million seeds in the given range `[5250000000, 5400000000]` for those that have these exact three biomes at the given coordinates. This gives us **7,205 seeds**.

**Step 2: Filtering by Ender Eye Rays (Rays 1 and 2)**
By calculating the trajectories of the Eyes of Ender from Image 1 and Image 2:
- Ray 1: Origin (5.7, 4.7), Direction -sin(47.4), cos(47.4)
- Ray 2: Origin (109.1, 119.3), Direction -sin(53.0), cos(53.0)
The intersection of these two rays is roughly `(-1154, 1071)`. Since strongholds generate starting at a distance of 1408 from the origin in 1.21, this is a valid stronghold location. We filter our 7,205 seeds for those that generate a Stronghold near `(-1154, 1071)`, narrowing the list down to exactly **28 candidate seeds**.

**Step 3: The Third Ender Eye (Ray 3)**
The player "got completely lost" because after tracking the first stronghold, they returned to origin (35, 163) and threw another Eye of Ender (Ray 3), which flew at `Yaw 129.1`. This direction points roughly towards `(-X, -Z)`.
If we evaluate the remaining 28 seeds to see which one has a Stronghold along this exact path, we find that **only ONE seed** matches: `5340121299`.
For this seed, Ray 3 perfectly intersects Stronghold #9, which generates extremely far away at `(-6588, -5212)`. The error is merely 5.6 blocks over a distance of 8400 blocks.

Therefore, the exact seed is unambiguously `5340121299`. The `Nether_Bedrock_Cracker` provided in the hint was a red herring.

Final flag: `SK-CERT{5340121299}`
