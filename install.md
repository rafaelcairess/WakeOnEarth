# ⚙ Installation Guide

This guide explains how to deploy WakeOnEarth and configure the complete remote access workflow.

The final setup allows you to:

* Power on a computer remotely using Telegram
* Verify connectivity through MikroTik
* Access the computer securely using Tailscale
* Control the computer remotely using Sunshine and Moonlight

---

# Requirements

## Hardware

* MikroTik RouterOS v6+
* Computer with Wake-on-LAN support
* Internet connection

## Software

* Telegram Account
* Telegram Bot
* Tailscale
* Sunshine
* Moonlight

---

# 1. Create a Telegram Bot

Open Telegram and start a conversation with:

```text
@BotFather
```

Create a new bot:

```text
/newbot
```

Follow the instructions and save the generated Bot Token.

Example:

```text
123456789:ABCDEFxxxxxxxxxxxxxxxxxxxxxxxx
```

Keep this token private.

---

# 2. Obtain Your Chat ID

Send a message to your newly created bot.

Open:

```text
https://api.telegram.org/botYOUR_BOT_TOKEN/getUpdates
```

Locate your Chat ID in the JSON response.

Example:

```json
{
  "chat": {
    "id": 123456789
  }
}
```

Save the Chat ID.

---

# 3. Enable Wake-on-LAN

Wake-on-LAN must be enabled on the target computer.

## BIOS / UEFI

Enable:

```text
Wake-on-LAN
Power On By PCI-E
Resume By LAN
```

The option name varies by motherboard manufacturer.

---

## Windows

Open:

```text
Device Manager
→ Network Adapter
→ Properties
→ Power Management
```

Enable:

```text
Allow this device to wake the computer
Only allow a magic packet to wake the computer
```

---

# 4. Obtain the MAC Address

The script requires the MAC address of the target device.

Windows:

```powershell
ipconfig /all
```

Example:

```text
30:C5:99:33:7A:88
```

Save the MAC address.

---

# 5. Configure the RouterOS Script

Open:

```text
mikrotik/wakeonearth.rsc
```

Replace the placeholders with your own values.

Example:

```routeros
:local token "YOUR_BOT_TOKEN"

:local chatid "YOUR_CHAT_ID"

/tool wol mac=XX:XX:XX:XX:XX:XX
```

Also update:

```text
MAC Address
Target IP Address
Bridge Interface
```

according to your environment.

---

# 6. Import the Script

Upload the file to the MikroTik router.

Import using:

```routeros
/import wakeonearth.rsc
```

Verify that no errors are reported.

---

# 7. Create a Scheduler

The script must run periodically to check for Telegram commands.

Navigate to:

```text
System → Scheduler
```

Create:

```text
Name: WakeOnEarth

Interval: 1m

On Event:
WakeOnEarth
```

Adjust the script name if necessary.

---

# 8. Test Telegram Commands

Send the following commands to your bot.

Power on the computer:

```text
turnon
```

Check computer status:

```text
status
```

Check internet quality:

```text
internet
```

Expected result:

```text
PC online and responding
```

or

```text
PC offline
```

---

# 9. Install Tailscale

Tailscale provides secure remote connectivity without opening ports on the router.

Official Website:

https://tailscale.com

Install Tailscale on:

* Desktop Computer
* Laptop
* Phone
* Tablet

Login with the same account on all devices.

After installation, the computer will receive a private Tailscale IP.

Example:

```text
100.x.x.x
```

You should now be able to reach the computer from anywhere.

---

# 10. Install Sunshine

Sunshine is the streaming host that runs on the target computer.

Official Repository:

https://github.com/LizardByte/Sunshine

Install Sunshine and complete the initial setup.

Confirm that:

```text
Sunshine Service Running
```

appears correctly.

---

# 11. Install Moonlight

Moonlight is the client used to connect to Sunshine.

Official Website:

https://moonlight-stream.org

Install Moonlight on the device you will use remotely.

Examples:

* Phone
* Tablet
* Laptop
* Another Desktop

---

# 12. Pair Moonlight with Sunshine

Using the Tailscale IP of the target computer:

```text
100.x.x.x
```

Add the host inside Moonlight.

Complete the pairing process.

Once paired, you will be able to:

* Access the desktop
* Control applications
* Transfer files
* Stream games
* Manage the computer remotely

---

# Complete Workflow

```text
Phone / Laptop
       │
       ▼
Telegram Command
       │
       ▼
Telegram Bot API
       │
       ▼
MikroTik Router
       │
       ▼
Wake-on-LAN Packet
       │
       ▼
Desktop Computer
       │
       ▼
Tailscale VPN
       │
       ▼
Sunshine Host
       │
       ▼
Moonlight Client
       │
       ▼
Remote Desktop / Game Streaming
```

---

# Troubleshooting

## Computer Does Not Turn On

Verify:

* Wake-on-LAN enabled in BIOS
* Correct MAC address
* Correct MikroTik interface
* Computer connected to the network

---

## Telegram Bot Does Not Respond

Verify:

* Bot Token
* Chat ID
* Internet connectivity on MikroTik
* Scheduler execution

---

## Moonlight Cannot Connect

Verify:

* Tailscale running on both devices
* Sunshine service running
* Devices visible in Tailscale
* Firewall rules

---

# Security Recommendations

* Never publish your Telegram Bot Token
* Never publish your Chat ID
* Never publish internal IP addresses
* Never expose Sunshine directly to the internet
* Prefer Tailscale over port forwarding
* Rotate credentials periodically

---

WakeOnEarth was designed as a lightweight and practical remote power management solution using only existing infrastructure and open-source tools.
