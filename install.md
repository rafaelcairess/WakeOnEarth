# ⚙ Installation Guide

This guide explains how to deploy WakeOnEarth on a MikroTik RouterOS device.

## Requirements

* MikroTik RouterOS v6+
* Telegram account
* Telegram Bot Token
* Target computer with Wake-on-LAN enabled
* Local network access to the target device

---

## 1. Create a Telegram Bot

Open Telegram and start a conversation with:

```text
@BotFather
```

Create a new bot:

```text
/ newbot
```

Save the generated Bot Token.

Example:

```text
123456789:ABCDEFxxxxxxxxxxxxxxxxxxxxxxxx
```

---

## 2. Obtain Your Chat ID

Send a message to your bot.

Open:

```text
https://api.telegram.org/botYOUR_BOT_TOKEN/getUpdates
```

Locate your Chat ID in the JSON response.

---

## 3. Enable Wake-on-LAN

On the target computer:

* Enable Wake-on-LAN in BIOS/UEFI
* Enable Wake-on-LAN in the operating system
* Confirm the network adapter supports WOL

---

## 4. Configure the Script

Edit the following values inside:

```text
mikrotik/wakeonearth.rsc
```

Replace:

```text
YOUR_BOT_TOKEN
YOUR_CHAT_ID
XX:XX:XX:XX:XX:XX
192.168.X.X
```

With your own environment information.

---

## 5. Import the Script

Upload the file to your MikroTik router.

Import it using:

```routeros
/import wakeonearth.rsc
```

---

## 6. Create a Scheduler

Create a scheduler entry that runs every minute.

Suggested configuration:

```text
Name: WakeOnEarth
Interval: 1m
```

---

## 7. Test Commands

Send the following commands to your Telegram bot:

```text
turnon
status
internet
```

---

## Troubleshooting

### Computer does not turn on

Verify:

* Wake-on-LAN is enabled
* Correct MAC address is configured
* Correct interface is configured
* Computer is connected to the network

### Bot does not respond

Verify:

* Telegram Bot Token
* Chat ID
* Internet access on MikroTik
* Scheduler execution

---

## Security Recommendations

* Never publish your Bot Token
* Never publish internal IP addresses
* Never publish production infrastructure information
* Restrict bot access whenever possible

---

WakeOnEarth was designed as a lightweight and practical remote power management solution using only existing network infrastructure.
