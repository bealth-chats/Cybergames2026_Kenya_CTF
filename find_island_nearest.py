import math
import sys

def haversine(lat1, lon1, lat2, lon2):
    R = 6371  # Earth radius in km
    dlat = math.radians(lat2 - lat1)
    dlon = math.radians(lon2 - lon1)
    a = math.sin(dlat/2) * math.sin(dlat/2) + math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * math.sin(dlon/2) * math.sin(dlon/2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
    return R * c

target_lat, target_lon = 45.3475, -75.7608

islands = [
    ("Long Island", 45.2350655, -75.6915283),
    ("Nicolls Island", 45.2494507, -75.7043571),
    ("Green Island", 45.4404356, -75.695975),
    ("île de Hull", 45.431589, -75.7180718),
    ("Britannia Island", 45.3738779, -75.8027198),
    ("Upper Duck Island", 45.4687575, -75.6105766),
    ("Lower Duck Island", 45.470006, -75.5903995),
    ("Clifford Allen Island", 45.3874195, -75.6823598),
    ("Île Conroy", 45.3790997, -75.8008461),
    ("Bate Island", 45.4087328, -75.7561462),
    ("Cunningham Island", 45.4067995, -75.755063),
    ("Turtle Island", 45.5173796, -75.7841064),
    ("Île Marguerite", 45.4919278, -75.7539793),
    ("Lemieux Island", 45.4152178, -75.7293686),
    ("Hull Island", 45.4245229, -75.70694),
    ("Cummings Island", 45.4322325, -75.6711107),
    ("Pig Island", 45.398376, -75.6796312),
    ("Riopelle Island", 45.40624, -75.7550868),
    ("Merrill Island", 45.4148511, -75.7336046),
    ("Bell Island", 45.4136766, -75.7309435),
    ("Ile Yvette-Naubert", 45.4189082, -75.7344287),
    ("Lumpy Denommee’s Island", 45.4164432, -75.734578),
    ("Île Young", 45.4164812, -75.7335639),
    ("Fury Island", 45.4140971, -75.734274),
    ("Nichols Island", 45.4141295, -75.7334886),
    ("Porter Island", 45.4376904, -75.6824099),
    ("Aylmer Island", 45.3970638, -75.8886945),
    ("Dinelle Twins Island", 45.457145, -75.7183637),
    ("Île Chelsea", 45.5115649, -75.7749015),
    ("Maple Island", 45.4395786, -75.6914555),
    ("Chartrand Island", 45.3785808, -75.8948299),
    ("Haycock Island", 45.3744652, -75.8932693),
    ("Île Chaudière Island", 45.4199091, -75.7178076),
    ("Île Victoria Island", 45.4207982, -75.7129737),
    ("Albert Island", 45.4189344, -75.7179084),
    ("Île Kettle", 45.4700683, -75.6508794)
]

distances = []
for name, lat, lon in islands:
    d = haversine(target_lat, target_lon, lat, lon)
    distances.append((d, name))

distances.sort()
for d, name in distances:
    print(f"{d:.2f} km: {name}")
