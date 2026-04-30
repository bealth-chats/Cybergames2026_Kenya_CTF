import matplotlib.pyplot as plt

points = []
with open('points.txt', 'r') as f:
    for line in f:
        lat, lon = map(float, line.strip().split(','))
        points.append((lat, lon))

lats = [p[0] for p in points]
lons = [p[1] for p in points]

plt.figure(figsize=(10, 10))
plt.plot(lons, lats, marker='.', markersize=2, linestyle='-')
plt.axis('equal')
plt.savefig('path.png')
print("Saved to path.png")
