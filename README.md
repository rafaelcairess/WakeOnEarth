# 🌍 WakeOnEarth

**Turn on and access a computer from anywhere using Telegram and a MikroTik router.**

<p align="left">
  <img alt="MikroTik RouterOS" src="https://img.shields.io/badge/MikroTik-RouterOS-293239?style=flat-square&logo=mikrotik">
  <img alt="Telegram Bot API" src="https://img.shields.io/badge/Telegram-Bot_API-26A5E4?style=flat-square&logo=telegram&logoColor=white">
  <img alt="Wake-on-LAN" src="https://img.shields.io/badge/Wake--on--LAN-2ea44f?style=flat-square">
</p>

## Why I built it

I wanted to access my home computer while away without leaving it powered on 24/7 or buying extra hardware.

Since my MikroTik router was already always online, I turned it into a lightweight remote power controller. A Telegram message makes the router send a Wake-on-LAN packet to the computer. Once it starts, I can connect securely with Tailscale and use Sunshine + Moonlight for remote access.

This is a small project, but it solves a real problem in my daily life.

## How it works

```text
Telegram command
       ↓
MikroTik RouterOS
       ↓ Wake-on-LAN
Home computer
       ↓
Tailscale + Sunshine + Moonlight
```

No Raspberry Pi, smart plug, dedicated server, or open inbound ports are required.

## What it demonstrates

- Network automation with RouterOS scripting
- Integration with the Telegram Bot API
- Wake-on-LAN and ICMP network diagnostics
- Scheduled task execution and update tracking
- A practical remote-access workflow focused on simplicity and security

## Commands

| Command | Result |
| --- | --- |
| `turnon` | Sends the Wake-on-LAN packet |
| `status` | Checks whether the computer is online |
| `internet` | Reports internet availability and latency |

## Technologies

`MikroTik RouterOS` · `Telegram Bot API` · `Wake-on-LAN` · `Tailscale` · `Sunshine` · `Moonlight`

## Try it

The RouterOS script is available at [`mikrotik/mikrotik.rsc`](mikrotik/mikrotik.rsc). Replace the bot token, chat ID, MAC address, target IP, and network interface with your own values.

See the [installation guide](install.md) for the complete setup.

> [!IMPORTANT]
> Keep your bot token private. The current script does not validate the sender of an incoming command, so use a private bot and add sender validation before sharing it with other users or groups.

## Author

Created by **Rafael Caires Pires**, NOC Analyst focused on networking, Linux, Python, and automation.

[GitHub](https://github.com/rafaelcairess) · [LinkedIn](https://www.linkedin.com/in/rafael-caires-pires-58225b238)

---

If this project was useful or gave you an idea, consider leaving a star. ⭐
