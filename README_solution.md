# Solution for OSINT CTF Challenge

The challenge provides three Minecraft F3 debug screenshots in the Overworld:
- Image 1: `minecraft:savanna` at (5, 77, 4) with `Facing: Yaw 47.4`
- Image 2: `minecraft:plains` at (109, 68, 119) with `Facing: Yaw 53.0`

The description states: "I was looking for the ender dragon, and I got completely lost." The mention of looking for the ender dragon combined with the exact Yaw coordinates strongly implies the player was throwing **Eyes of Ender**, which travel towards Strongholds.

**Step 1: Filtering by Biomes**
We use the library `cubiomes` (with version constant `MC_1_21_3`) to filter the 150 million seeds in the given range `[5250000000, 5400000000]` for those that have these exact biomes at the given coordinates. This gives us **7,205 seeds**.

**Step 2: Filtering by Ender Eye Rays**
By calculating the trajectories of the Eyes of Ender from Image 1 and Image 2:
- Ray 1: Origin (5.7, 4.7), Yaw 47.4
- Ray 2: Origin (109.1, 119.3), Yaw 53.0

We test the remaining seeds for strongholds intersecting these exact rays, which isolates 28 seeds.

**Step 3: Filtering by Slime Chunks**
Image 1 is located in Chunk `(0, 0)` and shows `Slime Chunk: true`.
Image 2 is located in Chunk `(6, 7)` and shows `Slime Chunk: false`.
By filtering our 28 candidate seeds against these Slime Chunk values, exactly **one seed** survives: `5386973906`.

For seed `5386973906`, the Stronghold chunk center is at `(-1076, 1004)`.
The distance from Ray 1 to the chunk center is merely **3.4 blocks**.
The distance from Ray 2 to the chunk center is merely **6.7 blocks**.
This confirms the seed perfectly. (The `Nether_Bedrock_Cracker` tool referenced in the prompt is an intentional red herring).

Final flag: `SK-CERT{5386973906}`
