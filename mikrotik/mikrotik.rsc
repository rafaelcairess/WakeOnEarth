# ==========================================
# WakeOnEarth
# Telegram Wake-on-LAN for MikroTik RouterOS
# ==========================================
#
# Replace:
# YOUR_BOT_TOKEN
# YOUR_CHAT_ID
# XX:XX:XX:XX:XX:XX
# 192.168.X.X
#
# Recommended Scheduler:
# Interval: 1m
#
# Commands:
# turnon
# status
# internet
#
# ==========================================

:global wolLastOffset;

:local token "YOUR_BOT_TOKEN";
:local chatid "YOUR_CHAT_ID";

:if ([:len $wolLastOffset] = 0) do={
    :set wolLastOffset "0";
};

:local url ("https://api.telegram.org/bot" . $token . "/getUpdates?offset=" . $wolLastOffset . "&limit=1");

:local result [/tool fetch url=$url as-value output=user];
:local body ($result->"data");

:if ([:find $body "update_id" -1] > 0) do={

    :local start ([:find $body "update_id\":"] + 11);
    :local end [:find $body "," $start];
    :local uid [:pick $body $start $end];

    :set wolLastOffset ([:tonum $uid] + 1);

    /tool fetch \
        url=("https://api.telegram.org/bot" . $token . "/getUpdates?offset=" . $wolLastOffset . "&limit=1") \
        keep-result=no;

    # ======================================
    # TURN ON PC
    # ======================================

    :if ([:find $body "\"text\":\"turnon\"" -1] > 0) do={

        /tool wol \
            mac=XX:XX:XX:XX:XX:XX \
            interface=Bridge-LAN;

        /tool fetch \
            url=("https://api.telegram.org/bot" . $token . "/sendMessage?chat_id=" . $chatid . "&text=Wake-on-LAN packet sent successfully.") \
            keep-result=no;
    };

    # ======================================
    # PC STATUS
    # ======================================

    :if ([:find $body "\"text\":\"status\"" -1] > 0) do={

        :local ping [/ping 192.168.X.X count=3 as-value];
        :local loss ($ping->"packet-loss");

        :if ($loss = 0) do={

            /tool fetch \
                url=("https://api.telegram.org/bot" . $token . "/sendMessage?chat_id=" . $chatid . "&text=Computer is online and responding.") \
                keep-result=no;

        } else={

            /tool fetch \
                url=("https://api.telegram.org/bot" . $token . "/sendMessage?chat_id=" . $chatid . "&text=Computer is offline.") \
                keep-result=no;
        };
    };

    # ======================================
    # INTERNET TEST
    # ======================================

    :if ([:find $body "\"text\":\"internet\"" -1] > 0) do={

        :local ping [/ping 8.8.8.8 count=5 as-value];
        :local loss ($ping->"packet-loss");
        :local rtt ($ping->"avg-rtt");

        :if ($loss = 100) do={

            /tool fetch \
                url=("https://api.telegram.org/bot" . $token . "/sendMessage?chat_id=" . $chatid . "&text=Internet connection unavailable.") \
                keep-result=no;

        } else={

            :if ($rtt < 50) do={

                /tool fetch \
                    url=("https://api.telegram.org/bot" . $token . "/sendMessage?chat_id=" . $chatid . "&text=Internet quality: Excellent (" . $rtt . "ms)") \
                    keep-result=no;

            } else={

                :if ($rtt < 150) do={

                    /tool fetch \
                        url=("https://api.telegram.org/bot" . $token . "/sendMessage?chat_id=" . $chatid . "&text=Internet quality: Good (" . $rtt . "ms)") \
                        keep-result=no;

                } else={

                    /tool fetch \
                        url=("https://api.telegram.org/bot" . $token . "/sendMessage?chat_id=" . $chatid . "&text=Internet quality: Poor (" . $rtt . "ms)") \
                        keep-result=no;
                };
            };
        };
    };
}