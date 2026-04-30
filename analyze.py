from pymavlink import mavutil

mlog = mavutil.mavlink_connection('telemetry.data')

points = []
while True:
    m = mlog.recv_match(type=['GLOBAL_POSITION_INT', 'GPS_RAW_INT'])
    if m is None:
        break
    if m.get_type() == 'GLOBAL_POSITION_INT':
        points.append((m.lat / 1e7, m.lon / 1e7))
    elif m.get_type() == 'GPS_RAW_INT':
        points.append((m.lat / 1e7, m.lon / 1e7))

print(f"Found {len(points)} GPS points")
if len(points) > 0:
    for p in points[:10]:
        print(p)
