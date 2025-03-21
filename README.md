
# Port Scanner Script

This is a simple Bash script for scanning a range of ports on a target IP address. It checks if the ports are open or closed using TCP connections.

## 📜 **Usage**

```bash
./portsacn.sh <target_ip> <port_range>
```

### Example:
```bash
./portsacn.sh 192.168.1.1 1-1000
```

## ⚙️ **Requirements**
- Bash shell
- `timeout` command (usually available in most Linux distributions)

## 🚀 **How It Works**
1. Takes two arguments:
    - `<target_ip>`: The IP address of the machine you want to scan.
    - `<port_range>`: The range of ports to scan (e.g., `1-1000`).
2. Validates the input parameters.
3. Iterates through the specified port range.
4. Uses a `timeout` of 1 second to test each port using `echo` and `/dev/tcp`.
5. Displays whether each port is open or closed.

## ⚠️ **Error Handling**
- Displays a usage guide if incorrect arguments are provided.
- Validates the port range to ensure it is properly formatted.
- Outputs an error message if the port range is invalid.

## 🛠️ **Customization**
You can modify the timeout duration by changing this line:
```bash
timeout 1 bash -c "echo >/dev/tcp/$TARGET/$port"
```
Change `1` to a different value (in seconds) if you want to increase or decrease the connection timeout.

## ✅ **Disclaimer**
- Use this script only for legal and ethical purposes. Unauthorized port scanning may be illegal or considered malicious activity.
- Ensure you have permission to scan the target machine.

