import sys
from pymavlink import mavutil

try:
    # Use robust parsing mode to skip bad messages
    mlog = mavutil.mavlink_connection('telemetry.data', robust_parsing=True, dialect='ardupilotmega')

    while True:
        try:
            m = mlog.recv_match(blocking=False)
        except Exception as e:
            continue
        if m is None:
            break

        if m.get_type() == 'BAD_DATA':
            continue

        if m.get_type() in ['GLOBAL_POSITION_INT', 'GPS_RAW_INT']:
            print(f"{m.get_type()}: {m.lat/1e7}, {m.lon/1e7}")
        elif m.get_type() == 'STATUSTEXT':
            print(f"STATUSTEXT: {m.text}")
except Exception as e:
    print(f"Error: {e}")
