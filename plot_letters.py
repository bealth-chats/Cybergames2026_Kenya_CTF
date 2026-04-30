import matplotlib.pyplot as plt

points = []
with open('points.txt', 'r') as f:
    for line in f:
        lat, lon = map(float, line.strip().split(','))
        points.append((lat, lon))

lats = [p[0] for p in points]
lons = [p[1] for p in points]

# Let's crop more carefully
ranges = [
    ('part1', 17.073, 17.075),
    ('part2', 17.075, 17.077),
    ('part3', 17.077, 17.079),
    ('part4', 17.079, 17.081),
    ('part5', 17.081, 17.083),
]

for name, xmin, xmax in ranges:
    plt.figure(figsize=(10, 10))
    plt.plot(lons, lats, marker='.', markersize=2, linestyle='-')
    plt.axis('equal')
    plt.xlim(xmin, xmax)
    plt.savefig(f'{name}.png')
    print(f"Saved to {name}.png")
