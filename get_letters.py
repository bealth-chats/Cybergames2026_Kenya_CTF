import matplotlib.pyplot as plt

points = []
with open('points.txt', 'r') as f:
    for line in f:
        lat, lon = map(float, line.strip().split(','))
        points.append((lat, lon))

lats = [p[0] for p in points]
lons = [p[1] for p in points]

def save_crop(name, xmin, xmax):
    plt.figure(figsize=(5, 5))
    plt.plot(lons, lats, marker='.', markersize=2, linestyle='-')
    plt.axis('equal')
    plt.xlim(xmin, xmax)
    plt.title(name)
    plt.savefig(f'{name}.png')
    print(f"Saved {name}.png")

save_crop('LET_U2', 17.0766, 17.0772)
