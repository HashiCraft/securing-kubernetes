#!/bin/bash
show_cursor() {
    tput cnorm
}
hide_cursor() {
    tput civis
}

progress_bar()
{
    for x in {1..20}; do 
        printf -v XXX "%0*d" $((60 * ++i / 20))
        printf "\r\e[35m[\e[39m%-60s\e[35m]" "${XXX//0/\#}"
        printf "%4d%%" $((100 * ++j / 20))
        sleep 0.5
    done
}

hide_cursor
echo -e ""
echo -e "\e[35m                           :PB.Bk:                          "
echo -e "\e[35m                       ,jBˆ@B@B@B@BBL.                      "
echo -e "\e[35m                    7G–B“B•BMMMMMB@B@B@Nr                   "
echo -e "\e[35m                :kB’B.ˆ—MMOMOMOMOMMMMŒB˜B@B1,               "
echo -e "\e[35m            :5‘B.B˜BˆBBMMOMOMOMOMOMOMMŠ’nBnB@BBu.           "
echo -e "\e[35m         70n†•BˆB’B”BXBBOMOMOMOMOMOMMBMPB˜BˆB@B@B@Nr        "
echo -e "\e[35m       G˜–—BJ iBˆB‡ˆ  OBMOMOMOMOMOMOM–2  B.B@B. EB@B@S      "
echo -e "\e[35m       ’–BM‡GJBU.  iSuBˆOMOMOMOMOMOMM—OU1:  .kBLMˆM†B—      "
echo -e "\e[35m       BŒMMB™B       7ˆBBMMOMOMOMOMOBB–:       B‡BMMˆB      "
echo -e "\e[35m       .˜ˆBŠB         7’–@MMOMOMOMM@B@:         @@B@B@      "
echo -e "\e[35m       .’OLB.          BNB.MMOMOMM.BEB          rBjM„B      "
echo -e "\e[35m       .@  @           M  OBOMOMM@q  M          .@  @@      "
echo -e "\e[35m       „•OvB           B:uŒMMOMOMMBJiB          .BvM@B      "
echo -e "\e[35m       „B‘B˜J         0‘B—MMOMOMOMB•B@u         q@@@B@      "
echo -e "\e[35m       B„MBBŒv       G.‹BMMMMMMMMMMMBBˆ5       F„BMM@B      "
echo -e "\e[35m       ‡BBM.BPNi   LMEB…OMMMM.BƒMMOMMŠBZM7   rEqB‡MBB„      "
echo -e "\e[35m       B˜–„BM  BmB„B  qBMOMB.B…B„BMOMBL  B@B@B  @B@B@M      "
echo -e "\e[35m        J–m†„PB.B„B™B7GˆOMBB.   ,@MMM@qLB@B@@@BqB@BBv       "
echo -e "\e[35m           iGB•,i0„M–BnMMO‹E  :  M@OMM@@@B@Pii@@N:          "
echo -e "\e[35m              .   B—M.B.MMM@B@B@B@MMM@@@M@B                 "
echo -e "\e[35m                  @B@B.i@MBB@B@B@@BM@::B@B@                 "
echo -e "\e[35m                  B@@@ .B@B.:@B@ :B@B  @B@O                 "
echo -e "\e[35m                    :0 r@B@  B@@ .@B@: P:                   "
echo -e "\e[35m                        vMB :@B@ :BO7                       "
echo -e "\e[35m                            ,B@B                            "
echo -e ""
echo -e ""
sleep 1

echo "Scanning for vulnerabilities:"
sleep 1

echo ""
progress_bar
sleep 1

echo ""
echo ""
echo -e "\e[5m\e[1m1\e[22m\e[5m vulnerability found:"
sleep 0.5

echo ""
echo -e "\e[39mJavascript"
echo -e "\e[2m------------------------------------------------------------\e[22m"
echo -e "* \e[39mDust.js - Remote code exploit"
echo -e "  \e[2mhttps://artsploit.blogspot.com/2016/08/pprce2.html\e[22m"
echo ""
show_cursor
