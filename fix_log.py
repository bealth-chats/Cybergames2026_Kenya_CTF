from pymavlink import mavutil
import sys

def parse_log_lowlevel(filename):
    with open(filename, 'rb') as f:
        data = f.read()

    # Try using MAVLink1/2 parser directly on bytes
    from pymavlink.dialects.v20 import ardupilotmega as mavlink2
    from pymavlink.dialects.v10 import ardupilotmega as mavlink1

    m2 = mavlink2.MAVLink(None)
    m2.robust_parsing = True

    messages = []

    # parse byte by byte
    for b in data:
        try:
            m = m2.parse_char(bytes([b]))
            if m is not None:
                messages.append(m)
        except Exception as e:
            pass

    print(f"Found {len(messages)} messages")

    gps_points = []
    for m in messages:
        if m.get_type() in ['GLOBAL_POSITION_INT', 'GPS_RAW_INT']:
            gps_points.append((m.lat / 1e7, m.lon / 1e7))

    print(f"Found {len(gps_points)} GPS points")
    if gps_points:
        for p in gps_points[:10]:
            print(p)

    # Let's save points to a file to plot or something
    with open('points.txt', 'w') as f:
        for lat, lon in gps_points:
            f.write(f"{lat},{lon}\n")

parse_log_lowlevel('telemetry.data')
